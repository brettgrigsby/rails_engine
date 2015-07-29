class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices

  def total_revenue
    invoices.successful.joins(:invoice_items).sum("quantity * unit_price").to_i
  end

  def total_items
    invoices.successful.joins(:invoice_items).sum(:quantity)
  end

  def self.most_revenue(count)
    all.sort_by { |m| m.total_revenue }.last(count).reverse
  end

  def self.most_items(count)
    all.sort_by { |m| m.total_items }.last(count).reverse
  end

  def revenue_for_date(date)
    invoices.successful.where(created_at: date).joins(:invoice_items).sum("quantity * unit_price").to_i
  end

  def self.revenue_for_date(date)
    all.map { |m| m.revenue_for_date(date) }
  end

  def favorite_customer
    hash = Hash.new(0)
    customers.map { |c| hash[c] += 1 }
    hash.max
  end

  def customers_with_pending_invoices
    (invoices - invoices.successful).map { |i| i.customer }.uniq
  end
end

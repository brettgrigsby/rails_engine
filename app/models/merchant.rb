class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices

  def total_revenue
    invoices.successful.joins(:invoice_items).sum("quantity * unit_price") / 100
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
    day = date.to_date
    invoices.successful.where(created_at: day.beginning_of_day..day.end_of_day).joins(:invoice_items).sum("quantity * unit_price") /100
  end

  def self.revenue_for_date(date)
    day = date.to_date
    joins(:invoices).merge(Invoice.successful).where(invoices: {created_at: day.beginning_of_day..day.end_of_day}).includes(:invoice_items).sum("quantity * unit_price") / 100
  end

  def favorite_customer
    hash = Hash.new(0)
    customers.map { |c| hash[c] += 1 }
    [hash.max.first]
  end

  def customers_with_pending_invoices
    (invoices - invoices.successful).map { |i| i.customer }.uniq
  end
end

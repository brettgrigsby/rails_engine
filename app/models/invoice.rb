class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions

  def revenue
    invoice_items.pluck(:quantity, :unit_price).reduce(0) do |sum, values|
      sum + (values.first * values.last)
    end
  end

  def self.successful
    joins(:transactions).where(transactions: { result: 'success' })
  end
end

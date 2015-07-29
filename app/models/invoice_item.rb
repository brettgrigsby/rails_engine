class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice

  def revenue
    quantity * unit_price
  end
end

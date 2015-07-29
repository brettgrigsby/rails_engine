class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :merchants, through: :invoices


  def favorite_merchant
    hash = Hash.new(0)
    merchants.map { |c| hash[c] += 1 }
    hash.max
  end
end

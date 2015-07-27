class ChangeDataTypeOnTransactions < ActiveRecord::Migration
  def change
    remove_column :transactions, :credit_card_number
    add_column :transactions, :credit_card_number, :string
  end
end

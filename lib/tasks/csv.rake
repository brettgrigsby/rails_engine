require 'csv'

task csv: :environment do
  desc "parse csv file to get AR data"

    csv_text = File.read('./public/csvs/customers.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Customer.create(row.to_h)
    end

    csv_text = File.read('./public/csvs/merchants.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Merchant.create(row.to_h)
    end

    csv_text = File.read('./public/csvs/items.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Item.create(row.to_h)
    end

    csv_text = File.read('./public/csvs/invoices.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Invoice.create(row.to_h)
    end

    csv_text = File.read('./public/csvs/invoice_items.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      InvoiceItem.create(row.to_h)
    end

    csv_text = File.read('./public/csvs/transactions.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Transaction.create(row.to_h.except('credit_card_expiration_date'))
    end
end

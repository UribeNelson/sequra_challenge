# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'merchants.csv'))
csv = CSV.parse(csv_text, :headers => false, :encoding => 'UTF-8')
csv.each do |row|
  t = Merchant.new
  t.name = row[1]
  t.email = row[2]
  t.cif = row[3]
  t.save
  puts "#{t.name}, #{t.cif} saved"
end

puts "There are now #{Merchant.count} rows in the merchants table"


csv_text = File.read(Rails.root.join('lib', 'seeds', 'shoppers.csv'))
csv = CSV.parse(csv_text, :headers => false, :encoding => 'UTF-8')
csv.each do |row|
  t = Shopper.new
  t.name = row[1]
  t.email = row[2]
  t.nif = row[3]
  t.save
  puts "#{t.name}, #{t.nif} saved"
end

puts "There are now #{Shopper.count} rows in the shoppers table"

csv_text = File.read(Rails.root.join('lib', 'seeds', 'orders.csv'))
csv = CSV.parse(csv_text, :headers => false, :encoding => 'UTF-8')
csv.each do |row|
  t = Order.new
  t.merchant_id = row[1]
  t.shopper_id = row[2]
  t.amount = row[3]
  t.created_at = Time.parse(row[4])
  t.completed_at = Time.parse(row[5]) unless row[5].nil?
  t.save
  puts "#{t.id}, #{t.amount} saved"
end

puts "There are now #{Order.count} rows in the orders table"

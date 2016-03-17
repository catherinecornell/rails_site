require 'rubygems'
require 'recurly'

# To set a default currency for your API requests:
Recurly.default_currency = 'USD'


Recurly::Transaction.find_each do |transaction|
  puts "Transaction: #{transaction.amount_in_cents}, 
  #{transaction.status}, 
  #{transaction.created_at}"
end
 


ActiveRecord::Base.establish_connection( 
:adapter => "mysql",  
:host => "localhost",  
:database => "dashboard_data"
) 

class Recurly < ActiveRecord::Base
end 



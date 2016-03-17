require 'sinatra'
require 'active_record'

ActiveRecord::Base.establish_connection( 
:adapter => "mysql",  
:host => "localhost",  
:database => "dashboard_data"
) 

class Checks < ActiveRecord::Base
end  

class Payments < ActiveRecord::Base 
end 

class Restaurants < ActiveRecord::Base 
end  

class Recurly < ActiveRecord::Base 
end  

def execute_statement(sql)
        results = ActiveRecord::Base.connection.execute(sql)
        if results.present?
            return results
        else
            return nil
        end
    end



get '/' do
  erb :datepicker

end

get '/dashboardhome' do
  print(@checkcounts = execute_statement("select day, total_check_count from Checks where day > '2016-02-18';").to_a)
  print(@sumpayments = execute_statement("select date, value from Payments where date > '2016-02-18';").to_a)
  restaurants = execute_statement("select value from Restaurants having max(date);").to_a
  print @countrestaurants = restaurants[0][0].to_i
  subscriptions_data = execute_statement("select sum_success, count_declined, count_success from Recurly having max(date);")
  subscriptions = subscriptions_data.to_a
  @subscriptions = subscriptions[0][0].to_i
  @subscriptions = @subscriptions.to_s.reverse.scan(/\d{1,3}/).join(",").reverse 
  @count_declined = subscriptions[0][1].to_f
  @count_success = subscriptions[0][2].to_f
  @successpercent = (((@count_declined/@count_success)*100).round(2))
  print @subscriptions
  print @successpercent
  erb :dashboardhome
end

get '/checks' do
 
end

#get '/payments' do
  #print @payments = 'select count(distinct(restaurant_id) from payments
  #where date(created_at) between #{start_date} and #{end_date} group by type limit 4'
   #erb :payments
#end

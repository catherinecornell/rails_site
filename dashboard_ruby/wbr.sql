ActiveRecord::Base.establish_connection(
  :adapter  => "mysql2",
  :database => "db"
  
)


select sum(amount) from payments
where create_date between '2016-01-31 00:00:00' and '2016-02-06 00:00:00' 

select sum(p.amount) as sales, t.name from payments p
inner join tenders t on t.id = p.tender_id
where p.created_at between 
group by t.name
order by sales desc


select count(distinct(restaurant_id) from payments
where create_date between '2016-01-31 00:00:00' and '2016-02-06 00:00:00' 



select count(distinct(id)) from restaurants
where status=1

select count(c.id) from checks c
where c.create_date between '2016-01-31 00:00:00' and '2016-02-06 00:00:00' 
group by c.type


select count(distinct(r.id)) from restaurants r 
where r.use_gratuity = 1

select count(distinct(r.id)) from restaurants r 
inner join tax_rates tr on tr.id = r.autograt_tax_rate_id
where r.use_gratuity = 1

select count(distinct(restaurant_id)) from payments
where tip_amount > 0 and created_at between '2016-01-31 00:00:00' and '2016-02-06 00:00:00'

select count(distinct(t.id)) from tenders t
inner join tender_descriptions td on td.tender_id = t.id
where td.status=2 and td.updated_at between '2016-01-31 00:00:00' and '2016-02-06 00:00:00'

select count(distinct(pu.id)) from pos_users pu
inner join restaurants r on r.id = pu.restaurant_id
where pu.subscribed_weekly=1 OR pu.subscribed_monthly= 1 OR pu.subscribed_daily=1 and r.status=1

select count(distinct(restaurant_id)) from sections s
inner join timing_masks tm on tm.owner_id = s.id
index=paygw sourcetype=breadcrumb-client signature "message.message"="Updating signature on payment" |table message.data_store_id |dedup message.data_store_id
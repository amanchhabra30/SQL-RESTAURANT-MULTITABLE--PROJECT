SELECT * FROM menu_items ;

SELECT * FROM order_details;

--how many items were ordered within this date range?
SELECT count(order_id) as  item_ordered
FROM order_details;

--which orders has most number of item?
SELECT order_id, count(item_id) as most_item
FROM order_details
group by order_id
ORDER BY most_item desc;

-- how many orders had more than 12 items?
SELECT count(*) FROM
(SELECT order_id,count(item_id) as highitem
FROM order_details
GROUP BY order_id
HAVING count(item_id) > 12) AS numofcount;

--combine the menu_items and order_details tables into a single table

SELECT * FROM menu_items 
JOIN order_details
ON menu_item_id=item_id

--what were the least and most ordered items? what categories were they in?
SELECT m.category , count(o.order_details_id) as orderitem
FROM menu_items m
join
order_details o
ON m.menu_item_id=o.item_id
GROUP BY category
order by orderitem desc limit 1;

SELECT m.category , count(o.order_details_id) as orderitem
FROM menu_items m
join
order_details o
ON m.menu_item_id=o.item_id
GROUP BY category
order by orderitem asc limit 1;

--what were the top 5 orders that spent the most money?

SELECT order_id, sum(m.price) as top
FROM order_details
left join
menu_items m
on item_id=m.menu_item_id
where m.price is not null
group by order_id
order by top desc limit 5;

--what are food items order on 6th to 8th january?
SELECT m.item_name,o.order_date
FROM menu_items m
join
order_details o
ON m.menu_item_id=o.item_id
where  o.order_date between '2023-01-06' and '2023-01-08';


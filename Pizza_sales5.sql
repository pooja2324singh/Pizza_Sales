-- Calulate Contibution  percentage of each pizzas type to total revenue. 
Select pizza_types.category,
round(sum(orders_details.quantity* pizzas.price) / (select
  round(sum(orders_details.quantity * pizzas.price), 2)
  as Total_Revenue from orders_details join pizzas
  on pizzas.pizza_id = orders_details.pizza_id) ) * 100 as revenue
from pizza_types join pizzas 
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join orders_details
on orders_details.pizza_id = pizzas.pizza_id
group by pizza_types.category order by revenue desc;

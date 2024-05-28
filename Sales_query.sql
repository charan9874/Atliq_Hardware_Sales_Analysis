Create database if not exists sales;
use Sales;

Q1). /* Show all customer records */

SELECT * FROM customers;

Q2). /* Show total number of customers */

select count(*) from customers;

Q3) /* Show transactions for Chennai market (market code for chennai is Mark001 */;

select t.* from transactions as t join markets as m on t.market_code=m.markets_code where m.markets_name='Chennai';

SELECT * FROM transactions where market_code='Mark001';
 
 
 Q4). /* Show distrinct product codes that were sold in chennai */
 
select distinct product_code from transactions where market_code='Mark001';

Q5). /* Show transactions where currency is US dollars  */

select * from transactions where currency='USD';

Q6). /* Show transactions in 2020 join by date table */

select t.* , d.* from transactions as t join date as d on d.date=t.order_date where year=2020;

Q7). /* Show total revenue in year 2020 */

SELECT 
    SUM(transactions.sales_amount) as  revenue
FROM
    transactions
        INNER JOIN
    date ON transactions.order_date = date.date
WHERE
    date.year = 2020
        AND transactions.currency = 'INR'
        OR transactions.currency = 'USD';
        
      select * from date;  
      
Q8) /* Show total revenue in year 2018, January Month */
     
SELECT 
    SUM(t.sales_amount) as revenue
FROM
    transactions as t
        INNER JOIN
    date as  d ON t.order_date = d.date
WHERE
    d.year = 2018
        AND d.month_name = 'January'
        AND (t.currency = 'INR'
        OR t.currency = 'USD');
        
Q9). /* Show total revenue in year 2019 in Chennai*/

 SELECT 
    SUM(transactions.sales_amount)
FROM
    transactions
        INNER JOIN
    date ON transactions.order_date = date.date
WHERE
    date.year = 2019
        AND transactions.market_code = 'Mark001';

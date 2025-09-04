
-- BASIC QUERIES 

# Total Property Listed
SELECT COUNT(*) AS total_properties
FROM real_estate_clean;

# Avg Property Price 
SELECT ROUND(AVG(property_price), 2) AS avg_price
FROM real_estate_clean;

# Properties group by region 
SELECT region, COUNT(*) AS total_listed
FROM real_estate_clean
GROUP BY region
ORDER BY total_listed DESC;

#Top 5 Large Property by Area
SELECT property_name, area_sqft
FROM real_estate_clean
ORDER BY area_sqft DESC
LIMIT 5;


#Properties with 3+ bedroom and 2+bathroom
SELECT property_name, city, bedrooms, bathrooms
FROM real_estate_clean
WHERE bedrooms >= 3 AND bathrooms >= 2;

-- AGENT AND BUYER QUERIES

#Properties sold by each agent 

SELECT agent_name, COUNT(*) AS total_sold
FROM real_estate_clean
GROUP BY agent_name
ORDER BY total_sold DESC;

#Buyer and their purchased properties price

SELECT buyer_name, property_name, sale_price
FROM real_estate_clean
ORDER BY sale_price DESC;

-- PRICE TRENDS QUERIES

# Avg price by city

SELECT city, ROUND(AVG(property_price), 2) AS avg_city_price
FROM real_estate_clean
GROUP BY city
ORDER BY avg_city_price DESC;

#Price trends using window function 

SELECT city, listed_date, property_price,
ROUND(AVG(property_price) OVER (PARTITION BY city ORDER BY listed_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS moving_avg
FROM real_estate_clean;

#Latest transaction
SELECT transaction_id, property_name, sale_price, transaction_date
FROM real_estate_clean
ORDER BY transaction_date DESC
LIMIT 5;

-- VISITOR TRACKING 

#Visitor track by date 
SELECT visit_date, COUNT(*) AS total_visits
FROM real_estate
GROUP BY visit_date
ORDER BY visit_date DESC;

#Visit in delhi
SELECT visitor_name, visit_date, city
FROM real_estate
WHERE city = 'Delhi';

#total visit per property
SELECT property_id, property_name, COUNT(visit_id) AS total_visits
FROM real_estate
GROUP BY property_id, property_name
ORDER BY total_visits DESC;

-- JOIN FUNCTION QUERIES

# Properties and their Agents (INNER JOIN)

SELECT p.property_id, p.property_name, a.agent_name, a.agent_region
FROM real_estate_clean p
INNER JOIN real_estate_clean a 
ON p.agent_id = a.agent_id;  
    
# Properties and their Buyers (LEFT JOIN)

SELECT p.property_id, p.property_name, p.city, b.buyer_name, b.buyer_city
FROM real_estate_clean p
LEFT JOIN real_estate_clean b 
ON p.buyer_id = b.buyer_id;

# Buyers and their Transactions (INNER JOIN)

SELECT b.buyer_name, b.buyer_city, t.transaction_id, t.sale_price, t.transaction_date
FROM real_estate_clean b
INNER JOIN real_estate_clean t 
ON b.transaction_id = t.transaction_id; 

# Agent Sales Performance (JOIN Properties with Transactions)

SELECT a.agent_name, COUNT(t.transaction_id) AS total_sold, SUM(t.sale_price) AS total_revenue
FROM real_estate_clean a
INNER JOIN real_estate_clean t 
    ON a.agent_id = t.agent_id
WHERE t.transaction_id IS NOT NULL
GROUP BY a.agent_name
ORDER BY total_revenue DESC;

# Property Visits with Visitor Info (JOIN on Visits)

SELECT p.property_id, p.property_name, v.visitor_name, v.visit_date
FROM real_estate_clean p
JOIN real_estate_clean v
ON p.visit_id = v.visit_id ;

# FULL OUTER JOIN (All Properties & Buyers)
 
SELECT p.property_id, p.property_name, b.buyer_name
FROM real_estate_clean p
LEFT JOIN real_estate_clean b ON p.buyer_id = b.buyer_id
UNION
SELECT p.property_id, p.property_name, b.buyer_name
FROM real_estate_clean p
RIGHT JOIN real_estate_clean b ON p.buyer_id = b.buyer_id;

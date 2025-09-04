create database real_estateDB ;
use real_estateDB ;
show databases;

-- create table real_estate_clean
-- import data into table

DROP TABLE IF EXISTS real_estate_clean ;

CREATE TABLE real_estate_clean (
    property_id INT,
    property_name VARCHAR(255),
    address TEXT,
    city VARCHAR(100),
    region VARCHAR(100),
    property_price VARCHAR(50),
    listed_date DATE,
    area_sqft INT,
    bedrooms INT,
    bathrooms INT,
    agent_name VARCHAR(100),
    agent_phone VARCHAR(50),
    agent_email VARCHAR(100),
    agent_region VARCHAR(100),
    agent_id INT,
    buyer_id INT,
    buyer_name VARCHAR(100),
    buyer_contact VARCHAR(50),
    buyer_email VARCHAR(100),
    buyer_city VARCHAR(100),
    transaction_id INT,
    sale_price VARCHAR(50),
    transaction_date DATE,
    property_address TEXT,
    visit_id INT,
    visitor_name VARCHAR(100),
    visit_date DATE
);


-- create table agent 

DROP TABLE IF EXISTS agent;
create table agent(
agent_id  int primary key,
agent_name VARCHAR(100),
agent_phone VARCHAR(50),
agent_email VARCHAR(100),
agent_region VARCHAR(100));

-- create table property

DROP TABLE IF EXISTS property;
create table property(
property_id  int primary key ,
property_name VARCHAR(255),
address TEXT,
city VARCHAR(100),
region VARCHAR(100),
property_price VARCHAR(50),
listed_date DATE,
area_sqft INT,
bedrooms INT,
bathrooms INT,
FOREIGN KEY(agent_id) REFERENCES agent(agent_id)
);

-- create table buyer

DROP TABLE IF EXISTS buyer;
create table buyer(
buyer_id  int primary key,
buyer_name VARCHAR(100),
buyer_contact VARCHAR(50),
buyer_email VARCHAR(100),
buyer_city VARCHAR(100)
);


-- create table transaction 
DROP TABLE IF EXISTS  transaction;
create table transaction(
transaction_id  int primary key,
property_id  int ,  
buyer_id  int , 
transaction_date  date,
sale_price VARCHAR(50) ,
FOREIGN KEY (property_id) REFERENCES property(property_id),
FOREIGN KEY (buyer_id) REFERENCES buyer(buyer_id));

-- create table visit 
 DROP TABLE IF EXISTS visit;
create table  visit(
visit_id  int primary key,
property_id  int  ,
visitor_name VARCHAR(100),
visit_date DATE);



ALTER TABLE agent
MODIFY agent_phone VARCHAR(30);

-- Insert Into agent

INSERT INTO agent(
agent_id ,agent_name, agent_phone , agent_email , agent_region
)

SELECT DISTINCT
agent_id ,agent_name, agent_phone, agent_email , agent_region 
from real_estate_clean
where agent_id is not null ;


ALTER TABLE property
MODIFY address VARCHAR(100);

-- Insert Into property
INSERT INTO property(
property_id  ,property_name,address ,city ,property_price ,listed_date,
area_sqft,bedrooms,bathrooms )

SELECT DISTINCT
property_id  ,property_name,address ,city ,property_price ,listed_date,
area_sqft,bedrooms,bathrooms 
from real_estate_clean
where property_id is not null;

ALTER TABLE buyer
MODIFY buyer_contact VARCHAR(30);

ALTER TABLE buyer
MODIFY buyer_name VARCHAR(30);

--  Insert Into buyer
INSERT INTO buyer(
buyer_id ,buyer_name ,buyer_contact ,buyer_email,buyer_city 
)
SELECT DISTINCT
buyer_id ,buyer_name ,buyer_contact ,buyer_email,buyer_city 
from real_estate_clean
where buyer_id is not null;

-- Insert Into transaction
INSERT INTO transaction(
transaction_id  ,property_id  ,  buyer_id , transaction_date ,sale_price )

SELECT DISTINCT
transaction_id  ,property_id  ,  buyer_id , transaction_date ,sale_price
from real_estate_clean
where transaction_id  is not null;


-- Insert Into visit 

INSERT INTO visit(
visit_id ,property_id ,visitor_name ,visit_date
)
SELECT DISTINCT
visit_id ,property_id ,visitor_name ,visit_date
from real_estate_clean
where visit_id  is not null;
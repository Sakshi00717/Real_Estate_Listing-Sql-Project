🏠 Real Estate Listing SQL Project
📌 Overview

This project is a Real Estate Listing Database designed to manage property details, agents, buyers, transactions, and visits. It helps track property sales, monitor agent performance, analyze price trends, and generate insights for decision-making.

The dataset contains information such as:

Property details (name, type, location, price, size, bedrooms, bathrooms, etc.)

Agents and owners managing the properties

Buyers and transactions (purchase details)

Visitor tracking (who visited which property and when)

🗄️ Database Schema

The database is structured as follows:

Property → Stores property listings

Agent → Real estate agents managing properties

Buyer → Buyer details

Transaction → Records of property sales

Visit → Tracks visitors and their property visits

Insights explored:
 -> Total Property Listed
 -> Avg Property Price 
 -> Properties group by region 
 -> Properties group by region using Limit
 -> Properties with 3+ bedroom and 2+bathroom
 -> Properties sold by each agent 
 -> Buyer and their purchased properties price
 -> Avg price by city
 -> Price trends using window function 
 -> Latest transaction
 -> Visit in delhi
 -> total visit per property
 -> Properties and their Agents (INNER JOIN)
 -> Properties and their Buyers (LEFT JOIN)
 -> Buyers and their Transactions (INNER JOIN)
 -> Agent Sales Performance (JOIN Properties with Transactions)
 -> Property Visits with Visitor Info (JOIN on Visits)
 -> FULL OUTER JOIN (All Properties & Buyers)
 

🛠️ Tech Stack

Database: MySQL Workbench

Language: SQL

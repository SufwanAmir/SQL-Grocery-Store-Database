# 🛒 SQL Grocery Store Database (PostgreSQL)

This project is a **PostgreSQL relational database** designed to manage the operations of a grocery store.  
It demonstrates database design, normalization, relationships, and SQL querying for real-world business scenarios.  

---

## 📂 Project Structure
- `grocery_store.sql` → Full database schema + sample data
- `ERD.png` → Entity Relationship Diagram (database design visualization)
- `README.md` → Project documentation and usage guide

---

## 🗄️ Database Design

The database consists of **5 core tables**:

1. **Products**  
   Stores details of all grocery items available.  
   - `product_id` (PK)  
   - `product_name`  
   - `price`  
   - `stock_quantity`  

2. **Customers**  
   Stores customer information.  
   - `customer_id` (PK)  
   - `name`  
   - `phone`  

3. **Sales**  
   Tracks each sale transaction.  
   - `sale_id` (PK)  
   - `customer_id` (FK → Customers)  
   - `sale_date`  
   - `total_amount`  

4. **Sale_Items**  
   Line items of each sale (products within a sale).  
   - `sale_item_id` (PK)  
   - `sale_id` (FK → Sales)  
   - `product_id` (FK → Products)  
   - `quantity`  
   - `price`  

5. **Inventory_Transactions**  
   Tracks stock changes (restocks, reductions).  
   - `trans_id` (PK)  
   - `product_id` (FK → Products)  
   - `trans_type`  
   - `quantity_change`  
   - `trans_date`  

---

## 📊 Features
- ✅ Product catalog with stock & pricing  
- ✅ Customer management  
- ✅ Sales tracking with multiple items per sale  
- ✅ Inventory transaction log (stock adjustments)  
- ✅ Sample data included for testing & learning  

---

## 🚀 How to Run

1. **Create a new database** in PostgreSQL:
   ```sql
   CREATE DATABASE grocery_store;

2. **Import the SQL script** inside psql or pgAdmin:

\i grocery_store.sql


The schema and sample records will be created automatically.

---

## 🔍 Example Queries

You can run queries such as:

Get all products in stock:

SELECT product_name, price, stock_quantity
FROM Products
WHERE stock_quantity > 0;


Find total sales made by each customer:

SELECT c.name, SUM(s.total_amount) AS total_spent
FROM Customers c
JOIN Sales s ON c.customer_id = s.customer_id
GROUP BY c.name;


Check inventory transaction history for a product:

SELECT p.product_name, i.trans_type, i.quantity_change, i.trans_date
FROM Inventory_Transactions i
JOIN Products p ON i.product_id = p.product_id
ORDER BY i.trans_date DESC;

---

## 🎯 Learning Outcomes

This project demonstrates:

Database design & normalization

Primary and foreign key relationships

Data insertion and querying

Real-world use case of SQL in retail/grocery management

✨ Built with PostgreSQL and structured for portfolio & academic showcase.
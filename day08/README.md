# 🗄️ Database Schema Engineering: DDL Mastery & Referential Integrity

<div align="center">

![Oracle](https://img.shields.io/badge/ORACLE-F80000?style=for-the-badge&logo=oracle&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)

</div>

<hr style="border: 1px solid rgb(98, 117, 187)">

<div align="center">
<table>
<tr>
<td align="center">
<br />
<img src="../favicon.png" width="120" height="120" style="border-radius: 50%; object-fit: cover;">
<h3>© 2026 Avinash Dhanuka</h3>
<p><b>DDL Commands & Database Architecture Design</b></p>
<p><em>Building Robust Relational Structures with Integrity Constraints</em></p>

<a href="https://mail.google.com/mail/?view=cm&fs=1&to=avunashdhanuka@gmail.com&su=Technical%20Inquiry:%20DDL%20Commands%20%26%20Schema%20Design&body=🗄️%20Hello%20Avinash,%0D%0A%0D%0AI%20am%20[Your%20Name],%20studying%20your%20DDL%20and%20Schema%20Design%20guide.%0D%0A%0D%0A🔹%20Topic:%20[e.g.,%20Constraints%20/%20Foreign%20Keys%20/%20ALTER]%0D%0A🔹%20Database:%20[Oracle,%20MySQL,%20Postgres]%0D%0A🔹%20Question:%20[Your%20specific%20doubt]%0D%0A%0D%0AThank%20you!" target="_blank">

<img src="https://img.shields.io/badge/📧_Contact_Me_via_Gmail-2563EB?style=for-the-badge&logo=gmail&logoColor=white" alt="Gmail">

</a>
<br />
<br />
</td>
</tr>
</table>
</div>

> **Author's Note:** This guide transitions from querying data to BUILDING data structures. We explore DDL (Data Definition Language) commands that form the architectural foundation of relational databases—creating tables, defining constraints, establishing relationships, and ensuring data integrity at the schema level.

---

## 📑 Table of Contents
1.  [DDL vs DML: The Fundamental Divide](#1-ddl-vs-dml-the-fundamental-divide)
2.  [Table Inspection Commands](#2-table-inspection-commands)
    -   [SHOW TABLES & DESCRIBE](#21-show-tables--describe)
    -   [SHOW CREATE TABLE](#22-show-create-table)
3.  [ALTER TABLE: Schema Modification](#3-alter-table-schema-modification)
    -   [MODIFY Column Data Type](#31-modify-column-data-type)
    -   [ADD Column](#32-add-column)
    -   [DROP Column](#33-drop-column)
    -   [RENAME Column](#34-rename-column)
4.  [INSERT Operations: Bulk Data Loading](#4-insert-operations-bulk-data-loading)
    -   [Single Row Insert](#41-single-row-insert)
    -   [Multi-Row Insert](#42-multi-row-insert)
    -   [Handling NULL Values](#43-handling-null-values)
5.  [Constraint Deep Dive](#5-constraint-deep-dive)
    -   [PRIMARY KEY Architecture](#51-primary-key-architecture)
    -   [FOREIGN KEY & Referential Integrity](#52-foreign-key--referential-integrity)
    -   [UNIQUE vs PRIMARY KEY](#53-unique-vs-primary-key)
    -   [CHECK Constraints](#54-check-constraints)
    -   [NOT NULL Enforcement](#55-not-null-enforcement)
6.  [Relationship Patterns](#6-relationship-patterns)
    -   [One-to-Many (1:N)](#61-one-to-many-1n)
    -   [Many-to-Many (M:N) with Junction Tables](#62-many-to-many-mn-with-junction-tables)
7.  [AUTO_INCREMENT: Identity Columns](#7-auto_increment-identity-columns)
8.  [DROP vs TRUNCATE vs DELETE](#8-drop-vs-truncate-vs-delete)
9.  [Practical Schema Design: Customer-Product System](#9-practical-schema-design-customer-product-system)
10. [🧠 Advanced Interview Questions](#10--advanced-interview-questions)

---

## 1. DDL VS DML: THE FUNDAMENTAL DIVIDE

**Definition:** SQL commands are categorized based on their purpose and behavior.

### 📊 Command Classification

| Category | Full Form | Purpose | Examples | Rollback? |
| :--- | :--- | :--- | :--- | :--- |
| **DDL** | Data Definition Language | Define/Modify Structure | CREATE, ALTER, DROP, TRUNCATE, RENAME | ❌ No (Auto-Commit) |
| **DML** | Data Manipulation Language | Manipulate Data | INSERT, UPDATE, DELETE, SELECT | ✅ Yes |
| **DCL** | Data Control Language | Control Access | GRANT, REVOKE | ❌ No |
| **TCL** | Transaction Control Language | Manage Transactions | COMMIT, ROLLBACK, SAVEPOINT | N/A |

### 🔍 Key Differences: DDL vs DML

**DDL Characteristics:**
*   Changes the **Schema** (structure).
*   **Auto-Commits** immediately (cannot be rolled back).
*   Affects **Metadata** (Data Dictionary).
*   Examples: Adding a column, creating a table.

**DML Characteristics:**
*   Changes the **Data** (content).
*   Part of a **Transaction** (can be rolled back).
*   Affects **Rows** in tables.
*   Examples: Inserting records, updating salaries.

### ⚠️ Critical Rule: TRUNCATE is DDL

Many developers mistakenly think `TRUNCATE` is DML because it removes data. However:
*   `TRUNCATE` is **DDL** (cannot be rolled back).
*   `DELETE` is **DML** (can be rolled back).

---

## 2. TABLE INSPECTION COMMANDS

### 2.1 SHOW TABLES & DESCRIBE

**Purpose:** View available tables and their structure.

**Syntax:**
```sql
-- List all tables in current database
SHOW TABLES;

-- View table structure
DESCRIBE table_name;
DESC table_name;  -- Shorthand
```

**Example Output:**

```sql
DESCRIBE CUSTOMER;
```

| Field | Type | Null | Key | Default | Extra |
| :--- | :--- | :--- | :--- | :--- | :--- |
| CID | int | NO | PRI | NULL | |
| CNAME | varchar(20) | NO | | NULL | |
| CNO | bigint | NO | UNI | NULL | |
| ADDRESS | varchar(50) | YES | | NULL | |

**Column Explanation:**
*   **Field:** Column name
*   **Type:** Data type
*   **Null:** Can it store NULL? (YES/NO)
*   **Key:** PRI (Primary), UNI (Unique), MUL (Multiple/Foreign)
*   **Default:** Default value if not specified
*   **Extra:** Additional properties (auto_increment, etc.)

---

### 2.2 SHOW CREATE TABLE

**Purpose:** View the exact DDL statement used to create the table.

**Syntax:**
```sql
SHOW CREATE TABLE table_name;
```

**Example:**
```sql
SHOW CREATE TABLE CUSTOMER;
```

**Output:**
```sql
CREATE TABLE `CUSTOMER` (
  `CID` int NOT NULL,
  `CNAME` varchar(20) NOT NULL,
  `CNO` bigint NOT NULL,
  `ADDRESS` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CID`),
  UNIQUE KEY `CNO` (`CNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

**Use Cases:**
*   Backup table structure.
*   Replicate table in another database.
*   Understand constraint definitions.

---

## 3. ALTER TABLE: SCHEMA MODIFICATION

**Definition:** The `ALTER TABLE` command modifies an existing table's structure without recreating it.

### 3.1 MODIFY COLUMN DATA TYPE

**Purpose:** Change the data type or constraints of an existing column.

**Syntax:**
```sql
ALTER TABLE table_name
MODIFY column_name new_datatype [constraints];
```

**Example: Expand Phone Number Storage**
```sql
ALTER TABLE CUSTOMER
MODIFY CNO BIGINT NOT NULL;
```

**Why BIGINT?**
*   `INT` range: -2,147,483,648 to 2,147,483,647
*   Indian phone numbers (10 digits): 9876543210 exceeds INT range.
*   `BIGINT` range: -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807

### 📊 Data Type Comparison

| Type | Storage | Range | Use Case |
| :--- | :--- | :--- | :--- |
| **TINYINT** | 1 byte | -128 to 127 | Age, Status Codes |
| **INT** | 4 bytes | ±2.1 billion | IDs, Counts |
| **BIGINT** | 8 bytes | ±9.2 quintillion | Phone Numbers, Large IDs |
| **DECIMAL(p,s)** | Variable | Exact precision | Money, Prices |

---

### 3.2 ADD COLUMN

**Purpose:** Add a new column to an existing table.

**Syntax:**
```sql
ALTER TABLE table_name
ADD column_name datatype [constraints];
```

**Example:**
```sql
ALTER TABLE CUSTOMER
ADD EMAIL VARCHAR(50) UNIQUE;
```

**Behavior:**
*   Existing rows get `NULL` (or default value) for the new column.
*   If you add `NOT NULL` without a default, it fails if table has data.

---

### 3.3 DROP COLUMN

**Purpose:** Remove a column from the table.

**Syntax:**
```sql
ALTER TABLE table_name
DROP COLUMN column_name;
```

**Example:**
```sql
ALTER TABLE CUSTOMER
DROP COLUMN ADDRESS;
```

**⚠️ Warning:**
*   This is **irreversible** (data is permanently lost).
*   Cannot drop columns involved in constraints without dropping the constraint first.

---

### 3.4 RENAME COLUMN

**Purpose:** Change a column's name.

**Syntax (MySQL 8.0+):**
```sql
ALTER TABLE table_name
RENAME COLUMN old_name TO new_name;
```

**Example:**
```sql
ALTER TABLE CUSTOMER
RENAME COLUMN CNO TO PHONE_NUMBER;
```

**Database Support:**

| Database | Syntax |
| :--- | :--- |
| MySQL 8.0+ | `RENAME COLUMN old TO new` |
| Oracle | `RENAME COLUMN old TO new` |
| PostgreSQL | `RENAME COLUMN old TO new` |
| SQL Server | `EXEC sp_rename 'table.old', 'new', 'COLUMN'` |

---

## 4. INSERT OPERATIONS: BULK DATA LOADING

### 4.1 SINGLE ROW INSERT

**Syntax:**
```sql
INSERT INTO table_name (col1, col2, col3)
VALUES (val1, val2, val3);
```

**Example:**
```sql
INSERT INTO CUSTOMER (CID, CNAME, CNO, ADDRESS)
VALUES (1, 'Avinash', 9876543210, 'Mumbai');
```

---

### 4.2 MULTI-ROW INSERT

**Purpose:** Insert multiple rows in a single statement (more efficient than multiple single inserts).

**Syntax:**
```sql
INSERT INTO table_name (col1, col2, col3)
VALUES 
    (val1, val2, val3),
    (val4, val5, val6),
    (val7, val8, val9);
```

**Example:**
```sql
INSERT INTO CUSTOMER (CID, CNAME, CNO, ADDRESS) VALUES
(1,  'Avinash', 9876543210, 'Mumbai'),
(2,  'Rahul',   9123456789, 'Delhi'),
(3,  'Sneha',   9988776655, 'Pune'),
(4,  'Amit',    9112233445, 'Bangalore'),
(5,  'Neha',    9090909090, 'Chennai');
```

### 🚀 Performance Benefits

**Single Inserts (5 statements):**
*   5 network round-trips
*   5 transaction commits
*   5 index updates

**Multi-Row Insert (1 statement):**
*   1 network round-trip
*   1 transaction commit
*   1 batch index update

**Result:** Multi-row inserts are **10-100x faster** for bulk operations.

---

### 4.3 HANDLING NULL VALUES

**Explicit NULL:**
```sql
INSERT INTO CUSTOMER (CID, CNAME, CNO, ADDRESS)
VALUES (10, 'Vikas', 9555666777, NULL);
```

**Implicit NULL (Omit Column):**
```sql
INSERT INTO CUSTOMER (CID, CNAME, CNO)
VALUES (11, 'Priya', 9876543345);
-- ADDRESS automatically becomes NULL
```

**⚠️ Constraint Violation:**
```sql
-- This FAILS because CNAME is NOT NULL
INSERT INTO CUSTOMER (CID, CNO, ADDRESS)
VALUES (12, 9999999999, 'Kolkata');
-- Error: Column 'CNAME' cannot be null
```

---

## 5. CONSTRAINT DEEP DIVE

**Definition:** Constraints are rules enforced at the database level to maintain data integrity.

### 5.1 PRIMARY KEY ARCHITECTURE

**Definition:** A column (or combination of columns) that uniquely identifies each row.

**Characteristics:**
*   **Uniqueness:** No duplicate values.
*   **NOT NULL:** Cannot contain NULL.
*   **Index:** Automatically creates a clustered index (in most databases).
*   **Limit:** Only ONE primary key per table.

**Syntax:**
```sql
CREATE TABLE ORDERS(
    ORDER_ID INT PRIMARY KEY,
    INFO VARCHAR(20)
);
```

**Composite Primary Key:**
```sql
CREATE TABLE ORDER_ITEMS(
    ORDER_ID INT,
    PRODUCT_ID INT,
    QUANTITY INT,
    PRIMARY KEY (ORDER_ID, PRODUCT_ID)
);
```

### 🔍 Internal Behavior

When you insert a row:
1. Database checks if PRIMARY KEY value already exists.
2. If exists → **Error: Duplicate entry**.
3. If NULL → **Error: Column cannot be null**.
4. If unique and not null → Insert succeeds, index updated.

---

### 5.2 FOREIGN KEY & REFERENTIAL INTEGRITY

**Definition:** A column that references the PRIMARY KEY of another table, establishing a parent-child relationship.

**Syntax:**
```sql
CREATE TABLE PRODUCT1 (
    P_ID INT, 
    O_ID INT REFERENCES ORDERS(ORDER_ID)
);
```

**Alternative Syntax (More Explicit):**
```sql
CREATE TABLE PRODUCT1 (
    P_ID INT PRIMARY KEY, 
    O_ID INT,
    FOREIGN KEY (O_ID) REFERENCES ORDERS(ORDER_ID)
);
```

### 🔗 Referential Integrity Rules

**Rule 1: Insert Validation**
```sql
-- This FAILS if ORDER_ID = 99 doesn't exist in ORDERS table
INSERT INTO PRODUCT1 VALUES (101, 99);
-- Error: Cannot add or update a child row: foreign key constraint fails
```

**Rule 2: Delete Restriction**
```sql
-- This FAILS if ORDER_ID = 1 is referenced in PRODUCT1
DELETE FROM ORDERS WHERE ORDER_ID = 1;
-- Error: Cannot delete or update a parent row: foreign key constraint fails
```

**Rule 3: NULL is Allowed**
```sql
-- This SUCCEEDS (orphan record)
INSERT INTO PRODUCT1 VALUES (102, NULL);
```

### 📐 Cascade Options

**ON DELETE CASCADE:** Automatically delete child records when parent is deleted.
```sql
FOREIGN KEY (O_ID) REFERENCES ORDERS(ORDER_ID) ON DELETE CASCADE
```

**ON DELETE SET NULL:** Set child foreign key to NULL when parent is deleted.
```sql
FOREIGN KEY (O_ID) REFERENCES ORDERS(ORDER_ID) ON DELETE SET NULL
```

**ON UPDATE CASCADE:** Update child foreign key when parent key changes.
```sql
FOREIGN KEY (O_ID) REFERENCES ORDERS(ORDER_ID) ON UPDATE CASCADE
```

---

### 5.3 UNIQUE VS PRIMARY KEY

| Feature | PRIMARY KEY | UNIQUE |
| :--- | :--- | :--- |
| **NULL Allowed** | ❌ No | ✅ Yes (one NULL) |
| **Multiple per Table** | ❌ No (only one) | ✅ Yes (multiple) |
| **Creates Index** | ✅ Yes (Clustered) | ✅ Yes (Non-Clustered) |
| **Purpose** | Identify row | Prevent duplicates |

**Example:**
```sql
CREATE TABLE EMPLOYEE(
    EMP_ID INT PRIMARY KEY,        -- Unique + Not Null
    EMAIL VARCHAR(50) UNIQUE,      -- Unique but can be NULL
    PHONE BIGINT UNIQUE            -- Another unique column
);
```

---

### 5.4 CHECK CONSTRAINTS

**Definition:** Validates data based on a condition before insertion/update.

**Syntax:**
```sql
CREATE TABLE CUSTOMER(
    CID INT PRIMARY KEY,
    CNAME VARCHAR(20) NOT NULL,
    CNO BIGINT CHECK(CNO > 0),
    AGE INT CHECK(AGE >= 18 AND AGE <= 100),
    EMAIL VARCHAR(50) CHECK(EMAIL LIKE '%@%.%')
);
```

**Example Validations:**
*   `CHECK(CNO > 0)`: Phone number must be positive.
*   `CHECK(AGE >= 18)`: Only adults allowed.
*   `CHECK(SALARY > 0)`: Salary cannot be negative.
*   `CHECK(GENDER IN ('M', 'F', 'O'))`: Limited options.

**⚠️ Limitation:**
CHECK constraints cannot reference other tables or use subqueries (use TRIGGERS for that).

---

### 5.5 NOT NULL ENFORCEMENT

**Definition:** Ensures a column must have a value (cannot be NULL).

**Syntax:**
```sql
CREATE TABLE PRODUCT(
    PID INT PRIMARY KEY,
    PNAME VARCHAR(20) NOT NULL,
    PRICE DECIMAL(10,2) NOT NULL DEFAULT 0.00
);
```

**Behavior:**
```sql
-- This FAILS
INSERT INTO PRODUCT (PID, PRICE) VALUES (1, 100.00);
-- Error: Column 'PNAME' cannot be null

-- This SUCCEEDS
INSERT INTO PRODUCT (PID, PNAME, PRICE) VALUES (1, 'Laptop', 50000.00);
```

---

## 6. RELATIONSHIP PATTERNS

### 6.1 ONE-TO-MANY (1:N)

**Definition:** One record in Table A can relate to multiple records in Table B.

**Example:** One Customer can have Multiple Products.

**Schema:**
```sql
CREATE TABLE CUSTOMER(
    CID INT PRIMARY KEY,
    CNAME VARCHAR(20) NOT NULL
);

CREATE TABLE PRODUCT(
    PID INT PRIMARY KEY,
    PNAME VARCHAR(20) NOT NULL,
    CUSTOMER_ID INT,
    FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER(CID)
);
```

**Data Example:**

**CUSTOMER Table:**
| CID | CNAME |
| :--- | :--- |
| 1 | Avinash |
| 2 | Rahul |

**PRODUCT Table:**
| PID | PNAME | CUSTOMER_ID |
| :--- | :--- | :--- |
| 101 | Laptop | 1 |
| 102 | Mouse | 1 |
| 103 | Keyboard | 1 |
| 104 | Mobile | 2 |

**Relationship:** Customer 1 (Avinash) owns 3 products.

---

### 6.2 MANY-TO-MANY (M:N) WITH JUNCTION TABLES

**Definition:** Multiple records in Table A can relate to multiple records in Table B.

**Example:** Students can enroll in Multiple Courses, and Courses can have Multiple Students.

**Problem:** You cannot directly create M:N with a single foreign key.

**Solution:** Create a **Junction Table** (Bridge Table) that breaks M:N into two 1:N relationships.

**Schema:**
```sql
CREATE TABLE STUDENTS(
    STUDENT_ID INT PRIMARY KEY,
    STUDENT_NAME VARCHAR(50)
);

CREATE TABLE COURSES(
    COURSE_ID INT PRIMARY KEY,
    COURSE_NAME VARCHAR(50)
);

CREATE TABLE ENROLLMENTS(
    ENROLLMENT_ID INT PRIMARY KEY,
    STUDENT_ID INT,
    COURSE_ID INT,
    ENROLLMENT_DATE DATE,
    FOREIGN KEY(STUDENT_ID) REFERENCES STUDENTS(STUDENT_ID),
    FOREIGN KEY(COURSE_ID) REFERENCES COURSES(COURSE_ID)
);
```

**Data Example:**

**STUDENTS:**
| STUDENT_ID | STUDENT_NAME |
| :--- | :--- |
| 1 | Alice |
| 2 | Bob |

**COURSES:**
| COURSE_ID | COURSE_NAME |
| :--- | :--- |
| 101 | SQL |
| 102 | Python |

**ENROLLMENTS:**
| ENROLLMENT_ID | STUDENT_ID | COURSE_ID |
| :--- | :--- | :--- |
| 1 | 1 | 101 |
| 2 | 1 | 102 |
| 3 | 2 | 101 |

**Relationship:**
*   Alice is enrolled in SQL and Python.
*   Bob is enrolled in SQL.
*   SQL course has Alice and Bob.

---

## 7. AUTO_INCREMENT: IDENTITY COLUMNS

**Definition:** Automatically generates a unique number for each new row.

**Syntax (MySQL):**
```sql
CREATE TABLE STUDENTS (
    STUDENT_ID INT AUTO_INCREMENT PRIMARY KEY,
    FIRST_NAME VARCHAR(255),
    LAST_NAME VARCHAR(255)
);
```

**Behavior:**
```sql
INSERT INTO STUDENTS (FIRST_NAME, LAST_NAME)
VALUES ('John', 'Doe');
-- STUDENT_ID automatically becomes 1

INSERT INTO STUDENTS (FIRST_NAME, LAST_NAME)
VALUES ('Jane', 'Smith');
-- STUDENT_ID automatically becomes 2
```

### 🔍 Starting Value

**Set Starting Point:**
```sql
CREATE TABLE STUDENTS (
    STUDENT_ID INT AUTO_INCREMENT PRIMARY KEY,
    FIRST_NAME VARCHAR(255)
) AUTO_INCREMENT = 1000;
-- First ID will be 1000, then 1001, 1002...
```

### 📊 Database Syntax Comparison

| Database | Syntax |
| :--- | :--- |
| MySQL | `AUTO_INCREMENT` |
| PostgreSQL | `SERIAL` or `GENERATED ALWAYS AS IDENTITY` |
| SQL Server | `IDENTITY(1,1)` |
| Oracle | `GENERATED ALWAYS AS IDENTITY` (12c+) or Sequences |

---

## 8. DROP VS TRUNCATE VS DELETE

### 📊 Comparison Table

| Feature | DROP | TRUNCATE | DELETE |
| :--- | :--- | :--- | :--- |
| **Command Type** | DDL | DDL | DML |
| **Removes** | Table Structure + Data | All Data (keeps structure) | Specific Rows |
| **WHERE Clause** | ❌ No | ❌ No | ✅ Yes |
| **Rollback** | ❌ No | ❌ No | ✅ Yes |
| **Speed** | Instant | Very Fast | Slow (logs each row) |
| **Resets Identity** | N/A | ✅ Yes | ❌ No |
| **Triggers** | ❌ Not Fired | ❌ Not Fired | ✅ Fired |

### 📐 Examples

**DROP TABLE:**
```sql
DROP TABLE STUDENTS;
-- Table no longer exists
-- Cannot SELECT, INSERT, or do anything
```

**TRUNCATE TABLE:**
```sql
TRUNCATE TABLE STUDENTS;
-- Table exists but empty
-- AUTO_INCREMENT resets to 1
-- Cannot be rolled back
```

**DELETE:**
```sql
DELETE FROM STUDENTS WHERE STUDENT_ID = 5;
-- Only row with ID 5 is removed
-- Can be rolled back (if in transaction)
-- AUTO_INCREMENT does NOT reset
```

---

## 9. PRACTICAL SCHEMA DESIGN: CUSTOMER-PRODUCT SYSTEM

### 📐 Complete Implementation

**Step 1: Create Parent Table**
```sql
CREATE TABLE CUSTOMER(
    CID INT PRIMARY KEY,
    CNAME VARCHAR(20) NOT NULL,
    CNO BIGINT NOT NULL UNIQUE CHECK(CNO > 0),
    ADDRESS VARCHAR(50)
);
```

**Step 2: Create Child Table**
```sql
CREATE TABLE PRODUCT(
    PID INT PRIMARY KEY,
    PNAME VARCHAR(20) NOT NULL UNIQUE CHECK(LENGTH(PNAME)>0),
    PDESCRIPTION VARCHAR(50),
    CUSTOMER_ID INT,
    FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER(CID)
);
```

**Step 3: Insert Parent Data**
```sql
INSERT INTO CUSTOMER (CID, CNAME, CNO, ADDRESS) VALUES
(1, 'Avinash', 9876543210, 'Mumbai'),
(2, 'Rahul',   9123456789, 'Delhi'),
(3, 'Sneha',   9988776655, 'Pune');
```

**Step 4: Insert Child Data**
```sql
INSERT INTO PRODUCT (PID, PNAME, PDESCRIPTION, CUSTOMER_ID) VALUES
(101, 'Laptop',   'Gaming Laptop',      1),
(102, 'Mouse',    'Wireless Mouse',     1),
(103, 'Mobile',   'Android Phone',      2),
(104, 'Headphones', 'Noise Cancelling', 3);
```

**Step 5: Query Relationship**
```sql
SELECT C.CNAME, P.PNAME, P.PDESCRIPTION
FROM CUSTOMER C
INNER JOIN PRODUCT P
ON C.CID = P.CUSTOMER_ID;
```

**Output:**

| CNAME | PNAME | PDESCRIPTION |
| :--- | :--- | :--- |
| Avinash | Laptop | Gaming Laptop |
| Avinash | Mouse | Wireless Mouse |
| Rahul | Mobile | Android Phone |
| Sneha | Headphones | Noise Cancelling |

---

## 10. 🧠 ADVANCED INTERVIEW QUESTIONS

#### Q1: Can a table have multiple PRIMARY KEYs?
**Answer:** No. A table can have only ONE primary key. However, that primary key can be COMPOSITE (multiple columns combined).

#### Q2: What happens if you try to insert a duplicate PRIMARY KEY?
**Answer:** The database throws an error: `Duplicate entry 'value' for key 'PRIMARY'`. The insert fails and no data is added.

#### Q3: Can a FOREIGN KEY reference a non-PRIMARY KEY column?
**Answer:** Yes, but the referenced column must have a UNIQUE constraint. Best practice is to reference PRIMARY KEYs.

#### Q4: What's the difference between TRUNCATE and DELETE in terms of performance?
**Answer:** TRUNCATE is much faster because it deallocates data pages without logging individual row deletions. DELETE logs each row, making it slower but rollback-able.

#### Q5: Can you have a FOREIGN KEY that references the same table?
**Answer:** Yes. This is called a SELF-REFERENCING foreign key (e.g., Employee table where MGR_ID references EMPNO in the same table).

#### Q6: What happens to child records when you delete a parent record?
**Answer:** By default, the delete fails with a foreign key constraint error. You can use `ON DELETE CASCADE` to auto-delete children or `ON DELETE SET NULL` to nullify the foreign key.

#### Q7: Can AUTO_INCREMENT values be reused after DELETE?
**Answer:** No. Once an AUTO_INCREMENT value is used, it's never reused (even if that row is deleted). Use TRUNCATE to reset the counter.

#### Q8: What's the maximum number of UNIQUE constraints per table?
**Answer:** No practical limit. You can have as many UNIQUE constraints as needed (unlike PRIMARY KEY which is limited to one).

#### Q9: Can a CHECK constraint reference another table?
**Answer:** No. CHECK constraints can only validate data within the same row. Use TRIGGERS for cross-table validation.

#### Q10: What's the difference between `ALTER TABLE MODIFY` and `ALTER TABLE CHANGE`?
**Answer:** 
*   `MODIFY`: Changes data type/constraints, keeps same column name.
*   `CHANGE`: Can rename the column AND change its definition.

#### Q11: Can you add a NOT NULL constraint to a column that already has NULL values?
**Answer:** No. You must first UPDATE all NULL values to non-NULL, then add the constraint.

#### Q12: What happens if you create a FOREIGN KEY without an index on the parent table?
**Answer:** Most databases automatically create an index on PRIMARY KEY columns. If referencing a UNIQUE column without an index, performance degrades significantly.

#### Q13: Can you have a FOREIGN KEY that allows NULL?
**Answer:** Yes. NULL foreign keys represent "orphan" records (e.g., an employee with no manager).

#### Q14: What's the difference between DROP TABLE and DROP TABLE IF EXISTS?
**Answer:** `DROP TABLE` throws an error if the table doesn't exist. `DROP TABLE IF EXISTS` silently succeeds even if the table is missing.

#### Q15: Can you rename a table that has FOREIGN KEY constraints?
**Answer:** Yes, but the foreign key references are automatically updated in most modern databases. In older systems, you may need to drop and recreate constraints.

---

*Database Schema Engineering & DDL Mastery | © 2026 Avinash Dhanuka*

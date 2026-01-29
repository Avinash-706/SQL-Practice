# 🗄️ Master Guide: Oracle SQL, Data & RDBMS Internals

<div align="center">

![Oracle](https://img.shields.io/badge/ORACLE-F80000?style=for-the-badge&logo=oracle&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)

</div>

> **Author's Note:** This advanced documentation covers the complete lifecycle of data handling, from raw entities to advanced **Oracle SQL** constraints, adhering to **E.F. Codd's Relational Model**.

---

## 📑 Table of Contents
1.  [Introduction to SQL](#1-sql-structured-query-language)
2.  [Data & Entities Anatomy](#2-data--entities-anatomy)
3.  [The Database (DB) & CRUD](#3-the-database-db--crud)
4.  [DBMS (System Software)](#4-dbms-database-management-system)
    - [The Architecture](#dbms-architecture--security-layers)
    - [SQL vs NoSQL (The Landscape)](#sql-vs-nosql-the-landscape)
5.  [RDBMS: The Relational Model](#5-rdbms-relational-database-management-system)
    - [Why RDBMS?](#why-we-need-rdbms-instead-of-dbms)
6.  [EF Codd's Rules & Metadata](#6-ef-codds-rules--metadata-deep-dive)
7.  [Oracle SQL Data Types (Advanced)](#7-oracle-sql-data-types-advanced)
    - [Char vs Varchar2](#char-vs-varchar2-memory-allocation)
    - [The NUMBER Logic](#the-number-datatype-precision--scale)
8.  [Constraints](#8-constraints)

---

## 1. SQL (Structured Query Language)

### 📌 Definition
**SQL** is the standard ANSI programming language used to **communicate, interact, and manipulate** databases.

*   **Clarification:** SQL is **NOT** a database itself; it is the **language** used to talk to the database.
*   **Analogy:** Just as we use *English* to communicate with humans, we use *SQL* to communicate with the **Database Management System (DBMS)**.

---

## 2. Data & Entities Anatomy

To understand databases, we must first break down what **Data** actually is.

### 🧠 Definition of Data
**Data** is a **raw** **fact** which describes the **attributes** of an **entity**.

| Term | Meaning | Context |
| :--- | :--- | :--- |
| **Raw** | Unprocessed, natural, or original form. | "25" (No meaning on its own) |
| **Fact** | A truth or reality (something that exists). | "Age is 25" |

### 🏗️ Hierarchy of Data

1.  **Entity (Object)**
    *   A real-world object or thing about which we want to store data.
    *   *Example:* `STUDENT`, `EMPLOYEE`, `PRODUCT`.
2.  **Attributes (Properties)**
    *   Characteristics that describe the entity.
    *   *Example (Student):* `SID`, `NAME`, `AGE`, `STD`, `GENDER`.
3.  **Data / Values**
    *   Actual raw information stored in attributes.
    *   *Example:* `101`, `Chota Chetan`, `25`, `10th`, `M`.

### 📊 Visualization (Entity → Attributes → Data)

| Entity Type | SID (Attribute) | Name (Attribute) | Age (Attribute) | Gender (Attribute) |
| :---: | :---: | :---: | :---: | :---: |
| **Student** | 101 | Chota Chetan | 25 | M |

---

## 3. The Database (DB) & CRUD

### 📂 Definition
A **Database** is an organized collection of data that allows data to be easily **stored, accessed, managed, and updated**.

### 🖼️ Symbolic Representation
Databases are universally represented using a **Cylinder** symbol.

<p align="center">
  <img src="DatabaseCyclinderRepresentation.jpg" alt="Database Cylinder Representation" width="400">
</p>

### ⚙️ CRUD Operations
The main purpose of a database is to perform **CRUD operations**.

| Acronym | Operation | Meaning | SQL Command |
| :---: | :--- | :--- | :--- |
| **C** | **Create** | Insert new data | `INSERT` |
| **R** | **Read** | Fetch existing data | `SELECT` |
| **U** | **Update** | Modify existing data | `UPDATE` |
| **D** | **Delete** | Remove data | `DELETE` / `DROP` |

---

## 4. DBMS (Database Management System)

### 🛡️ Definition
A **DBMS** is **software** used to create, manage, and maintain databases.

*   **Database** → The Container (Files on the Hard Disk).
*   **DBMS** → The Tool (Software used to access the container).

### DBMS Architecture & Security Layers
The DBMS sits between the **User/Application** and the **Database**, acting as a protective and controlling layer.

<p align="center">
  <img src="https://media.geeksforgeeks.org/wp-content/uploads/20250422161026558316/3-Tier-Schema-Architecture.jpg" alt="DBMS Architecture Diagram" width="500">
</p>

### 🔐 Key Security Features
1.  **Authentication (Identity Check):**
    *   Question: **Who are you?**
    *   Verifies the user's identity (Username & Password).
2.  **Authorization (Permission Check):**
    *   Question: **What are you allowed to do?**
    *   Controls access level (e.g., Admin can `DELETE`, Intern can only `SELECT`).

### 🌍 SQL vs. NoSQL: The Landscape

There are distinct categories of DBMS. Here is who uses what and why.

#### A. Relational DBMS (SQL)
Stores data in Tables. Strict structure.
*   **Oracle SQL:** The Enterprise Standard (Banking, Airlines).
*   **MySQL:** The Web Standard (Facebook, YouTube, WordPress).
*   **PostgreSQL:** The Advanced Open Source Standard (Complex Analytics).

#### B. Non-Relational DBMS (NoSQL)
Stores data in Documents or Key-Values. Flexible structure.
*   **MongoDB:** Document Store (JSON-like).
*   **CassandraDB:** Wide-column store.
*   **DynamoDB:** Key-Value store.

#### 👷 Who Uses Which? (Engineer Roles)

| Role | Preferred Database | Why? |
| :--- | :--- | :--- |
| **Backend Developer** | MySQL / PostgreSQL | Needs reliable data structure for Apps/APIs. |
| **Data Engineer** | Oracle / Snowflake | Needs to handle massive, complex warehousing. |
| **Big Data Engineer** | Cassandra / MongoDB | Needs high-speed, unstructured real-time data. |
| **Enterprise DBA** | **Oracle SQL** | Needs advanced security, recovery, and strict ACID compliance. |

---

## 5. RDBMS (Relational Database Management System)

### 📚 Definition
**RDBMS** is a specific type of DBMS software based on the **Relational Model**. It stores data in the form of **Tables** (Rows & Columns).

### 🆚 Database vs. DBMS vs. RDBMS

| Feature | Database | DBMS | RDBMS |
| :--- | :--- | :--- | :--- |
| **Nature** | Collection of data | Software | Advanced Software (Relational) |
| **Function** | Stores data | Manages data | Manages Data + Relationships |
| **Example** | Files on disk | FoxPro, FileMaker | **Oracle, MySQL, SQL Server** |

### 🚀 Why we need RDBMS instead of DBMS?
Standard DBMS (like flat files) has limitations. RDBMS introduces:
1.  **Retrieval Speed (Indexing):** RDBMS uses algorithms (B-Trees) to find data instantly, rather than scanning the whole file.
2.  **Data Integrity (ACID):** Ensures transactions are processed reliably.
3.  **Relationships:** Can link tables together (e.g., Student ID linked to Exam Results).
4.  **Multi-User Access:** Allows thousands of users to read/write simultaneously without corruption.

### 📐 The Relational Model
Designed by the famous data scientist **Edgar Frank (E.F.) Codd**.

#### Terminology
*   **Row / Record / Tuple:** Describes *multiple* properties of a *single* entity.
*   **Column / Attribute / Field:** Describes a *single* property of *all* the entities.
*   **Cell:** Intersection of Row and Column. The **smallest unit** of a table.

#### 🖼️ Table Diagram
```text
      Field / Attribute / Column
       ↓      ↓       ↓
+------+------+-------+-------+
|  ID  | Name |  Age  | Grade |  ← Header
+------+------+-------+-------+
| 101  | Alex |  20   |   A   |  ← Row / Tuple / Record
+------+------+-------+-------+
| 102  | Sam  |  21   |   B   |
+------+------+-------+-------+
      ↑
     Cell (Smallest Unit)
```

---

## 6. EF Codd's Rules & Metadata (Deep Dive)

### 📜 Rule 1: Atomic Values
The data entered into a cell must be **Single Valued**.
*   **Violation:** Storing "9988776655, 1122334455" in one `Mobile_No` cell.
*   **Solution:** RDBMS forbids this. You must create a new row or a separate table for the second number.

### 🗃️ Rule 2: Metadata (Data about Data)
In RDBMS, we can store everything in the form of a table, including **Metadata**.

*   **Definition:** Metadata is "Data about Data".
*   **Storage:** Metadata is **not** stored in the same table as your data. It is stored in a separate **System Table** (Data Dictionary).
*   **Lifecycle:** When you `DROP` (delete) a table, its metadata is also deleted from the system.

#### 🖼️ Visualizing Metadata
**Example 1: Image Metadata (EXIF)**
When you take a photo, the image is the "Data". The details (Shutter speed, Date, GPS) are "Metadata".
<p align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/6/69/Metadata_EN.png" alt="Metadata Example" width="400">
</p>

**Example 2: SQL Metadata (Data Dictionary)**
When you create a table `STUDENT`, Oracle creates an entry in its own internal table (`USER_TAB_COLUMNS`).

| Table_Name | Column_Name | Data_Type | Length |
| :--- | :--- | :--- | :--- |
| STUDENT | NAME | VARCHAR2 | 20 |
| STUDENT | AGE | NUMBER | 3 |

*(This table is managed automatically by Oracle. We can view it, but rarely modify it directly).*

### 🔗 Rule 3: Relations
If needed, we can establish connections between tables using **Key Attributes** (Primary Key & Foreign Key). This reduces redundancy.

### ✅ Rule 4: Data Validation
Data entered into a table must be validated in 2 ways:
1.  **Data Types:** (Mandatory) - Defines the format (Text, Number, Date).
2.  **Constraints:** (Optional) - Defines the rules (Unique, Not Null).

---

## 7. Oracle SQL Data Types (Advanced)

This section focuses on **Oracle SQL** standards.

### 1️⃣ CHAR (Fixed Length)
*   **Usage:** Alphanumeric (A-Z, 0-9, Symbols).
*   **Syntax:** `CHAR(Size)`
*   **Max Size:** 2000 bytes.
*   **Key Behavior:** It follows **Fixed Length Memory Allocation**.
*   **Constraint:** We must use single quotes `' '` for input/retrieval.

**📝 Visualization: `CHAR(5)`**
If we store "ABC":
```text
Memory: | A | B | C | _ | _ |
Status: 3 bytes data + 2 bytes wasted (padded with spaces)
```
*   **Disadvantage:** Memory Wastage.
*   **Use Case:** Fixed codes like Gender ('M', 'F') or Country ('IND', 'USA').

### 2️⃣ VARCHAR vs. VARCHAR2 (Variable Length)
*   **Note:** In Oracle, always use `VARCHAR2`.
*   **Syntax:** `VARCHAR2(Size)`
*   **Behavior:** Allocates memory **only for the data entered**.

**📝 Visualization: `VARCHAR2(5)`**
If we store "ABC":
```text
Memory: | A | B | C |
Status: 3 bytes used. 0 bytes wasted.
```

### 3️⃣ NUMBER (The Master Numeric Type)
Unlike other SQLs (which use Int, Float, Double), **Oracle** uses `NUMBER` for everything.

**Syntax:** `NUMBER(Precision, Scale)`
*   **Precision (P):** Total count of significant digits. (Max 38).
*   **Scale (S):** Count of digits *after* the decimal point.

**⚠️ Why not store numbers in Varchar?**
1.  **Math:** Cannot perform SUM/AVG on text.
2.  **Sorting:** Text sorts `1, 10, 2`. Numbers sort `1, 2, 10`.
3.  **Speed:** CPU processes integers faster than strings.

#### 🧮 Precision & Scale Deep Dive

| Declaration | Description | Input | Stored Result | Explanation |
| :--- | :--- | :--- | :--- | :--- |
| `NUMBER(5)` | Max 5 digits, Integer only | `123.45` | `123` | Rounds to nearest whole number. |
| `NUMBER(5, 2)` | Total 5 digits, 2 decimal | `123.45` | `123.45` | Perfect fit. |
| `NUMBER(5, 2)` | ... | `1234.5` | ❌ ERROR | Needs 4 digits before dot (Total 6 needed). |
| `NUMBER(7, 4)` | High Precision | `123.4567` | `123.4567` | Standard decimal use. |
| `NUMBER(4, 4)` | All Decimal | `0.1234` | `0.1234` | Pure fraction. |
| `NUMBER(2, 5)` | **Rare:** Scale > Precision | `0.00012` | `0.00012` | Used for very small scientific values. |

### 4️⃣ DATE
*   **Why not Varchar?**
    *   Validation (Feb 30th is impossible).
    *   Arithmetic (`Today - DOB = Age`).
*   **Oracle Format:** `DD-MON-RR` or `DD-MON-YY` (e.g., `'25-JAN-23'`).
*   **MySQL Format:** `YYYY-MM-DD`.
*   **Syntax:** Must use single quotes `' '`.

### 5️⃣ LARGE OBJECTS (LOB)
Used when data exceeds 4000 bytes.
1.  **CLOB (Character Large Object):** For huge text (Books, XML, Logs). Size: 4GB.
2.  **BLOB (Binary Large Object):** For Multimedia (Images, Video, Audio). Size: 4GB.

---

## 8. Constraints

Constraints are strict rules applied to columns to ensure **Data Accuracy, Reliability, and Integrity**. If a user tries to insert or update data that violates these rules, the RDBMS will instantly reject the operation.

<p align="center">
  <img src="https://media.geeksforgeeks.org/wp-content/uploads/20230623123129/SQL-Constraints.png" alt="SQL Constraints Diagram" width="550">
</p>

### Summary Table

| Constraint | Description | Example |
| :--- | :--- | :--- |
| **UNIQUE** | Prevents duplicate values. Nulls are allowed. | `Mobile_No`, `Email` |
| **NOT NULL** | Ensures a cell cannot be left empty. | `Password` |
| **CHECK** | Validates data against a condition. | `CHECK(Age >= 18)` |
| **PRIMARY KEY** | Uniquely identifies a record. (Unique + Not Null). | `Student_ID` |
| **FOREIGN KEY** | Establishes a relationship between tables. | `Dept_ID` (links to Dept table) |
| **DEFAULT** | Inserts a default value if none is provided. | `City DEFAULT 'Bangalore'` |

---

### Detailed Analysis of Constraints

#### 1. UNIQUE Constraint
*   **Definition:** Ensures all values in a column are entirely distinct.
*   **Limitation/Rule:** 
    * It **does allow NULL values** (in Oracle, you can insert multiple NULLs because NULL is not equal to NULL). 
    * A table can have multiple UNIQUE constraints.
*   **Syntax:** `column_name data_type UNIQUE`

#### 2. NOT NULL Constraint
*   **Definition:** Restricts a column from accepting NULL (empty) values.
*   **Limitation/Rule:** 
    * Must be defined at the **column level** (inline) in Oracle. 
    * Cannot be combined with NULL.
*   **Syntax:** `column_name data_type NOT NULL`

#### 3. CHECK Constraint
*   **Definition:** Validates incoming data against a specific boolean condition.
*   **Limitation/Rule:** 
    * The condition cannot use subqueries.
    * Cannot reference other tables, `SYSDATE`, `USER`, or `NEXTVAL`.
*   **Syntax:** `column_name data_type CHECK (condition)` *(e.g., `CHECK (AGE >= 18)`)*

#### 4. PRIMARY KEY Constraint (PK)
*   **Definition:** Uniquely identifies each record in a table. It is mathematically equivalent to `UNIQUE + NOT NULL`.
*   **Limitation/Rule:** 
    * **Strict Rule:** A table can have **ONLY ONE** Primary Key.
    * Cannot contain NULL values.
*   **Syntax:** `column_name data_type PRIMARY KEY`

#### 5. FOREIGN KEY Constraint (FK)
*   **Definition:** Ensures Referential Integrity by linking data from one table to the Primary Key of another table.
*   **Limitation/Rule:** 
    * The referenced column in the parent table **must** be a `PRIMARY KEY` or `UNIQUE` key.
    * You cannot delete a record in the parent table if it is being referenced by the child table (unless `ON DELETE CASCADE` is used).
*   **Syntax:** `column_name data_type REFERENCES parent_table(parent_column)`

#### 6. DEFAULT Constraint
*   **Definition:** Automatically assigns a fixed value to a column if the user does not insert any value.
*   **Limitation/Rule:** 
    * Can be a literal value, a system function (like `SYSDATE`), but cannot be a subquery.
*   **Syntax:** `column_name data_type DEFAULT 'value'` *(e.g., `CITY VARCHAR2(50) DEFAULT 'Mumbai'`)*


<!-- Centered vertical stack for logo + text + button -->
<div style="
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 10px;
    background-color: #1A202C;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 0 15px rgba(0, 173, 181, 0.2);
    border: 1px solid #2d3748;
    color: white;
    margin-top: 50px;
">
    <!-- Logo -->
    <img src="../favicon.jpeg" alt="Avinash Logo" width="220" style="
        text-align: center;
        border-radius: 50%;
        box-shadow: 0 0 15px rgba(0, 173, 181, 0.6);
        border: 2px solid #00ADB5;
    ">
    <br>
    <!-- Text -->
    <p style="
        margin: 0;
        font-weight: bold;
        font-size: 18px;
        letter-spacing: 0.5px;
        text-align: center;
        color: #E2E8F0;
    ">
        © 2025 Avinash Dhanuka — System Designing Notebook
    </p>
    <br>
    <!-- Button -->
    <a href="https://mail.google.com/mail/?view=cm&fs=1&to=avunashdhanuka@gmail.com&su=System%20Design%20Query%20from%20[Your%20Name]&body=📘%20Hello%20Avinash,%0D%0A%0D%0AMy%20name%20is%20[Your%20Name]%20and%20I%20wanted%20to%20reach%20out%20regarding%20your%20System%20Design%20Notebook.%0D%0A%0D%0A🔹%20Query%20Topic:%20[Enter%20your%20topic]%0D%0A🔹%20Message:%20[Type%20your%20message%20here]%0D%0A%0D%0AThank%20you%20for%20your%20time!%0D%0A%0D%0ABest%20regards,%0D%0A[Your%20Name]"
       target="_blank"
       style="
           text-align: center;
           background-color: #2563eb;
           color: white;
           padding: 12px 24px;
           text-decoration: none;
           font-weight: bold;
           border-radius: 8px;
           font-family: 'Verdana', sans-serif;
           box-shadow: 0 4px 12px rgba(37, 99, 235, 0.4);
           transition: background-color 0.3s ease, transform 0.2s ease;
           display: inline-block;
       "
       onmouseover="this.style.backgroundColor='#1e40af'; this.style.transform='scale(1.05)';"
       onmouseout="this.style.backgroundColor='#2563eb'; this.style.transform='scale(1)';">
        📧 Contact Me via Gmail
    </a>
    <br>
    <p style="text-align:center; margin-top: 15px; font-size: 13px; color: #A0AEC0;">
        Crafted with ❤️ for learning, clarity, and scalability
    </p>
</div>
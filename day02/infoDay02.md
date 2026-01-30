# 🗄️ Master Guide: SQL Statements & Execution Flow

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
<h3>© 2025 Avinash Dhanuka</h3>
<p>Master Guide: SQL Statements & Internals</p>
<p><em>Crafted with ❤️ for Data Consistency, Integrity & Performance</em></p>

<a href="https://mail.google.com/mail/?view=cm&fs=1&to=avunashdhanuka@gmail.com&su=SQL%20Execution%20Flow%20Query&body=🗄️%20Hello%20Avinash,%0D%0A%0D%0AMy%20name%20is%20[Your%20Name]%20and%20I%20have%20a%20question%20regarding%20SQL%20Order%20of%20Execution.%0D%0A%0D%0A🔹%20Doubt:%20[Enter%20your%20doubt]%0D%0A%0D%0AThank%20you!" target="_blank">

<img src="https://img.shields.io/badge/📧_Contact_Me_via_Gmail-2563EB?style=for-the-badge&logo=gmail&logoColor=white" alt="Gmail">

</a>
<br />
<br />
</td>
</tr>
</table>
</div>

> **Author's Note:** This guide breaks down the sub-languages of SQL and performs a deep dive into the **DQL (SELECT)** statement, explaining exactly how the Oracle Engine processes your query step-by-step.

---

## 📑 Table of Contents
1.  [SQL Sub-Languages (DDL, DML, TCL, DCL, DQL)](#1-sql-sub-languages-classification)
2.  [The Anatomy of DQL (SELECT)](#2-the-anatomy-of-dql-select)
    -   [Projection vs Selection vs Joins](#visualizing-projection-vs-selection)
3.  [Projection: Selecting Columns](#3-projection-selecting-columns)
    -   [Expressions](#expressions-calculating-data)
    -   [Aliases](#aliases-renaming-outputs)
    -   [DISTINCT](#distinct-removing-duplicates)
4.  [Selection: Filtering Rows (WHERE)](#4-selection-filtering-rows-where-clause)
    -   [SQL Operators](#sql-operators-the-missing-link)
5.  [Backend Internals: Order of Execution](#5-backend-internals-order-of-execution)
6.  [Top Interview Questions](#6-top-interview-questions-from-this-topic)

---

## 1. SQL Sub-Languages Classification

SQL is not just one thing; it is a collection of commands grouped by their purpose.

<p align="center">
  <img src="https://media.geeksforgeeks.org/wp-content/uploads/20250823151715831016/sql_commands.webp" alt="SQL Commands Chart" width="600">
</p>

| Acronym | Full Form | Purpose | Key Commands |
| :--- | :--- | :--- | :--- |
| **DDL** | **Data Definition Language** | Used to define or alter the *structure* (schema) of the database. | `CREATE`, `ALTER`, `DROP`, `TRUNCATE`, `RENAME` |
| **DML** | **Data Manipulation Language** | Used to manipulate the *data* inside the tables. | `INSERT`, `UPDATE`, `DELETE` |
| **TCL** | **Transaction Control Language** | Used to manage the changes made by DML statements (Save/Undo). | `COMMIT`, `ROLLBACK`, `SAVEPOINT` |
| **DCL** | **Data Control Language** | Used to control access and permissions. | `GRANT` (Give access), `REVOKE` (Remove access) |
| **DQL** | **Data Query Language** | Used to *retrieve* data. It performs 3 major operations: <br> 1. **Projection** <br> 2. **Selection** <br> 3. **Joins** | `SELECT` |

---

## 2. The Anatomy of DQL (SELECT)

The `SELECT` statement is the most powerful command in SQL. It performs three specific operations to get you exactly the data you need.

### 🔹 1. Projection (Vertical Slicing ⬇️)
*   **Definition:** Retrieving data by selecting **only specific columns**.
*   *Action:* Discards unwanted columns.
*   *Example:* "Give me only Names and Emails of all students."

### 🔹 2. Selection (Horizontal Slicing ➡️)
*   **Definition:** Retrieving data by selecting **specific rows** based on a condition.
*   *Action:* Discards unwanted rows.
*   *Example:* "Give me details of students who scored > 90 marks."

### 🔹 3. Joins (Merging 🔗)
*   **Definition:** Retrieving data from **multiple tables** simultaneously by linking them.
*   *Action:* Combines data sources.

### 🖼️ Visualizing Projection vs Selection

<p align="center">
  <img src="ProjectVsSelection.png" alt="Projection vs Selection Diagram" width="500">
</p>

*   **π (Pi - Projection):** Selects Columns (Vertical).
*   **σ (Sigma - Selection):** Selects Rows (Horizontal).

---

## 3. Projection: Selecting Columns

**Syntax:**
```sql
SELECT [DISTINCT] Column_Name / Expression [AS Alias] 
FROM Table_Name;
```

### Expressions (Calculating Data)
**Definition:** An expression is a combination of symbols and operators that the SQL engine evaluates to produce a single data value.
*   **Key Concept:** Expressions allow you to manipulate data *during* retrieval without changing the actual data in the database.

**Types of Expressions:**
1.  **Arithmetic:** `SELECT SALARY + 1000 FROM EMP;` (Adds bonus virtually).
2.  **String:** `SELECT FIRST_NAME || ' ' || LAST_NAME FROM EMP;` (Joins names).
3.  **Constant:** `SELECT NAME, 'Active' FROM STUDENT;` (Adds a hardcoded column 'Active' to every row).

### Aliases (Renaming Outputs)
**Definition:** An alternative temporary name given to a Column or an Expression in the result table.

**Rules for Aliases:**
1.  **Optional Keyword:** You can use `AS` or simply put a space.
    *   `SELECT Name AS Student_Name` ✅
    *   `SELECT Name Student_Name` ✅
2.  **Single Word:** Default aliases must be one word.
3.  **Multiple Words:** If you want a space (e.g., "Full Name"), you **MUST** enclose it in **Double Quotes (`" "`)**.
    *   `SELECT Name AS "Full Name"` ✅
4.  **Oracle Specific:** Oracle converts all unquoted aliases to UPPERCASE. Double quotes preserve case sensitivity.

### DISTINCT (Removing Duplicates)
**Definition:** A clause used to remove duplicated or repeated values from the result set.

**Critical Rules:**
1.  **First Argument Only:** `DISTINCT` must be the **very first word** after `SELECT`.
    *   ❌ `SELECT Name, DISTINCT Age FROM Student;` (Invalid SQL)
    *   ✅ `SELECT DISTINCT Name, Age FROM Student;` (Valid)
2.  **Combination Logic:** When used with multiple columns, it checks for **Unique Combinations**.
    *   Row 1: `(A, 10)` | Row 2: `(A, 10)` → **Removed** (Duplicate).
    *   Row 1: `(A, 10)` | Row 2: `(A, 20)` → **Kept** (Unique combination).

---

## 4. Selection: Filtering Rows (WHERE Clause)

**Syntax:**
```sql
SELECT * / Columns 
FROM Table_Name 
WHERE <Filter_Condition>;
```

### The WHERE Clause
*   It is used to filter records.
*   It executes **Row by Row**.
*   It restricts data *before* it is shown to the user.
*   We can combine multiple conditions using Logical Operators (`AND`, `OR`).

### SQL Operators (The Missing Link)
To use the `WHERE` clause effectively, you need Operators.

| Category | Operator | Meaning | Example |
| :--- | :--- | :--- | :--- |
| **Relational** | `=`, `!=` or `<>` | Equal / Not Equal | `Age = 25` |
| | `>`, `<`, `>=`, `<=` | Greater/Less than | `Salary > 5000` |
| **Logical** | `AND` | Both conditions must be True | `Age > 18 AND City = 'Pune'` |
| | `OR` | Any one condition is True | `City = 'Pune' OR City = 'Mumbai'` |
| | `NOT` | Reverses the condition | `NOT (Age > 18)` |
| **Special** | `BETWEEN` | Range of values (Inclusive) | `Salary BETWEEN 1000 AND 5000` |
| | `IN` | Match any value in a list | `City IN ('Delhi', 'Pune', 'Goa')` |
| | `LIKE` | Pattern Matching | `Name LIKE 'S%'` (Starts with S) |
| | `IS NULL` | Checks for Empty/Null values | `Phone IS NULL` |


<p align="center">
  <img src="https://media.geeksforgeeks.org/wp-content/uploads/20251112145208765825/sql_operators-updated.webp" alt="Projection vs Selection Diagram" width="500">
</p>

---

## 5. Backend Internals: Order of Execution

Understanding "How" the database thinks is critical for writing fast queries. The SQL Engine **DOES NOT** read top-to-bottom like a human. It reads in a specific logical order.

### 🖼️ The Execution Flow Diagram

```mermaid
graph TB

    %% =======================
    %% LOGICAL SQL ORDER
    %% =======================
    subgraph L[LOGICAL SQL ORDER]
        direction TB
        L1[SELECT<br/>CHOOSE COLUMNS]
        L2[FROM<br/>BASE TABLES]
        L3[JOIN<br/>COMBINE TABLES]
        L4[WHERE<br/>FILTER ROWS]
        L5[GROUP BY<br/>CREATE GROUPS]
        L6[HAVING<br/>FILTER GROUPS]
        L7[ORDER BY<br/>SORT RESULT]
    end

    %% =======================
    %% EXECUTION ORDER
    %% =======================
    subgraph E[ACTUAL EXECUTION ORDER]
        direction TB
        E1[FROM<br/>IDENTIFY TABLES]
        E2[JOIN<br/>APPLY CONDITIONS]
        E3[WHERE<br/>REMOVE ROWS]
        E4[GROUP BY<br/>BUILD AGGREGATES]
        E5[HAVING<br/>FILTER AGGREGATES]
        E6[SELECT<br/>COMPUTE OUTPUT]
        E7[ORDER BY<br/>FINAL SORT]
        E8[OUTPUT<br/>RETURN RESULT]
    end

    %% MAIN FLOWS
    L1 --> L2 --> L3 --> L4 --> L5 --> L6 --> L7
    E1 --> E2 --> E3 --> E4 --> E5 --> E6 --> E7 --> E8

    %% LOGICAL TO EXECUTION MAPPING
    L2 -.-> E1
    L3 -.-> E2
    L4 -.-> E3
    L5 -.-> E4
    L6 -.-> E5
    L1 -.-> E6
    L7 -.-> E7

    %% =======================
    %% MAX VISIBILITY EDGES
    %% =======================
    linkStyle default stroke:#6b7280,stroke-width:4px
 

    %% =======================
    %% STYLING
    %% =======================
    style L fill:#e5e7eb,stroke:#111827,stroke-width:3px,color:#000
    style E fill:#e5e7eb,stroke:#111827,stroke-width:3px,color:#000

    %% Logical nodes
    style L1 fill:#fecaca,stroke:#7f1d1d,stroke-width:2px,color:#000
    style L2 fill:#fed7aa,stroke:#7c2d12,stroke-width:2px,color:#000
    style L3 fill:#fdba74,stroke:#7c2d12,stroke-width:2px,color:#000
    style L4 fill:#a5f3fc,stroke:#155e75,stroke-width:2px,color:#000
    style L5 fill:#86efac,stroke:#14532d,stroke-width:2px,color:#000
    style L6 fill:#6ee7b7,stroke:#064e3b,stroke-width:2px,color:#000
    style L7 fill:#c7d2fe,stroke:#312e81,stroke-width:2px,color:#000

    %% Execution nodes
    style E1 fill:#bae6fd,stroke:#075985,stroke-width:2px,color:#000
    style E2 fill:#7dd3fc,stroke:#075985,stroke-width:2px,color:#000
    style E3 fill:#67e8f9,stroke:#155e75,stroke-width:2px,color:#000
    style E4 fill:#86efac,stroke:#14532d,stroke-width:2px,color:#000
    style E5 fill:#4ade80,stroke:#14532d,stroke-width:2px,color:#000
    style E6 fill:#ddd6fe,stroke:#4c1d95,stroke-width:2px,color:#000
    style E7 fill:#c7d2fe,stroke:#312e81,stroke-width:2px,color:#000
    style E8 fill:#93c5fd,stroke:#1e40af,stroke-width:3px,color:#000
```

#### Detailed Breakdown:

1.  **The `FROM` Clause (Identify Data)**
    *   **Action:** The database goes to the hard disk, searches for the specific `Table_Name`, and loads the data into the buffer (memory).
    *   *Result:* The entire table (all rows, all columns) is available to the engine.

2.  **The `WHERE` Clause (Filter Data)**
    *   **Action:** The engine goes through the table in memory **row by row**. It checks the condition.
        *   If `True` → Keep the row.
        *   If `False` → Discard the row immediately.
    *   *Result:* A filtered set of rows.

3.  **The `SELECT` Clause (Project Data)**
    *   **Action:** Now that we have the correct rows, the engine looks at the columns you requested. It discards unneeded columns, computes any **Expressions**, and assigns **Aliases**.
    *   *Result:* The final table structure.

> **⚡ Important Note:** Because `WHERE` runs **before** `SELECT`, you **cannot** use an Alias created in `SELECT` inside the `WHERE` clause.
> *   ❌ `SELECT Salary AS Sal FROM Emp WHERE Sal > 5000` (Error: 'Sal' invalid identifier)

---

## 6. Top Interview Questions (From this Topic)

#### Q1: What is the Order of Execution for a basic SQL Query?
> **Answer:** 1. `FROM` (Data Identification) → 2. `WHERE` (Row Filtering) → 3. `SELECT` (Column Projection / Expressions / Aliasing).

#### Q2: Can we use an Alias in the WHERE clause?
> **Answer:** **No.** Because the `WHERE` clause executes *before* the `SELECT` clause (where the alias is defined), the database doesn't know the alias exists yet.

#### Q3: What is the difference between Selection and Projection?
> **Selection** (using `WHERE`) filters rows horizontally. **Projection** (using `SELECT`) filters columns vertically.

#### Q4: Does `DISTINCT` apply to the first column or all columns?
> **Answer:** It applies to the **entire row** (combination of all columns mentioned). `SELECT DISTINCT A, B` means unique pairs of A and B.

---
*Created for Advanced SQL Learning.*
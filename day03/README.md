# 🗄️ Master Guide: SQL Operators & Logic Control

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
<p>Master Guide: SQL Operators</p>
<p><em>Crafted with ❤️ for Data Precision & Logic</em></p>

<a href="https://mail.google.com/mail/?view=cm&fs=1&to=avunashdhanuka@gmail.com&su=SQL%20Operators%20Query&body=🗄️%20Hello%20Avinash,%0D%0A%0D%0AMy%20name%20is%20[Your%20Name]%20and%20I%20have%20a%20doubt%20regarding%20SQL%20Operators.%0D%0A%0D%0A🔹%20Operator%20Type:%20[Arithmetic/Logical/Special]%0D%0A🔹%20Question:%20[Type%20your%20question]%0D%0A%0D%0AThank%20you!" target="_blank">

<img src="https://img.shields.io/badge/📧_Contact_Me_via_Gmail-2563EB?style=for-the-badge&logo=gmail&logoColor=white" alt="Gmail">

</a>
<br />
<br />
</td>
</tr>
</table>
</div>

> **Author's Note:** Operators are the engine of SQL logic. This guide dissects every symbol used to filter, calculate, and compare data, with a specific focus on **Oracle SQL** syntax.

---

## 📑 Table of Contents
1.  [Overview & Hierarchy](#1-overview--hierarchy)
2.  [Arithmetic Operators (Math)](#2-arithmetic-operators)
3.  [Concatenation Operator (String Join)](#3-concatenation-operator)
4.  [Relational / Comparison Operators](#4-relational--comparison-operators)
5.  [Logical Operators (AND, OR, NOT)](#5-logical-operators-truth-tables)
6.  [Special Operators (Deep Dive)](#6-special-operators-deep-dive)
    -   [IN / NOT IN](#61-in-vs-not-in)
    -   [BETWEEN / NOT BETWEEN](#62-between-vs-not-between)
    -   [IS NULL / IS NOT NULL](#63-is-null-handling)
    -   [LIKE / NOT LIKE](#64-like-operator-wildcards)
7.  [Subquery Operators (ALL, ANY, EXISTS)](#7-subquery-operators-advanced)
8.  [Operator Precedence (BODMAS)](#8-operator-precedence-hierarchy)

---

## 1. Overview & Hierarchy

Operators are reserved words or characters used primarily in the `WHERE` clause to perform operations, comparisons, and arithmetic.

### 🖼️ Operator Hierarchy Diagram

```mermaid
graph TB

    %% =======================
    %% ROOT
    %% =======================
    OP[SQL OPERATORS<br/>USED IN CONDITIONS]

    %% =======================
    %% LEVEL 1
    %% =======================
    A[ARITHMETIC OPERATORS]
    R[RELATIONAL OPERATORS]

    %% =======================
    %% LEVEL 2
    %% =======================
    L[LOGICAL OPERATORS]
    S[SPECIAL OPERATORS]

    OP --> A
    OP --> R
    A --> L
    R --> S

    %% =======================
    %% ARITHMETIC
    %% =======================
    A1[ADD<br/>+]
    A2[SUBTRACT<br/>-]
    A3[MULTIPLY<br/>*]
    A4[DIVIDE<br/>/]

    A --> A1
    A --> A2
    A --> A3
    A --> A4

    %% =======================
    %% RELATIONAL
    %% =======================
    R1[EQUAL<br/>=]
    R2[NOT EQUAL<br/>!= or <>]
    R3[GREATER THAN<br/> >]
    R4[LESS THAN<br/> <]
    R5[GREATER OR EQUAL<br/> >=]
    R6[LESS OR EQUAL<br/> <=]

    R --> R1
    R --> R2
    R --> R3
    R --> R4
    R --> R5
    R --> R6

    %% =======================
    %% LOGICAL
    %% =======================
    L1[AND<br/>ALL CONDITIONS TRUE]
    L2[OR<br/>ANY CONDITION TRUE]
    L3[NOT<br/>NEGATES CONDITION]

    L --> L1
    L --> L2
    L --> L3

    %% =======================
    %% SPECIAL
    %% =======================
    S1[IN<br/>MULTIPLE VALUES]
    S2[BETWEEN<br/>RANGE CHECK]
    S3[LIKE<br/>PATTERN MATCH]
    S4[IS NULL<br/>NULL CHECK]
    S5[EXISTS<br/>SUBQUERY CHECK]

    S --> S1
    S --> S2
    S --> S3
    S --> S4
    S --> S5

    %% =======================
    %% CONNECTOR VISIBILITY
    %% =======================
    linkStyle default stroke:#6b7280,stroke-width:4px

    %% =======================
    %% STYLING (REFERENCE MATCH)
    %% =======================

    %% Root
    style OP fill:#e5e7eb,stroke:#111827,stroke-width:3px,color:#000

    %% Operator groups
    style A fill:#fed7aa,stroke:#7c2d12,stroke-width:3px,color:#000
    style R fill:#fecaca,stroke:#7f1d1d,stroke-width:3px,color:#000
    style L fill:#a5f3fc,stroke:#155e75,stroke-width:3px,color:#000
    style S fill:#c7d2fe,stroke:#312e81,stroke-width:3px,color:#000

    %% Arithmetic nodes
    style A1 fill:#fdba74,stroke:#7c2d12,stroke-width:2px,color:#000
    style A2 fill:#fdba74,stroke:#7c2d12,stroke-width:2px,color:#000
    style A3 fill:#fdba74,stroke:#7c2d12,stroke-width:2px,color:#000
    style A4 fill:#fdba74,stroke:#7c2d12,stroke-width:2px,color:#000

    %% Relational nodes
    style R1 fill:#fca5a5,stroke:#7f1d1d,stroke-width:2px,color:#000
    style R2 fill:#fca5a5,stroke:#7f1d1d,stroke-width:2px,color:#000
    style R3 fill:#fca5a5,stroke:#7f1d1d,stroke-width:2px,color:#000
    style R4 fill:#fca5a5,stroke:#7f1d1d,stroke-width:2px,color:#000
    style R5 fill:#fca5a5,stroke:#7f1d1d,stroke-width:2px,color:#000
    style R6 fill:#fca5a5,stroke:#7f1d1d,stroke-width:2px,color:#000

    %% Logical nodes
    style L1 fill:#67e8f9,stroke:#155e75,stroke-width:2px,color:#000
    style L2 fill:#67e8f9,stroke:#155e75,stroke-width:2px,color:#000
    style L3 fill:#67e8f9,stroke:#155e75,stroke-width:2px,color:#000

    %% Special nodes
    style S1 fill:#ddd6fe,stroke:#4c1d95,stroke-width:2px,color:#000
    style S2 fill:#ddd6fe,stroke:#4c1d95,stroke-width:2px,color:#000
    style S3 fill:#ddd6fe,stroke:#4c1d95,stroke-width:2px,color:#000
    style S4 fill:#ddd6fe,stroke:#4c1d95,stroke-width:2px,color:#000
    style S5 fill:#ddd6fe,stroke:#4c1d95,stroke-width:2px,color:#000
```

---

## 2. Arithmetic Operators

Used to perform mathematical calculations on **Numeric** data.

| Symbol | Name | Description |
| :---: | :--- | :--- |
| `+` | Addition | Adds values. |
| `-` | Subtraction | Subtracts right operand from left. |
| `*` | Multiplication | Multiplies values. |
| `/` | Division | Divides left by right. |

### 📐 Syntax
```sql
SELECT Column1 [Operator] Column2 FROM Table_Name;
-- OR
SELECT Column1 [Operator] Value FROM Table_Name;
```

### 💻 Example
```sql
-- Increase every employee's salary by 1000
SELECT Name, Salary, Salary + 1000 AS "New Salary" FROM Employees;

-- Calculate Daily Salary
SELECT Name, Salary / 30 AS "Daily Pay" FROM Employees;
```

---

## 3. Concatenation Operator

Used to merge two or more strings (columns or text) into a single column.

### 🔗 The Pipe Operator (`||`)
*   **Oracle Syntax:** Uses double vertical bars `||`.
*   **MySQL Syntax:** Uses `CONCAT()` function.
*   **Result:** Always a Character String.

### 📐 Syntax
```sql
SELECT Column_1 || 'String' || Column_2 FROM Table_Name;
```

### 💻 Example
```sql
SELECT First_Name || ' ' || Last_Name AS "Full Name" 
FROM Employees;
-- Result: "John Doe"
```

---

## 4. Relational / Comparison Operators

Used to compare two values. These operators always return a **Boolean** result (True/False).

| Operator | Meaning |
| :---: | :--- |
| `=` | Equal to |
| `!=` or `<>` | Not Equal to |
| `>` | Greater Than |
| `<` | Less Than |
| `>=` | Greater Than or Equal to |
| `<=` | Less Than or Equal to |

### 📐 Syntax
```sql
SELECT * FROM Table_Name WHERE Column_Name [Operator] Value;
```

### 💻 Example
```sql
SELECT * FROM Student WHERE Age >= 18;
SELECT * FROM Employee WHERE Dept_ID != 10;
```

---

## 5. Logical Operators (Truth Tables)

Used to combine multiple conditions in a `WHERE` clause.

### 🖼️ Visual Logic (Venn Diagrams)
<p align="center">
  <img src="https://i.pinimg.com/1200x/6e/82/4f/6e824fb3222eb8b8cff2961dbfbbf1c6.jpg" alt="Logical Operators Venn Diagram" width="600">
</p>

### 🟢 AND Operator
**Definition:** Used when we want to satisfy **ALL** the conditions.
*   The row is selected **ONLY IF** both Condition 1 **AND** Condition 2 are True.

### 📐 Syntax
```sql
SELECT * FROM Table_Name 
WHERE Condition1 AND Condition2;
```

**Truth Table:**
| Cond 1 | Cond 2 | Result |
| :---: | :---: | :---: |
| T | T | **True** |
| T | F | False |
| F | T | False |
| F | F | False |

---

### 🔵 OR Operator
**Definition:** Used when we want to satisfy **AT LEAST ONE** of the conditions.
*   The row is selected if **EITHER** Condition 1 **OR** Condition 2 is True.

### 📐 Syntax
```sql
SELECT * FROM Table_Name 
WHERE Condition1 OR Condition2;
```

**Truth Table:**
| Cond 1 | Cond 2 | Result |
| :---: | :---: | :---: |
| T | T | **True** |
| T | F | **True** |
| F | T | **True** |
| F | F | False |

---

### 🔴 NOT Operator
**Definition:** Used to **REVERSE** or **REJECT** a particular condition.

### 📐 Syntax
```sql
SELECT * FROM Table_Name 
WHERE NOT Condition;
```

---

## 6. Special Operators (Deep Dive)

### 6.1 `IN` vs `NOT IN`

#### The `IN` Operator
**Definition:** It is a **Multi-Valued Operator** used to check if a value matches **ANY** value in a list. It acts as multiple `OR` conditions.

### 📐 Syntax
```sql
SELECT * FROM Table_Name 
WHERE Column_Name IN (Value1, Value2, Value3, ...);
```

#### The `NOT IN` Operator
**Definition:** It **REJECTS** the rows that match values in the list.
> **⚠️ Critical Rule:** If the list contains a `NULL` value, `NOT IN` returns **ZERO rows**.

### 📐 Syntax
```sql
SELECT * FROM Table_Name 
WHERE Column_Name NOT IN (Value1, Value2);
```

---

### 6.2 `BETWEEN` vs `NOT BETWEEN`

#### The `BETWEEN` Operator
**Definition:** Used to filter data within a specific range.
*   **Rule 1 (Inclusive):** It includes both the Lower Bound and the Upper Bound.
*   **Rule 2 (Order):** Must be `Lower_Value AND Upper_Value`.

### 📐 Syntax
```sql
SELECT * FROM Table_Name 
WHERE Column_Name BETWEEN Lower_Value AND Upper_Value;
```

### 💻 Example
```sql
SELECT * FROM EMP WHERE Salary BETWEEN 10000 AND 20000;
-- Fetches salary >= 10000 AND salary <= 20000
```

---

### 6.3 `IS NULL` vs `IS NOT NULL`

In SQL, `NULL` means "Unknown" or "Missing". It is **not** equal to Zero or Space.

### 📐 Syntax
```sql
-- Correct Way to check for NULL
SELECT * FROM Table_Name WHERE Column_Name IS NULL;

-- Correct Way to check for Data
SELECT * FROM Table_Name WHERE Column_Name IS NOT NULL;
```

> **❌ Invalid:** `WHERE Column = NULL` will never work because "Unknown" cannot equal "Unknown".

---

### 6.4 `LIKE` Operator (Wildcards)
Used for **Pattern Matching** in string data.

| Wildcard | Symbol | Meaning |
| :--- | :---: | :--- |
| **Percentage** | `%` | Represents **Zero, One, or Multiple** characters. |
| **Underscore** | `_` | Represents **EXACTLY ONE** character. |

### 📐 Syntax
```sql
SELECT * FROM Table_Name 
WHERE Column_Name LIKE 'Pattern';
```

**Examples:**
1.  `LIKE 'S%'` → Starts with 'S' (Sam, S, Super).
2.  `LIKE '%a'` → Ends with 'a'.
3.  `LIKE '_a%'` → Second character is 'a'.

---

## 7. Subquery Operators (Advanced)

These are used when comparing a column against the results of a Subquery (inner query).

### 1. `ALL` Operator
*   Compares a value to **every value** in a list or subquery results.
*   **Syntax:** `WHERE Column > ALL (Select Column from Table)`

### 2. `ANY` / `SOME` Operator
*   Compares a value to **at least one** value in a list.
*   **Syntax:** `WHERE Column > ANY (Select Column from Table)`

### 3. `EXISTS` vs `NOT EXISTS`
*   **Usage:** Checks for the *existence* of rows in a subquery.
*   **Syntax:**
    ```sql
    SELECT * FROM Table_A 
    WHERE EXISTS (SELECT * FROM Table_B WHERE Condition);
    ```

---

## 8. Operator Precedence (BODMAS)

If you use multiple operators in one line, Oracle executes them in this standard order.

<p align="center">
  <img src="https://data-flair.training/blogs/wp-content/uploads/sites/2/2019/04/Precedence-Table-of-Operators-in-SAP-HANA.jpg" alt="SQL Operator Precedence Chart" width="500">
</p>

1.  **Arithmetic** (`*`, `/` first, then `+`, `-`)
2.  **Concatenation** (`||`)
3.  **Comparison** (`=`, `>`, `<`, etc.)
4.  **IS [NOT] NULL, LIKE, [NOT] IN**
5.  **[NOT] BETWEEN**
6.  **NOT** (Logical)
7.  **AND** (Logical)
8.  **OR** (Logical)

---
## 9. 🧠 Top Interview Questions (Tricky & Advanced)

#### Q1: Which is faster: `=` OR `IN`?
> **Scenario:** `WHERE ID = 10 OR ID = 20` **vs** `WHERE ID IN (10, 20)`
> **Answer:**
> *   Technically, the Oracle Optimizer often rewrites `IN` lists into `OR` conditions internally, so performance is usually identical for small lists.
> *   However, **`IN` is preferred** because:
>     1.  It is more readable.
>     2.  If the list is huge (e.g., thousands of values), `IN` is significantly faster to parse than thousands of `OR` statements.

#### Q2: The "NOT IN" Trap: What happens if the list contains NULL?
> **Scenario:** `SELECT * FROM EMP WHERE Dept_ID NOT IN (10, 20, NULL);`
> **Answer:**
> *   **Result:** It returns **ZERO rows** (Empty Set), even if there are employees in Dept 30.
> *   **Reason:** SQL translates this to: `Dept_ID != 10 AND Dept_ID != 20 AND Dept_ID != NULL`.
> *   Since `Anything != NULL` results in **UNKNOWN**, the entire condition fails.
> *   **Fix:** Always ensure the subquery or list inside `NOT IN` does not contain NULLs.

#### Q3: What is the Order of Precedence: `AND` vs `OR`?
> **Scenario:** `WHERE City = 'Delhi' OR City = 'Mumbai' AND Age > 20`
> **Answer:**
> *   **AND** has higher priority than **OR**.
> *   The query actually executes as: `City = 'Delhi' OR (City = 'Mumbai' AND Age > 20)`.
> *   This means it will fetch **ALL** people from Delhi (regardless of Age) and only people > 20 from Mumbai.
> *   **Fix:** Use Parentheses `()` to force logic: `WHERE (City = 'Delhi' OR City = 'Mumbai') AND Age > 20`.

#### Q4: Why does `SELECT * FROM Table WHERE Column = NULL` return nothing?
> **Answer:**
> *   In SQL, `NULL` represents an **Unknown** value.
> *   Logically, "Unknown" cannot be equal to "Unknown". (e.g., Is the unknown money in my pocket equal to the unknown money in yours? We don't know).
> *   Therefore, `=` always returns `FALSE` (or Unknown) for NULLs. You **must** use `IS NULL`.

#### Q5: Can `BETWEEN` work in reverse order?
> **Scenario:** `WHERE Salary BETWEEN 50000 AND 10000`
> **Answer:**
> *   **No.** The syntax strictly requires `BETWEEN Lower_Bound AND Upper_Bound`.
> *   If you write it in reverse, Oracle looks for a number that is simultaneously `>= 50000` AND `<= 10000`, which is mathematically impossible. It returns 0 rows.

#### Q6: How does the wildcard `%` affect performance in `LIKE`?
> **Scenario:** `Name LIKE 'A%'` **vs** `Name LIKE '%A'`
> **Answer:**
> *   `'A%'` (Starts with A): **Fast.** The database can use an **Index** to jump to 'A'.
> *   `'%A'` (Ends with A): **Slow.** The database cannot use the standard index because the first character is unknown. It triggers a **Full Table Scan** (checking every single row).

#### Q7: Does `COUNT(Column_Name)` count NULL values?
> **Answer:**
> *   **No.** Aggregate functions like `COUNT(Col)`, `SUM(Col)`, `AVG(Col)` **ignore NULLs** completely.
> *   Only `COUNT(*)` counts rows containing NULLs.

#### Q8: What is the difference between `UNION` and `UNION ALL`? (Connection to Operators)
> **Answer:**
> *   `UNION` removes duplicates (Implicit `DISTINCT`), making it **slower** because it has to sort and filter data.
> *   `UNION ALL` keeps duplicates, making it **faster** as it just appends datasets.

---
*Created for Advanced SQL Learning.*
# 🗄️ SQL Mastery: From Fundamentals to Advanced Database Engineering

<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=6,11,20&height=180&section=header&text=SQL%20Mastery%20Journey&fontSize=42&fontColor=fff&animation=twinkling&fontAlignY=32"/>

![SQL](https://img.shields.io/badge/SQL-Mastery-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Oracle](https://img.shields.io/badge/ORACLE-F80000?style=for-the-badge&logo=oracle&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)

![GitHub commit activity](https://img.shields.io/github/commit-activity/m/Avinash-706/SQL-Practice?style=flat-square&logo=git&logoColor=white&label=Monthly&color=4CAF50)
![GitHub repo size](https://img.shields.io/github/repo-size/Avinash-706/SQL-Practice?style=flat-square&logo=github&logoColor=white&label=Size&color=2196F3)
![GitHub last commit](https://img.shields.io/github/last-commit/Avinash-706/SQL-Practice?style=flat-square&logo=github&logoColor=white&label=Updated&color=FF9800)
[![GitHub](https://camo.githubusercontent.com/fa1b85d320751d27a6606a9fb50706cda6778d05f2b5f32830c06a29aa9c68b6/68747470733a2f2f6b6f6d617265762e636f6d2f67687076632f3f757365726e616d653d4176696e6173682d373036267374796c653d666c61742d73717561726526636f6c6f723d626c7565)](https://github.com/Avinash-706)

</div>

<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&size=32&duration=2800&pause=2000&color=4A90E2&center=true&vCenter=true&width=940&lines=Welcome+to+SQL+Mastery+Repository!+%F0%9F%9A%80;From+Fundamentals+to+Advanced+Engineering+%F0%9F%97%84%EF%B8%8F;8+Days+of+Structured+Learning+%F0%9F%93%9A;125%2B+Interview+Questions+%F0%9F%92%BC" alt="Typing SVG" />

<img src="favicon.png" width="200" height="200" style="border-radius: 50%; object-fit: cover;">

### 📚 A Comprehensive SQL Learning Repository
**Structured Day-by-Day Journey from Basics to Advanced Database Concepts**

<p>
<a href="#-about-this-repository">About</a> •
<a href="#-learning-path">Learning Path</a> •
<a href="#-day-wise-breakdown">Day-wise Breakdown</a> •
<a href="#-key-features">Features</a> •
<a href="#-technologies--databases">Technologies</a> •
<a href="#-connect-with-me">Connect</a>
</p>

</div>

---

## 👨‍💻 About This Repository

This repository documents my **comprehensive journey** through SQL and Relational Database Management Systems. It's designed as a **structured learning path** that progresses from fundamental concepts to advanced database engineering techniques.

### 🎯 What Makes This Repository Unique?

- **📖 Deep Conceptual Understanding**: Not just queries, but the *why* and *how* behind SQL execution
- **🏗️ Architecture-First Approach**: Focus on internal execution flows and database internals
- **🔄 Multi-Database Coverage**: Syntax and patterns for Oracle, MySQL, PostgreSQL, and SQL Server
- **📊 Visual Learning**: Mermaid diagrams, execution flow charts, and architectural visualizations
- **💼 Interview-Ready**: Each day includes advanced interview questions and real-world scenarios
- **🧪 Hands-On Practice**: Practical queries with detailed explanations and test data

### 🎓 Learning Philosophy

> "Understanding the execution engine is more valuable than memorizing syntax."

This repository emphasizes:
- **Internal Execution Mechanics** over surface-level syntax
- **Performance Implications** of different query patterns
- **Relational Algebra** foundations
- **Real-World Application** scenarios

---

## 🗺️ Learning Path

<div align="center">

<img src="https://user-images.githubusercontent.com/74038190/212749447-bfb7e725-6987-49d9-ae85-2015e3e7cc41.gif" width="400">

</div>

```mermaid
%%{init: {
  "theme": "base",
  "themeVariables": {
    "primaryColor": "#1e3a8a",
    "primaryTextColor": "#fff",
    "primaryBorderColor": "#1e40af",
    "lineColor": "#3b82f6",
    "secondaryColor": "#dbeafe",
    "tertiaryColor": "#eff6ff",
    "fontSize": "14px"
  }
}}%%

graph LR
    A[Day 01<br/>Foundations] --> B[Day 02<br/>DQL Basics]
    B --> C[Day 03<br/>Operators]
    C --> D[Day 04<br/>Functions & Aggregates]
    D --> E[Day 05<br/>Subqueries & Joins]
    E --> F[Day 06<br/>Advanced Joins & Sets]
    F --> G[Day 07<br/>Correlated Logic]
    G --> H[Day 08<br/>DDL & Schema Design]
    
    style A fill:#1e3a8a,stroke:#1e40af,color:#fff
    style B fill:#2563eb,stroke:#3b82f6,color:#fff
    style C fill:#3b82f6,stroke:#60a5fa,color:#fff
    style D fill:#60a5fa,stroke:#93c5fd,color:#000
    style E fill:#93c5fd,stroke:#bfdbfe,color:#000
    style F fill:#dbeafe,stroke:#eff6ff,color:#000
    style G fill:#eff6ff,stroke:#dbeafe,color:#000
    style H fill:#f0f9ff,stroke:#e0f2fe,color:#000
```

---

## 📅 Day-wise Breakdown

### 🔷 [Day 01: Database Foundations](./day01/)
**Core Concepts Covered:**
- Data Anatomy & CRUD Operations
- DBMS vs RDBMS Architecture
- Codd's 12 Rules for Relational Databases
- Data Types & Constraint Fundamentals
- Database Cylinder Representation

**Key Takeaway:** Understanding the architectural foundation of relational databases and why constraints matter.

---

### 🔷 [Day 02: DQL Anatomy & Execution Order](./day02/)
**Core Concepts Covered:**
- SQL Sub-languages (DDL, DML, DCL, TCL)
- DQL Anatomy: Projection vs Selection
- Backend Order of Execution (FROM → WHERE → SELECT)
- Query Optimization Basics

**Key Takeaway:** How SQL engines process queries internally—the execution order is NOT the written order.

**Visual Aid:**
- Projection vs Selection Diagram
- Execution Flow Architecture

---

### 🔷 [Day 03: Operators & Logical Expressions](./day03/)
**Core Concepts Covered:**
- Arithmetic Operators (+, -, *, /, %)
- Relational Operators (=, !=, <, >, <=, >=)
- Logical Operators (AND, OR, NOT)
- Special Operators (IN, LIKE, BETWEEN, IS NULL)
- Operator Precedence & Evaluation Order

**Key Takeaway:** Mastering operator precedence prevents logical errors in complex WHERE clauses.

**Practical Queries:** 25+ operator-based queries with real-world scenarios

---

### 🔷 [Day 04: Functions, Aggregates & Subqueries](./day04/)
**Core Concepts Covered:**
- Single-Row Functions (String, Numeric, Date)
- Multi-Row Functions (COUNT, SUM, AVG, MAX, MIN)
- GROUP BY Architecture & Internal Execution
- HAVING vs WHERE (Filter Timing)
- Introduction to Subqueries

**Key Takeaway:** Understanding when aggregation happens in the execution pipeline.

**Visual Aids:**
- Single vs Multi-Row Function Comparison
- WHERE vs HAVING Execution Flow
- CONCAT Function Mechanics

---

### 🔷 [Day 05: Subqueries, Joins & Relationships](./day05/)
**Core Concepts Covered:**
- Subquery Operators (ALL, ANY, SOME)
- Unary Relationships (Employee-Manager Hierarchy)
- Join Fundamentals (Cartesian, Inner, Natural, Self)
- Outer Joins (Left, Right, Full)
- Oracle Legacy Syntax (+)

**Key Takeaway:** Joins are the bridge that reconstructs normalized data.

**Visual Aids:**
- Unary Relationship Diagram
- Join Execution Flow (Nested Loop)
- SQL Joins Venn Diagram

**Interview Questions:** 15 advanced join scenarios

---

### 🔷 [Day 06: Advanced Joins, Set Theory & Correlated Logic](./day06/)
**Core Concepts Covered:**
- Self Join (Recursive Hierarchies)
- Full Outer Join Engineering (MySQL Workaround)
- Set Operators (UNION, INTERSECT, MINUS/EXCEPT)
- Numeric Functions (ROUND, TRUNC, FLOOR, CEIL, MOD)
- Correlated Subqueries (The Loop Pattern)

**Key Takeaway:** Set operators merge results vertically; understanding their internal sort-merge mechanics.

**Visual Aids:**
- MySQL Full Join Workaround Diagram
- Correlated Subquery Execution Loop
- Set Operators Venn Diagram

**Performance Analysis:** Correlated Subquery vs Join benchmarking

---

### 🔷 [Day 07: Nth Highest/Lowest & String Engineering](./day07/)
**Core Concepts Covered:**
- Nth Highest/Lowest Salary Patterns (Without Window Functions)
- Correlated Subquery Ranking Logic
- Department-wise Ranking
- String Manipulation (SUBSTR, REPLACE, LENGTH)
- Character Counting Techniques
- DDL Introduction (CREATE, RENAME, Foreign Keys)

**Key Takeaway:** Classical ranking approach using correlated logic—understanding the counting mechanism.

**Visual Aids:**
- Nth Highest Execution Flow Diagram
- Step-by-Step Ranking Logic

**Practical Queries:** 10+ ranking patterns (4th highest, 5th minimum, top N, etc.)

---

### 🔷 [Day 08: DDL Mastery & Schema Design](./day08/)
**Core Concepts Covered:**
- DDL vs DML (The Fundamental Divide)
- Table Inspection (SHOW, DESCRIBE, SHOW CREATE TABLE)
- ALTER TABLE Operations (MODIFY, ADD, DROP, RENAME)
- Constraint Architecture (PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK, NOT NULL)
- Referential Integrity & CASCADE Options
- Relationship Patterns (1:N, M:N with Junction Tables)
- AUTO_INCREMENT Identity Columns
- DROP vs TRUNCATE vs DELETE

**Key Takeaway:** Schema design is the foundation of data integrity—constraints enforce business rules at the database level.

**Practical Implementation:** Complete Customer-Product system with referential integrity

---

## 🎯 Key Features

<div align="center">

<img src="https://user-images.githubusercontent.com/74038190/212284100-561aa473-3905-4a80-b561-0d28506553ee.gif" width="700">

</div>

### 📚 Comprehensive Documentation
- **Detailed Explanations**: Every concept explained with the "why" behind it
- **Execution Flow Diagrams**: Visual representation of how SQL engines process queries
- **Multi-Database Syntax**: Oracle, MySQL, PostgreSQL, SQL Server variations

### 🔬 Deep Technical Insights
- **Internal Execution Mechanics**: Understanding query optimization and execution plans
- **Performance Considerations**: Time complexity analysis and optimization strategies
- **Architectural Patterns**: Relational algebra foundations

### 💼 Interview Preparation
- **125+ Interview Questions**: Spread across all days
- **Tricky Scenarios**: Edge cases and common pitfalls
- **Real-World Problems**: Practical business logic implementation

### 🎨 Visual Learning
- **Mermaid Diagrams**: Execution flows, relationships, and architectures
- **Comparison Tables**: Side-by-side syntax and behavior comparisons
- **Data Scenarios**: Sample datasets for understanding query results

---

## 🛠️ Technologies & Databases

<div align="center">

<img src="https://user-images.githubusercontent.com/74038190/212257454-16e3712e-945a-4ca2-b238-408ad0bf87e6.gif" width="100">
<img src="https://user-images.githubusercontent.com/74038190/212257472-08e52665-c503-4bd9-aa20-f5a4dae769b5.gif" width="100">
<img src="https://user-images.githubusercontent.com/74038190/212257468-1e9a91f1-b626-4baa-b15d-5c385dfa7ed2.gif" width="100">
<img src="https://user-images.githubusercontent.com/74038190/212257465-7ce8d493-cac5-494e-982a-5a9deb852c4b.gif" width="100">
<img src="https://user-images.githubusercontent.com/74038190/212281775-b468df30-4edc-4bf8-a4ee-f52e1aaddc86.gif" width="100">

| Database | Version | Coverage |
|:--------:|:-------:|:--------:|
| **MySQL** | 8.0+ | ✅ Primary |
| **Oracle** | 11g+ | ✅ Full |
| **PostgreSQL** | 12+ | ✅ Full |
| **SQL Server** | 2019+ | ✅ Syntax |

</div>

### 🔧 Tools Used
- **Database Clients**: MySQL Workbench, Oracle SQL Developer, pgAdmin
- **Version Control**: Git & GitHub
- **Documentation**: Markdown with Mermaid diagrams
- **Testing**: SCOTT schema (Oracle standard practice dataset)

---

## 📊 Repository Structure

```
SQL-Practice/
│
├── 📁 day01/          # Database Foundations
│   ├── infoDay01.md
│   └── DatabaseCyclinderRepresentation.jpg
│
├── 📁 day02/          # DQL Anatomy
│   ├── infoDay02.md
│   └── ProjectVsSelection.png
│
├── 📁 day03/          # Operators
│   ├── queries.sql
│   └── README.md
│
├── 📁 day04/          # Functions & Aggregates
│   ├── query.sql
│   ├── README.md
│   └── [Visual Aids]
│
├── 📁 day05/          # Subqueries & Joins
│   ├── query.sql
│   ├── README.md
│   └── UnaryRelationship_01.png
│
├── 📁 day06/          # Advanced Joins & Sets
│   ├── query.sql
│   ├── README.md
│   └── CoRelatedSubquery.png
│
├── 📁 day07/          # Correlated Logic & Strings
│   ├── query.sql
│   └── README.md
│
├── 📁 day08/          # DDL & Schema Design
│   ├── query.sql
│   ├── QUERY1.SQL
│   └── README.md
│
├── favicon.png        # Repository Icon
└── README.md          # This File
```

---

## 🚀 How to Use This Repository

<div align="center">

<img src="https://user-images.githubusercontent.com/74038190/212741999-016fddbd-617a-4448-8042-0ecf907aea25.gif" width="500">

</div>

### For Learners:
1. **Sequential Learning**: Start from Day 01 and progress chronologically
2. **Hands-On Practice**: Execute queries in your local database environment
3. **Understand, Don't Memorize**: Focus on execution logic, not syntax
4. **Experiment**: Modify queries and observe behavior changes

### For Interviewers/Recruiters:
- **Depth of Knowledge**: Notice the focus on internal mechanics, not just syntax
- **Problem-Solving Approach**: Each day builds on previous concepts systematically
- **Documentation Skills**: Clear, professional technical writing
- **Multi-Database Proficiency**: Cross-platform SQL expertise

### For Contributors:
- Fork the repository
- Add your own queries or improvements
- Submit pull requests with detailed explanations
- Follow the established documentation style

---

## 📈 Learning Outcomes

By completing this repository, you will:

✅ **Understand** SQL execution internals and query optimization<br>
✅ **Master** complex joins, subqueries, and set operations<br>
✅ **Design** normalized database schemas with proper constraints<br>
✅ **Write** efficient, production-ready SQL queries<br>
✅ **Debug** query performance issues<br>
✅ **Ace** SQL technical interviews<br>
✅ **Work** confidently with Oracle, MySQL, PostgreSQL, and SQL Server<br>

---

## 🎓 Skill Progression

```mermaid
%%{init: {
  "theme": "base",
  "themeVariables": {
    "primaryColor": "#10b981",
    "primaryTextColor": "#fff",
    "primaryBorderColor": "#059669",
    "lineColor": "#6b7280",
    "fontSize": "13px"
  }
}}%%

graph TD
    A[Beginner<br/>Days 1-2] -->|Foundations| B[Intermediate<br/>Days 3-5]
    B -->|Complex Queries| C[Advanced<br/>Days 6-7]
    C -->|Schema Design| D[Expert<br/>Day 8]
    
    A1[Basic SELECT<br/>Data Types<br/>Simple WHERE] -.-> A
    B1[Joins<br/>Subqueries<br/>Aggregates] -.-> B
    C1[Correlated Logic<br/>Set Operations<br/>Optimization] -.-> C
    D1[DDL Mastery<br/>Constraints<br/>Architecture] -.-> D
    
    style A fill:#10b981,stroke:#059669,color:#fff
    style B fill:#3b82f6,stroke:#2563eb,color:#fff
    style C fill:#f59e0b,stroke:#d97706,color:#fff
    style D fill:#ef4444,stroke:#dc2626,color:#fff
```

---

## 💡 Best Practices Learned

### Query Optimization
- Always use `DISTINCT` in COUNT for ranking queries
- Prefer JOINs over Correlated Subqueries for large datasets
- Use `EXISTS` instead of `IN` for better performance
- Avoid `SELECT *` in production code

### Schema Design
- Enforce business rules at the database level with constraints
- Use Foreign Keys for referential integrity
- Normalize to 3NF, denormalize only when necessary
- Index foreign key columns for join performance

### Code Quality
- Use meaningful table and column aliases
- Comment complex queries
- Follow consistent naming conventions
- Test with edge cases (NULL values, empty sets)

---

## 🌟 Highlights & Achievements

<div align="center">

<img src="https://user-images.githubusercontent.com/74038190/212748830-4c709398-a386-4761-84d7-9e10b98fbe6e.gif" width="400">

</div>

- **📝 8 Days** of structured learning
- **📄 1000+ Lines** of documented SQL queries
- **🎨 25+ Diagrams** for visual understanding
- **❓ 125+ Interview Questions** with detailed answers
- **🔄 Multi-Database** syntax coverage
- **🏗️ Production-Ready** schema design patterns

<div align="center">

### 📊 Repository Statistics

<img src="https://github-readme-stats-iota-eight-rwdiaowt32.vercel.app/api?username=Avinash-706&show_icons=true&theme=tokyonight&hide_border=true&bg_color=0D1117&title_color=58A6FF&icon_color=1F6FEB&text_color=C9D1D9&count_private=true&include_all_commits=true" width="49%" />
<img src="https://github-readme-streak-stats.herokuapp.com/?user=Avinash-706&theme=tokyonight&hide_border=true&background=0D1117&stroke=58A6FF&ring=58A6FF&fire=FF6B6B&currStreakLabel=C9D1D9" width="49%" />

</div>

</div>

---

## 🤝 Connect With Me

<div align="center">

<img src="https://user-images.githubusercontent.com/74038190/212284087-bbe7e430-757e-4901-90bf-4cd2ce3e1852.gif" width="100">

### Avinash Dhanuka

**Database Engineer | SQL Specialist | Backend Developer**

<img src="https://user-images.githubusercontent.com/74038190/212284158-e840e285-664b-44d7-b79b-e264b5e54825.gif" width="400">

[![Gmail](https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:avunashdhanuka@gmail.com)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Avinash-706)
[![Portfolio](https://img.shields.io/badge/Portfolio-4A90E2?style=for-the-badge&logo=google-chrome&logoColor=white)](https://avinashdhanuka.vercel.app/)


**📧 Email:** [avunashdhanuka@gmail.com](mailto:avunashdhanuka@gmail.com)

<img src="https://user-images.githubusercontent.com/74038190/212284115-f47cd8ff-2ffb-4b04-b5bf-4d1c14c0247f.gif" width="1000">

</div>

### 💬 Let's Discuss:
- Database Architecture & Optimization
- SQL Performance Tuning
- Backend Development
- System Design
- Career Opportunities

<div align="center">

### 💎 Code Quality & Best Practices

<div align="center">

<img src="https://user-images.githubusercontent.com/74038190/212257460-738ff738-247f-4445-a718-cdd0ca76e2db.gif" width="100">
<img src="https://user-images.githubusercontent.com/74038190/212257463-4d082cb4-7483-4eaf-bc25-6dde2628aabd.gif" width="100">
<img src="https://user-images.githubusercontent.com/74038190/212257465-7ce8d493-cac5-494e-982a-5a9deb852c4b.gif" width="100">
<img src="https://user-images.githubusercontent.com/74038190/212257468-1e9a91f1-b626-4baa-b15d-5c385dfa7ed2.gif" width="100">
<img src="https://user-images.githubusercontent.com/74038190/212257472-08e52665-c503-4bd9-aa20-f5a4dae769b5.gif" width="100">
<img src="https://user-images.githubusercontent.com/74038190/212281775-b468df30-4edc-4bf8-a4ee-f52e1aaddc86.gif" width="100">

</div>

### 📊 Repository Insights

<div align="center">

<img src="https://github-readme-activity-graph.vercel.app/graph?username=Avinash-706&custom_title=SQL%20Practice%20Contribution%20Graph&bg_color=0D1117&color=58A6FF&line=1F6FEB&point=58A6FF&area_color=1F6FEB&title_color=58A6FF&area=true&hide_border=true" width="98%"/>

<img src="https://user-images.githubusercontent.com/74038190/212284158-e840e285-664b-44d7-b79b-e264b5e54825.gif" width="400">

</div>

</div>

</div>

---

## 📜 License & Usage

<div align="center">

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge&logo=opensourceinitiative&logoColor=white)](https://opensource.org/licenses/MIT)
[![CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg?style=for-the-badge&logo=creativecommons&logoColor=white)](https://creativecommons.org/licenses/by/4.0/)
[![Open Source](https://img.shields.io/badge/Open%20Source-%E2%9D%A4-red?style=for-the-badge&logo=github&logoColor=white)](https://opensource.org/)

**Copyright © 2026 Avinash Dhanuka**

This repository is licensed under the **MIT License** - you are free to use, modify, and distribute this code with attribution.  
Educational content is also available under **Creative Commons Attribution 4.0 International (CC BY 4.0)**.

📖 [View Full License](./LICENSE) • 🎓 [Educational Use Guidelines](./LICENSE-CC-BY)

</div>

---

## 🙏 Acknowledgments

- **Oracle SCOTT Schema**: Standard practice dataset
- **SQL Community**: For best practices and patterns
- **Database Documentation**: Oracle, MySQL, PostgreSQL official docs

---

## 📌 Quick Links

- [Start Learning (Day 01)](./day01/)
- [Advanced Topics (Day 06-08)](./day06/)
- [Interview Questions Collection](#-day-wise-breakdown)
- [Contact Me](#-connect-with-me)

---

<div align="center">

<img src="https://user-images.githubusercontent.com/74038190/212284136-03988914-d899-44b4-b1d9-4eeccf656e44.gif" width="800">

### ⭐ If you find this repository helpful, please consider giving it a star!

<img src="https://user-images.githubusercontent.com/74038190/216122041-518ac897-8d92-4c6b-9b3f-ca01dcaf38ee.png" width="200" />

### 🎯 Learning Never Stops

<img src="https://user-images.githubusercontent.com/74038190/212750672-2f3f2b50-c84f-4ed8-a60a-849ae69ff9df.gif" width="400">

<br/>

<img src="./favicon.png" width="150" style="border-radius: 50%; object-fit: cover;">

**Made with ❤️ and ☕ by Avinash Dhanuka**

### 📬 Stay Connected

<a href="mailto:avunashdhanuka@gmail.com">
  <img src="https://img.shields.io/badge/Email-Me-red?style=for-the-badge&logo=gmail&logoColor=white" />
</a>
<a href="https://avinashdhanuka.vercel.app/">
  <img src="https://img.shields.io/badge/Visit-Portfolio-blue?style=for-the-badge&logo=google-chrome&logoColor=white" />
</a>
<a href="https://github.com/Avinash-706">
  <img src="https://img.shields.io/badge/Follow-GitHub-black?style=for-the-badge&logo=github&logoColor=white" />
</a>

<br/><br/>

<img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&height=100&section=footer"/>

*Last Updated: February 2026*

</div>

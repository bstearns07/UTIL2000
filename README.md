<a id="top"></a>
# UTIL2000 (COBOL) - Electric Bill Calculator

## 👤 Author
Ben Stearns - [@bstearns07](https://github.com/bstearns07)<br>

📅 **Last Updated:** 2/10/2026

## 📑 Table of Contents
- 📌 [Summary](#-summary)
- ⭐ [How It Works](#-how-it-works)
- ✨ [Features](#-features)
- 🧰 [Tech Stack](#-tech-stack)
- 🔧 [Development Tools](#-development-tools)
- 🧩 [Core Concepts](#-core-concepts)
- 📝 [New Topics Covered](#-new-topics-covered)
- 📘 [What I Learned](#-what-i-learned)
- 🖼 [Screenshots](#-screenshots)

## 📌 Summary

### Welcome to the Electric Bill Calculator!
This COBOL program is used to caculate the total electric bill for 3 customers based on pre-defined KWH used and a 3-tiered charging system.<br>
<br>
For every run, the program will:
  1. Initialize program variables to a starting value of 0
  2. Load each customer and their electricity use information one a time
  3. Calculate the customer's bill based on what tier of electricity they used
  4. Output the results into a final summary report for all 3 customers

For full program details, see [Program Requirements](assets/AssignmentRequirements.pdf)

---

## ⭐ How It Works
1. 📋 Displays program header  
2. 👥 Loads predefined customer data (name, kWh usage, service fee)  
3. 🔁 Iterates through each customer  
4. ⚖️ Splits energy usage into **pricing tiers**  
5. 🧮 Calculates:
   - Tier charges  
   - Subtotal  
   - Total bill (including service fee)  
6. 🧾 Outputs a **formatted bill breakdown** for each customer  

---

## ✨ Features
- ⚡ Calculates **utility bills using tiered pricing**  
- 👥 Processes **multiple customers in a single run**  
- 📊 Breaks down charges by **tier level**  
- 💰 Includes **service fees + subtotal calculations**  
- 🧾 Displays **clean, formatted billing output**  
- 🔁 Modular design with reusable billing procedures  

---

## 🧰 Tech Stack
![COBOL](https://img.shields.io/badge/COBOL-Enterprise%206.4-blue?style=flat-square)
![z/OS](https://img.shields.io/badge/IBM-z%2FOS-0f62fe?style=flat-square)
![VS Code](https://img.shields.io/badge/VS%20Code-Zowe%20Explorer-007ACC?style=flat-square)

- **Enterprise COBOL 6.4** – Core logic and calculations  
- **IBM z/OS** – Execution environment  

---

## 🔧 Development Tools
- 💻 Visual Studio Code + Zowe Explorer  
- 🖥️ IBM z/OS Mainframe  
- 📂 Partitioned Datasets (PDS)  

---

## 🧩 Core Concepts
- 🔁 **Modular program structure** (`PERFORM` procedures)  
- 🧮 **Arithmetic operations & financial calculations**  
- 📊 **Tier-based logic and conditional branching**  
- 🧾 **Formatted output using PIC clauses**  
- 🧱 **Working-storage organization and data grouping**  

---

## 📝 New Topics Covered
- ⚖️ **Tiered pricing algorithms** (multi-level rate calculation)  
- 🔀 **Complex conditional logic** (`IF / ELSE` branching across tiers)  
- 🔄 **Data reloading pattern** (reusing variables for multiple customers)  
- 💰 **Multiple-step financial calculations** (tier → subtotal → total)  
- 🎯 **Separation of concerns** (initialize → calculate → display flow)  

---

## 📘 What I Learned
- How to implement **tier-based billing systems**, a common real-world pattern  
- Breaking down complex calculations into **manageable procedural steps**  
- Structuring programs for **reusability and clarity**  
- Using COBOL to simulate **business logic beyond simple reporting**  
- The importance of **data formatting for financial outputs**  

---

## 🖼 Screenshots

### Output
![Output](assets/output_topHalf.png)
![Output](assets/output_bottomHalf.png)

5. Division Structure
6. MOVE, COMPUTE, DISPLAY, UNTIL statements
7. ** Program was build entirely in the mainframe without IDE support **

[Back to Top](#top)

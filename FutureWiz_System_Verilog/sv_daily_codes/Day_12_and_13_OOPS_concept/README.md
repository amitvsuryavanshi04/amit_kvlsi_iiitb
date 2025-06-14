# 🎯 OOPS Concepts in SystemVerilog

SystemVerilog supports **Object-Oriented Programming (OOP)**, enhancing code **modularity**, **reuse**, and **scalability**—essential for complex verification and modeling.  
This folder currently includes **two core pillars** of OOP, with clean examples and usage demonstrations.

---

## 📌 1. Inheritance 🧬

> **Definition**: Inheritance allows a **child class (derived class)** to access properties and methods from a **parent class (base class)**.

🔹 Promotes **code reusability**  
🔹 Supports **hierarchical relationships**  
🔹 Simplifies **maintenance and extension** of existing code  

📁 _Check the example to understand how child classes inherit and override functionality from base classes in SV._

---

## 📌 2. Polymorphism 🌀

> **Definition**: Polymorphism allows methods of the **child class** to be accessed using a **parent class handle**—letting **parent behave like a child**.

🔹 Enables **dynamic method dispatch** using `virtual` methods  
🔹 Supports **flexibility in code behavior at runtime**  
🔹 Reduces **tight coupling** between testbench components  

📁 _Explore examples demonstrating virtual functions and handles in action._

---
## 📌 3. Encapsulation 🔒

> **Definition**: Encapsulation is the technique of **binding data (variables)** and the **methods (functions)** that operate on them within a class and restricting direct access to them.

🔹 Protects **internal object state** using `local`, `protected`, and `public` keywords  
🔹 Promotes **data hiding** and **clean and protected data exposure**  
🔹 Improves **code robustness** and **security**

📁 _See the example to learn how to restrict access and expose only necessary interfaces in SV classes._

---
🔧 **Coming Soon**:  
-  
- 🧠 **Abstraction**  

---

### 📚 Summary

| OOP Concept     | Description                                      | Status       |
|----------------|--------------------------------------------------|--------------|
| Inheritance     | Share features from base to derived classes      | ✅ Implemented |
| Polymorphism    | Parent handles calling child methods             | ✅ Implemented |
| Encapsulation   | Bind data and methods with access restrictions   | ✅ Implemented |
| Abstraction     | Hiding internal details, showing only essentials | 🚧 In Progress |

---

📌 **Language**: SystemVerilog  
📂 **Domain**:  Verification / Digital Design  

---

> 🔗 _Feel free to explore, clone, and contribute!_


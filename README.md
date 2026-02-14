# Salary Management API (Incubyte Kata)

A Rails API-only application to manage employees and provide salary-related calculations and metrics, built using a **strict TDD approach**.

---

## 🛠 Tech Stack

- Ruby 3.x  
- Rails 7 (API-only)  
- SQLite  
- RSpec  

---

## 🚀 Setup Instructions

```bash
bundle install
rails db:create db:migrate
bundle exec rspec
```

---

## 📌 API Endpoints

### 👤 Employee CRUD

- `POST /employees` – Create employee  
- `GET /employees` – List employees  
- `GET /employees/:id` – Show employee  
- `PATCH /employees/:id` – Update employee  
- `DELETE /employees/:id` – Delete employee  

---

### 💰 Salary Breakdown

**Endpoint**
```
GET /employees/:id/salary_breakdown
```

**Rules**
- India → 10% deduction  
- United States → 12% deduction  
- Other countries → No deduction  

**Response**
```json
{
  "gross_salary": 50000.0,
  "deduction": 5000.0,
  "net_salary": 45000.0
}
```

---

### 📊 Salary Metrics

**By Country**
```
GET /salary_metrics?country=India
```
Returns min, max, and average salary.

**By Job Title**
```
GET /salary_metrics?job_title=Developer
```
Returns average salary.

---

## 🧪 Testing & TDD

- Strict **Red → Green → Refactor** workflow
- Request specs for APIs
- Model specs for validations
- Commit history reflects TDD evolution

---

## 🧱 Architecture Decisions

- Thin controllers
- Business logic extracted into service objects:
  - `SalaryCalculator`
  - `SalaryMetrics`
- Reusable ActiveRecord scopes for filtering
- Centralized error handling for `RecordNotFound`

---

## 🤖 AI Usage Disclosure

AI tools (ChatGPT) were used to:
- Scaffold test cases
- Validate TDD workflow
- Review architecture decisions

All logic, structure, and final decisions were reviewed and implemented manually.

---
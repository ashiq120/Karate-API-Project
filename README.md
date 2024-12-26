# Swagger Petstore API - Karate Implementation

This project demonstrates how to use **Karate API** for testing RESTful web services with the [Swagger Petstore API](https://petstore.swagger.io/). The Swagger Petstore API serves as a public RESTful API for learning and testing CRUD operations.

---

## **About Swagger Petstore API**
The Swagger Petstore API provides endpoints for managing pets, store orders, and users. Key operations include:

- **Pet Operations**: Add, update, retrieve, and delete pets.
- **Store Operations**: Place and delete orders, check inventory.
- **User Operations**: Create, update, and delete users, and manage user sessions.

---

## **Project Overview**
This project uses Karate API to automate tests for the following Swagger Petstore API operations:

- **Pet Endpoints**: 
  - Add a pet
  - Get a pet by ID
  - Update a pet
  - Delete a pet

- **Store Endpoints**:
  - Get inventory by status
  - Place an order
  - Get an order by ID
  - Delete an order

- **User Endpoints**:
  - Create a user
  - Log in a user

---

## **Project Structure**

```plaintext
Karate-API-Project/
|-- src/
|   |-- test/
|       |-- java/
|           |-- examples/
|           |-- ExamplesTest.java
|               |-- petstore.feature
|-- pom.xml
|-- .gitignore
|-- README.md
```

- **`petstore.feature`**: Contains test scenarios written in Gherkin syntax for various API operations.
- **`ExamplesTest.java`**: JUnit class for running Karate tests.
- **`pom.xml`**: Manages dependencies for Karate, JUnit, and reporting.
- **`.gitignore`**: Specifies files to exclude from version control.

---

## **How It Works**

### **1. Writing Tests**
Each API operation is defined as a scenario in `petstore.feature`. Example:

#### Add a New Pet
```gherkin
Scenario: Add a new pet
    Given url 'https://petstore.swagger.io/v2/pet'
    And request {
        "id": 12345,
        "name": "Tommy",
        "status": "available"
    }
    When method POST
    Then status 200
    And match response.name == 'Tommy'
```

### **2. Running Tests**
Run all tests using Maven:
```bash
mvn test
```

The `ExamplesTest.java` file will execute the scenarios in `petstore.feature`.

### **3. Validating Responses**
Karate simplifies response validations with its `match` syntax. Example:
```gherkin
And match response.status == 'available'
```

### **4. Chaining Requests**
Karate supports chaining multiple API calls in a single feature file to test workflows.

---

## **Generating Reports**

Karate automatically generates detailed test reports after execution.

### **Steps to Generate and View Reports**

1. **Run Tests**: Execute the tests using Maven:
   ```bash
   mvn test
   ```

2. **Locate Reports**: After execution, reports will be available in the `target/karate-reports/` folder.

3. **Open Report**: Open the `karate-summary.html` file in a browser to view the results.

### **Report Contents**
The report includes:

- **Execution Summary**: Total tests executed, passed, and failed.
- **Scenario Details**: Requests, responses, and assertions for each test.
- **Error Messages**: For failed tests, detailed error logs are provided.

---

## **Example Scenarios**

### **Get Pet by ID**
```gherkin
Scenario: Get pet by ID
    Given url 'https://petstore.swagger.io/v2/pet/1'
    When method GET
    Then status 200
    And match response.id == 1
```
---

## **Extending the Project**

1. Add more test cases for additional endpoints or error scenarios.
2. Use data-driven testing to handle dynamic inputs.
3. Integrate with CI/CD pipelines to automate testing workflows.

---

## **Conclusion**
This project provides a comprehensive demonstration of testing the Swagger Petstore API using Karate. The framework's simplicity and powerful features make it ideal for API automation, ensuring robust and reliable software delivery.

For more information, visit the [Karate GitHub Repository](https://github.com/karatelabs/karate).


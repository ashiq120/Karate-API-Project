Feature: Swagger Petstore API Tests

Scenario: Get pet by ID
    Given url 'https://petstore.swagger.io/v2/pet/1'
    When method GET
    Then status 200
    And match response.id == 1


# 1. Test for adding a new pet    
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




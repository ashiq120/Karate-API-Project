Feature: Swagger Petstore API

Background:
  * url 'https://petstore.swagger.io/v2'

# Test: Add a new pet
Scenario: Add a pet
  Given path 'pet'
  And request { "id": 12345, "name": "Doggy", "status": "available" }
  When method POST
  Then status 200
  And match response.status == 'available'

# Test: Get pet by ID
Scenario: Get pet by ID
  Given path 'pet', 12345
  When method GET
  Then status 200
  And match response.name == 'Doggy'

# Test: Delete pet
Scenario: Delete pet
  Given path 'pet', 12345
  When method DELETE
  Then status 200
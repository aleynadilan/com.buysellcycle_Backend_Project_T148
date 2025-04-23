Feature: As an administrator, I want to add a new holiday record via the API connection.

  Scenario: When a POST request with valid authorization and holiday data (year, name, date) is sent to the /api/holidayAdd
  endpoint, it should be verified that the status code is 201 and the response message is 'holiday added successfully'.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/holidayAdd" path parameters.
    # Api kullanicisi "api/holidayAdd" path parametrelerini olusturur
    * The api user prepares a post request body to send to the api holidayAdd endpoint.
    # Api kullanicisi api holidayAdd endpointine gondermek icin bir post request body hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 201.
    # Api kullanicisi status codeun 201 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "holiday added successfully".
    # Api kullanicisi response bodydeki message bilgisinin "holiday added successfully" oldugunu dogrular


  Scenario: When a POST request containing valid authorization and holiday data (year, name, date) is sent to the
  /api/holidayAdd endpoint, it should be verified that the status code is 201 and the response message is
  'holiday added successfully'.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/holidayAdd" path parameters.
    # Api kullanicisi "api/holidayAdd" path parametrelerini olusturur
    * The api user prepares a post request body containing the holiday data registered in the system to send to the api holidayAdd endpoint.
    # Api kullanicisi api holidayAdd endpointine gondermek icin sisteme kayitli holiday verilerini iceren bir post request body hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 400.
    # Api kullanicisi status codeun 400 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "dublicate holiday request".
    # Api kullanicisi response bodydeki message bilgisinin "dublicate holiday request" oldugunu dogrular


  Scenario: When a POST request with invalid authorization and holiday data (year, name, date) is sent to the /api/holidayAdd
  endpoint, it should be verified that the status code is 401 and the response message is 'Unauthenticated.'

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/holidayAdd" path parameters.
    # Api kullanicisi "api/holidayAdd" path parametrelerini olusturur
    * The api user prepares a post request body to send to the api holidayAdd endpoint.
    # Api kullanicisi api holidayAdd endpointine gondermek icin bir post request body hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 401.
    # Api kullanicisi status codeun 401 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".
    # Api kullanicisi response bodydeki message bilgisinin "Unauthenticated." oldugunu dogrular



  Scenario Outline: The newly created holiday record should be verified by sending a GET request with the added_item_id
  (returned in the holidayAdd response) to the /api/holidayDetails endpoint, and checking that the returned data matches
  the originally submitted values.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/holidayDetails" path parameters.
    # Api kullanicisi "api/holidayDetails" path parametrelerini olusturur
    * The api user prepares a GET request body to send to the api holidayDetails endpoint containing the information <id>.
    # Api kullanicisi api holidayDetails endpointine gondermek icin <id> bilgisini iceren bir get request body hazirlar
    * The api user sends a GET request body and saves the returned response.
    # Api kullanicisi GET request body gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular

    Examples:
      | id  |
      | 166 |


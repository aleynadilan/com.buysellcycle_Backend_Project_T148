Feature: As an administrator, I should be able to access the detailed information of the holiday with the specified id number via the API connection.

  Scenario Outline: When a GET request with valid authorization and a holiday ID is sent to the /api/holidayDetails endpoint,
  it should be verified that the status code is 200, the response message is 'success', and the holidayDetails data (id, year,
  name, type, date, created_at, updated_at) are correct.

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
    * The api user verifies that the "message" information in the response body is "success".
    # Api kullanicisi response bodydeki message bilgisinin "success" oldugunu dogrular
    * The api user validates the contents of the holidayDetails data <id>, "<year>", "<name>", <type>, "<date>", "<created_at>" and "<updated_at>" in the response body.
    # Api kullanicisi response bodydeki holidayDetails datalarının <id>, "<year>", "<name>", <type>, "<date>", "<created_at>" ve "<updated_at>" içeriklerini doğrular.

    Examples:
      | id | id | year | name                                      | type | date       | created_at                  | updated_at                  |
      | 3  | 3  | 2023 | 23 Nisan Ulusal Egemenlik ve Çocuk Bayram | 0    | 2023-04-23 | 2024-03-12T15:32:29.000000Z | 2024-03-12T15:32:29.000000Z |


  Scenario: When a GET request is sent to the /api/holidayDetails endpoint with valid authorization information and no data
  (holiday id), it must be verified that the returned status code is 404 and the message information in the response body is
  "holiday not found".

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/holidayDetails" path parameters.
    # Api kullanicisi "api/holidayDetails" path parametrelerini olusturur
    * The api user prepares a GET request that does not contain data to the api holidayDetails endpoint.
    # Api kullanicisi api holidayDetails endpointine data icermeyen bir get request hazirlar
    * The api user sends a GET request, saves the returned response, and verifies that the status code is '404' with the reason phrase Not Found.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '404' ve reason phrase bilgisinin Not Found oldugunu dogrular


  Scenario Outline: When a GET body containing valid authorization information and an incorrect (non-existent) holiday id is
  sent to the /api/holidayDetails endpoint, it should be verified that the returned status code is 404 and the message
  information in the response body is "holiday not found".

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/holidayDetails" path parameters.
    # Api kullanicisi "api/holidayDetails" path parametrelerini olusturur
    * The api user prepares a GET request body to send to the api holidayDetails endpoint containing the information <id>.
    # Api kullanicisi api holidayDetails endpointine gondermek icin <id> bilgisini iceren bir get request body hazirlar
    * The api user sends a GET request, saves the returned response, and verifies that the status code is '404' with the reason phrase Not Found.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '404' ve reason phrase bilgisinin Not Found oldugunu dogrular

    Examples:
      | id   |
      | 8754 |


  Scenario Outline: When a GET request with invalid authorization and a holiday ID is sent to the /api/holidayDetails endpoint,
  it should be verified that the status code is 401 and the response message is 'Unauthenticated.'

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/holidayDetails" path parameters.
    # Api kullanicisi "api/holidayDetails" path parametrelerini olusturur
    * The api user prepares a GET request body to send to the api holidayDetails endpoint containing the information <id>.
    # Api kullanicisi api holidayDetails endpointine gondermek icin <id> bilgisini iceren bir get request body hazirlar
    * The api user sends a GET request body, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request body gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular


    Examples:
      | id |
      | 3  |

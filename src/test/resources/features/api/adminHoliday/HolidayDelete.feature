Feature: As an administrator, I want to be able to delete the holiday information with the specified id number via the API connection.

  Scenario: When a DELETE request with valid authorization and a holiday ID is sent to the /api/holidayDelete endpoint, it
  should be verified that the status code is 202, the response message is 'holiday deleted successfully', and the deleted_Id
  in the response body matches the ID in the request body.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/holidayDelete" path parameters.
    # Api kullanicisi "api/holidayDelete" path parametrelerini olusturur
    * The api user prepares a Delete request body to send to the api holidayDelete endpoint.
    # Api kullanicisi api holidayDelete endpointine gondermek icin bir Delete request body hazirlar
    * The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 202.
    # Api kullanicisi status codeun 202 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "holiday deleted successfully".
    # Api kullanicisi response bodydeki message bilgisinin "holiday deleted successfully" oldugunu dogrular
    * The api user verifies that the Deleted id information in the response body is the same as the id information in the request body.
    # Api kullanıcısı response body icindeki Deleted Id bilgisinin request body icindeki id bilgisi ile ayni oldugunu dogrular.


  Scenario: When a DELETE request is sent to the /api/holidayDelete endpoint with valid authorization information and no data
  (holiday id), it should be verified that the returned status code is 422 and the message information in the response body is
  "The id field is required."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/holidayDelete" path parameters.
    # Api kullanicisi "api/holidayDelete" path parametrelerini olusturur
    * The api user prepares a delete request that does not contain any data to the api holidayDelete endpoint.
    # Api kullanicisi api holidayDelete endpointine data icermeyen bir delete request hazirlar
    * The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 422.
    # Api kullanicisi status codeun 422 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "The id field is required.".
    # Api kullanicisi response bodydeki message bilgisinin "The id field is required." oldugunu dogrular

    #* The api user sends a DELETE request, saves the returned response, and verifies that the status code is '422' with the reason phrase Unprocessable Entity.
    # Api kullanicisi DELETE request gonderir, donen responsei kaydeder, status codeun '422' ve reason phrase bilgisinin Unprocessable Entity oldugunu dogrular


  Scenario: When a DELETE body containing valid authorization information and an incorrect (non-existent) holiday id is sent
  to the /api/holidayDelete endpoint, it should be verified that the returned status code is 404 and the message information
  in the response body is "holiday not found".

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/holidayDelete" path parameters.
    # Api kullanicisi "api/holidayDelete" path parametrelerini olusturur
    * The api user prepares a Delete request body to send to the api holidayDelete endpoint.
    # Api kullanicisi api holidayDelete endpointine gondermek icin bir Delete request body hazirlar
    * The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 404.
    # Api kullanicisi status codeun 404 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "holiday not found".
    # Api kullanicisi response bodydeki message bilgisinin "holiday not found" oldugunu dogrular

    #* The api user sends a DELETE request, saves the returned response, and verifies that the status code is '404' with the reason phrase Not Found.
    # Api kullanicisi DELETE request gonderir, donen responsei kaydeder, status codeun '404' ve reason phrase bilgisinin Not Found oldugunu dogrular


  Scenario: When a DELETE body containing invalid authorization information and the holiday id to be deleted is sent to the
  /api/holidayDelete endpoint, it should be verified that the returned status code is 401 and the message in the response
  body is "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/holidayDelete" path parameters.
    # Api kullanicisi "api/holidayDelete" path parametrelerini olusturur
    * The api user prepares a Delete request body to send to the api holidayDelete endpoint.
    # Api kullanicisi api holidayDelete endpointine gondermek icin bir Delete request body hazirlar
    * The api user sends a DELETE request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi DELETE request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular


  Scenario Outline: It should be verified via the API that the holiday record to be deleted has been successfully deleted.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/holidayDetails" path parameters.
    # Api kullanicisi "api/holidayDetails" path parametrelerini olusturur
    * The api user prepares a GET request body to send to the api holidayDetails endpoint containing the information <id>.
    # Api kullanicisi api holidayDetails endpointine gondermek icin <id> bilgisini iceren bir get request body hazirlar
    * The api user sends a GET request, saves the returned response, and verifies that the status code is '404' with the reason phrase Not Found.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '404' ve reason phrase bilgisinin Not Found oldugunu dogrular

    Examples:
      | id  |
      | 169 |

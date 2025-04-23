Feature: As an administrator, I want to be able to update the holiday information with the specified id number via the API connection.

  Scenario: When a PATCH request with valid authorization and updated holiday data (year, name, date) is sent to the
  /api/holidayUpdate/{id} endpoint, it should be verified that the status code is 202, the response message is
  'holiday updated successfully', and the updated_Id in the response body matches the ID in the path parameter.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/holidayUpdate/167" path parameters.
    # Api kullanicisi "api/holidayUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a patch request body to send to the api holidayUpdate endpoint.
    # Api kullanicisi api holidayUpdate endpointine gondermek icin bir patch request body hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 202.
    # Api kullanicisi status codeun 202 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "holiday updated successfully".
    # Api kullanicisi response bodydeki message bilgisinin "holiday updated successfully" oldugunu dogrular
    * The api user verifies that the updated id information in the response body is the same as the id path parameter written in the endpoint.
    # Api kullanıcısı response body icindeki updated Id bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular.


  Scenario: When a PATCH body containing the holiday id to be updated with valid authorization information and holiday data
  (year, name, date) matching previous records is sent to the /api/holidayUpdate/{id} endpoint, it should be verified that
  the returned status code is 400 and the message information in the response body is "duplicate holiday request".

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/holidayUpdate/168" path parameters.
    # Api kullanicisi "api/holidayUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a patch request body that matches previous records to send to the api holidayUpdate endpoint.
    # Api kullanicisi api holidayUpdate endpointine gondermek icin önceki kayıtlarla eslesen bir patch request body hazirlar
    * The api user sends a PATCH request, saves the returned response, and verifies that the status code is '400' with the reason phrase Bad Request.
    # Api kullanicisi PATCH request gonderir, donen responsei kaydeder, status codeun '400' ve reason phrase bilgisinin Bad Request oldugunu dogrular


  Scenario: When a PATCH body containing valid authorization information and an incorrect (not in the system) holiday id and
  current holiday data (year, name, date) is sent to the /api/holidayUpdate/{id} endpoint, it should be verified that the
  returned status code is 404 and the message information in the response body is "holiday not found".

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/holidayUpdate/5632" path parameters.
    # Api kullanicisi "api/holidayUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a patch request body to send to the api holidayUpdate endpoint.
    # Api kullanicisi api holidayUpdate endpointine gondermek icin bir patch request body hazirlar
    * The api user sends a PATCH request, saves the returned response, and verifies that the status code is '404' with the reason phrase Not Found.
    # Api kullanicisi PATCH request gonderir, donen responsei kaydeder, status codeun '404' ve reason phrase bilgisinin Not Found oldugunu dogrular


  Scenario: When a PATCH body containing invalid authorization information, the holiday id to be updated, and the updated
  holiday data (year, name, date) is sent to the /api/holidayUpdate/{id} endpoint, it should be verified that the returned
  status code is 401 and the message in the response body is "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/holidayUpdate/168" path parameters.
    # Api kullanicisi "api/holidayUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a patch request body to send to the api holidayUpdate endpoint.
    # Api kullanicisi api holidayUpdate endpointine gondermek icin bir patch request body hazirlar
    * The api user sends a PATCH request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi PATCH request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular


  Scenario Outline: It should be verified via the API that the holiday record to be updated has been successfully updated.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/holidayDetails" path parameters.
    # Api kullanicisi "api/holidayDetails" path parametrelerini olusturur
    * The api user prepares a GET request body to send to the api holidayDetails endpoint containing the information <id>.
    # Api kullanicisi api holidayDetails endpointine gondermek icin <id> bilgisini iceren bir get request body hazirlar
    * The api user sends a GET request body and saves the returned response.
    # Api kullanicisi GET request body gonderir ve donen responsei kaydeder
    * The api user name verifies that it is "Noel"
    # Api kullanıcısı name bilgisinin "Noel" olduğunu doğrular

    Examples:
      | id  |
      | 167 |
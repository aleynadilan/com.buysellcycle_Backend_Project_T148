Feature: As an administrator, I should be able to access holiday data via the API connection.

  Scenario Outline: When a GET request is sent to the /api/holidayList endpoint with valid authorization,
  it should be verified that the status code is 200, the message is 'success', and the year and name of id(x)
  in the response body are correct.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/holidayList" path parameters.
    # Api kullanicisi "api/holidayList" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "success".
    # Api kullanicisi response bodydeki message bilgisinin "success" oldugunu dogrular
    * The api user verifies the information in the response body for the entry with the specified <dataIndex> index, including "<year>" and "<name>".
    # Api kullanıcısı response body icindeki <dataIndex> indexe sahip olanin "<year>" ve "<name>" bilgilerini doğrular.

    Examples:
      | dataIndex | year | name   |
      | 0         | 2025 | Spring |


  Scenario: When a GET request with invalid authorization is sent to the /api/holidayList endpoint, it should be verified that
  the status code is 401 and the response message is 'Unauthenticated.'

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/holidayList" path parameters.
    # Api kullanicisi "api/holidayList" path parametrelerini olusturur
    * The api user sends a GET request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

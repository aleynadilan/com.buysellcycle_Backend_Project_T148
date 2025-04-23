package stepdefinitions;

import config_Requirements.ConfigLoader;
import hooks.HooksAPI;
import io.cucumber.java.en.Given;
import io.restassured.http.ContentType;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import org.hamcrest.Matchers;
import org.json.JSONObject;
import org.junit.Assert;
import pojos.HolidayUpdatePojo;
import utilities.API_Utilities.API_Methods;
import utilities.API_Utilities.TestData;

import java.util.HashMap;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static utilities.API_Utilities.API_Methods.*;

public class API_Stepdefinitions {

    Response response;
    JsonPath jsonPath;
    String exceptionMesaj;
    ConfigLoader configLoader = new ConfigLoader();
    JSONObject jsonObject;
    TestData testData = new TestData();
    HashMap<String, Object> requestBody;
    HolidayUpdatePojo holidayUpdatePojoRequest;

    @Given("The api user constructs the base url with the {string} token.")
    public void the_api_user_constructs_the_base_url_with_the_token(String userType) {
        HooksAPI.setUpApi(userType);
    }

    @Given("The api user sets {string} path parameters.")
    public void the_api_user_sets_path_parameters(String pathParam) {
        API_Methods.pathParam(pathParam);
    }

    @Given("The api user sends a GET request and saves the returned response.")
    public void the_api_user_sends_a_get_request_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .when()
                .get(fullPath);

        response.prettyPrint();
    }

    @Given("The api user verifies that the status code is {int}.")
    public void the_api_user_verifies_that_the_status_code_is(int code) {
        response.then()
                .assertThat()
                .statusCode(code);
    }

    @Given("The api user verifies that the {string} information in the response body is {string}.")
    public void the_api_user_verifies_that_the_information_in_the_response_body_is(String key, String value) {
        response.then()
                .assertThat()
                .body(key, Matchers.equalTo(value));
    }

    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int index, String year, String name) {
        jsonPath = response.jsonPath();
        Assert.assertEquals(year, jsonPath.getString("holiday[" + index + "].year"));
        Assert.assertEquals(name, jsonPath.getString("holiday[" + index + "].name"));
    }

    @Given("The api user sends a GET request, saves the returned response, and verifies that the status code is {string} with the reason phrase Unauthorized.")
    public void the_api_user_sends_a_get_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_unauthorized(String string) {
        try {
            response = given()
                    .spec(spec)
                    .when()
                    .get(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }

        System.out.println("exceptionMesaj : " + exceptionMesaj);
        Assert.assertEquals(configLoader.getApiConfig("unauthorizedExceptionMessage"), exceptionMesaj);
    }

    @Given("The api user prepares a GET request body to send to the api holidayDetails endpoint containing the information {int}.")
    public void the_api_user_prepares_a_get_request_body_to_send_to_the_api_holiday_details_endpoint_containing_the_information(int id) {
        jsonObject = new JSONObject();
        jsonObject.put("id", id);
        System.out.println("Get Body : " + jsonObject);
    }

    @Given("The api user sends a GET request body and saves the returned response.")
    public void the_api_user_sends_a_get_request_body_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(jsonObject.toString())
                .get(fullPath);

        response.prettyPrint();
    }

    @Given("The api user validates the contents of the holidayDetails data {int}, {string}, {string}, {int}, {string}, {string} and {string} in the response body.")
    public void the_api_user_validates_the_contents_of_the_holiday_details_data_and_in_the_response_body(int id, String year, String name, Integer int2, String string3, String string4, String string5) {
        response.then()
                .assertThat()
                .body("holidayDetails[0].id", Matchers.equalTo(id),
                        "holidayDetails[0].year", Matchers.equalTo(year));
    }

    @Given("The api user prepares a GET request that does not contain data to the api holidayDetails endpoint.")
    public void the_api_user_prepares_a_get_request_that_does_not_contain_data_to_the_api_holiday_details_endpoint() {
        jsonObject = new JSONObject();
    }

    @Given("The api user sends a GET request, saves the returned response, and verifies that the status code is {string} with the reason phrase Not Found.")
    public void the_api_user_sends_a_get_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_not_found(String string) {
        try {
            response = given()
                    .spec(spec)
                    .contentType(ContentType.JSON)
                    .when()
                    .body(jsonObject.toString())
                    .get(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }
        System.out.println("exceptionMesaj : " + exceptionMesaj);
        Assert.assertEquals(configLoader.getApiConfig("notFoundExceptionMessage"), exceptionMesaj);
    }

    @Given("The api user sends a GET request body, saves the returned response, and verifies that the status code is {string} with the reason phrase Unauthorized.")
    public void the_api_user_sends_a_get_request_body_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_unauthorized(String string) {
        try {
            response = given()
                    .spec(spec)
                    .contentType(ContentType.JSON)
                    .when()
                    .body(jsonObject.toString())
                    .get(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }
        System.out.println("exceptionMesaj : " + exceptionMesaj);
        Assert.assertEquals(configLoader.getApiConfig("unauthorizedExceptionMessage"), exceptionMesaj);
    }

    @Given("The api user prepares a post request body to send to the api holidayAdd endpoint.")
    public void the_api_user_prepares_a_post_request_body_to_send_to_the_api_holiday_add_endpoint() {
        requestBody = testData.holidayAdd();
        System.out.println("Post Body : " + requestBody);
    }

    @Given("The api user sends a POST request and saves the returned response.")
    public void the_api_user_sends_a_post_request_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(requestBody)
                .post(fullPath);

        response.prettyPrint();
    }

    @Given("The api user prepares a post request body containing the holiday data registered in the system to send to the api holidayAdd endpoint.")
    public void the_api_user_prepares_a_post_request_body_containing_the_holiday_data_registered_in_the_system_to_send_to_the_api_holiday_add_endpoint() {
        requestBody = testData.holidayAdd();
        System.out.println("Post Body : " + requestBody);
    }

    @Given("The api user prepares a patch request body to send to the api holidayUpdate endpoint.")
    public void the_api_user_prepares_a_patch_request_body_to_send_to_the_api_holiday_update_endpoint() {
        holidayUpdatePojoRequest = new HolidayUpdatePojo(generateRandomYear(), "Noell", "2024-01-01");
        System.out.println("Patch Body : " + holidayUpdatePojoRequest);
    }

    @Given("The api user sends a PATCH request and saves the returned response.")
    public void the_api_user_sends_a_patch_request_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(holidayUpdatePojoRequest)
                .patch(fullPath);

        response.prettyPrint();
    }

    @Given("The api user verifies that the updated id information in the response body is the same as the id path parameter written in the endpoint.")
    public void the_api_user_verifies_that_the_updated_id_information_in_the_response_body_is_the_same_as_the_id_path_parameter_written_in_the_endpoint() {
        jsonPath = response.jsonPath();
        int responseUpdatedId = jsonPath.getInt("updated_Id"); // 167
        Assert.assertEquals(responseUpdatedId, 167);
    }

    @Given("The api user prepares a patch request body that matches previous records to send to the api holidayUpdate endpoint.")
    public void the_api_user_prepares_a_patch_request_body_that_matches_previous_records_to_send_to_the_api_holiday_update_endpoint() {
        holidayUpdatePojoRequest = new HolidayUpdatePojo("2022", "Noel", "2022-01-01");
        System.out.println("Patch Body : " + holidayUpdatePojoRequest);
    }

    @Given("The api user sends a PATCH request, saves the returned response, and verifies that the status code is {string} with the reason phrase Bad Request.")
    public void the_api_user_sends_a_patch_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_bad_request(String string) {
        try {
            response = given()
                    .spec(spec)
                    .contentType(ContentType.JSON)
                    .when()
                    .body(holidayUpdatePojoRequest)
                    .patch(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }
        System.out.println("exceptionMesaj : " + exceptionMesaj);
        Assert.assertEquals(configLoader.getApiConfig("badRequestExceptionMessage"), exceptionMesaj);
    }

    @Given("The api user sends a PATCH request, saves the returned response, and verifies that the status code is {string} with the reason phrase Not Found.")
    public void the_api_user_sends_a_patch_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_not_found(String string) {
        try {
            response = given()
                    .spec(spec)
                    .contentType(ContentType.JSON)
                    .when()
                    .body(holidayUpdatePojoRequest)
                    .patch(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }
        System.out.println("exceptionMesaj : " + exceptionMesaj);
        Assert.assertEquals(configLoader.getApiConfig("notFoundExceptionMessage"), exceptionMesaj);
    }

    @Given("The api user sends a PATCH request, saves the returned response, and verifies that the status code is {string} with the reason phrase Unauthorized.")
    public void the_api_user_sends_a_patch_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_unauthorized(String string) {
        try {
            response = given()
                    .spec(spec)
                    .contentType(ContentType.JSON)
                    .when()
                    .body(holidayUpdatePojoRequest)
                    .patch(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }
        System.out.println("exceptionMesaj : " + exceptionMesaj);
        Assert.assertEquals(configLoader.getApiConfig("unauthorizedExceptionMessage"), exceptionMesaj);
    }


    @Given("The api user name verifies that it is {string}")
    public void the_api_user_name_verifies_that_it_is(String name) {
        response.then()
                .assertThat()
                .body("holidayDetails[0].name", Matchers.equalTo(name));
    }

    @Given("The api user prepares a Delete request body to send to the api holidayDelete endpoint.")
    public void the_api_user_prepares_a_delete_request_body_to_send_to_the_api_holiday_delete_endpoint() {
        requestBody = new HashMap<>();
        requestBody.put("id", 169);
        System.out.println("Delete Body : " + requestBody);
    }

    @Given("The api user sends a DELETE request and saves the returned response.")
    public void the_api_user_sends_a_delete_request_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(requestBody)
                .delete(fullPath);

        response.prettyPrint();
    }

    @Given("The api user verifies that the Deleted id information in the response body is the same as the id information in the request body.")
    public void the_api_user_verifies_that_the_deleted_id_information_in_the_response_body_is_the_same_as_the_id_information_in_the_request_body() {
        jsonPath = response.jsonPath();
        int responseDeletedId = jsonPath.getInt("Deleted_Id");
        Assert.assertEquals(responseDeletedId, requestBody.get("id"));
    }

    @Given("The api user sends a DELETE request, saves the returned response, and verifies that the status code is {string} with the reason phrase Unauthorized.")
    public void the_api_user_sends_a_delete_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_unauthorized(String string) {
        try {
            response = given()
                    .spec(spec)
                    .contentType(ContentType.JSON)
                    .when()
                    .body(requestBody)
                    .delete(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }
        System.out.println("exceptionMesaj : " + exceptionMesaj);
        Assert.assertEquals(configLoader.getApiConfig("unauthorizedExceptionMessage"), exceptionMesaj);
    }

}
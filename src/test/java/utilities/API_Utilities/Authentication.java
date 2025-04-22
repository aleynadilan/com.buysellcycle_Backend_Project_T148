package utilities.API_Utilities;

import config_Requirements.ConfigLoader;
import io.restassured.builder.RequestSpecBuilder;
import io.restassured.http.ContentType;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import org.json.JSONObject;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;

public class Authentication{

    static ConfigLoader configLoader = new ConfigLoader();
    public static String generateToken(String user) {

        JSONObject reqBody = null;

        spec = new RequestSpecBuilder().setBaseUri(configLoader.getApiConfig("base_url")).build();
        spec.pathParams("pp1", "api", "pp2", "login");

        switch (user) {
            case "customer":
                reqBody = new JSONObject();
                reqBody.put("email", configLoader.getApiConfig("customerEmail"));
                reqBody.put("password", configLoader.getApiConfig("customerPassword"));
                break;
            case "admin":
                reqBody = new JSONObject();
                reqBody.put("email", configLoader.getApiConfig("adminEmail"));
                reqBody.put("password", configLoader.getApiConfig("adminPassword"));
                break;
        }

        Response response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .header("Accept", "application/json")
                .when()
                .body(reqBody.toString())
                .post("/{pp1}/{pp2}");


        JsonPath repJP = response.jsonPath();

        String token = repJP.getString("token");
        System.out.println("Token : " +  token);
        return token;
    }
}

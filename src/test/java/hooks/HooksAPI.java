package hooks;

import config_Requirements.ConfigLoader;
import io.restassured.builder.RequestSpecBuilder;
import io.restassured.specification.RequestSpecification;
import utilities.API_Utilities.Authentication;

public class HooksAPI {
    public static RequestSpecification spec;
    static ConfigLoader configLoader = new ConfigLoader();

    public static void setUpApi(String userType) {
        String token;
        if (userType.equals("admin") || userType.equals("customer")) {
            token = Authentication.generateToken(userType);
        } else {
            token = configLoader.getApiConfig("invalidToken");
        }

        spec = new RequestSpecBuilder()
                .setBaseUri(configLoader.getApiConfig("base_url"))
                .addHeader("Accept", "application/json")
                .addHeader("Authorization", "Bearer " + token)
                .build();
    }
}


package utilities.API_Utilities;

import java.util.HashMap;

public class TestData{
    HashMap<String, Object> requestBody;

    public HashMap holidayAdd() {

        requestBody = new HashMap<>();

        requestBody.put("year", "2024");
        requestBody.put("name", "Ulusal Egemenlik ve Çocuk Bayram");
        requestBody.put("date", "2024-04-23");

        return requestBody;
    }


}

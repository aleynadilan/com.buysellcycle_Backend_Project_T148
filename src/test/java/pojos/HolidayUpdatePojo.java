package pojos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HolidayUpdatePojo {

    /*         {
                 "year": "2024",
                 "name": "Noel",
                 "date": "2024-01-01"
                 }
     */

    private String year;
    private String name;
    private String date;

}

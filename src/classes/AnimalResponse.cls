/**
 * Created by ChrisMatos on 11/22/2017.
 */

public class AnimalResponse {

    public Animal animal;
    
    public class Animal {
        public Integer id;
        public String name;
        public String eats;
        public String says;
    }


    public static AnimalResponse parse(String json) {
        return (AnimalResponse) System.JSON.deserialize(json, AnimalResponse.class);
    }
}
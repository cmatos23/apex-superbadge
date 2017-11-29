/**
 * Created by ChrisMatos on 11/27/2017.
 */

global class ParkServiceMock implements WebServiceMock {
    global void doInvoke(   Object stub,
            Object request,
            Map<String, Object> response,
            String endpoint,
            String soapAction,
            String requestName,
            String responseNS,
            String responseName,
            String responseType) {
        // start - specify the response you want to send
        ParkService.byCountryResponse response_x = new ParkService.byCountryResponse();
        // end
        response.put('response_x', response_x);
    }

}
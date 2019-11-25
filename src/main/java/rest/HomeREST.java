package rest;

import com.google.gson.Gson;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/home")
public class HomeREST {
    private final Gson gson = new Gson();

    @GET
    @Path("/")
    @Produces(MediaType.APPLICATION_JSON)
    public String getData(){
        return "String";
    }
}

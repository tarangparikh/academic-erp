package rest;

import com.google.gson.Gson;
import dao.SpecialisationDAO;
import vo.SpecialisationVO;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;

@Path("/specialisation")
public class SpecialisationREST {
    private final SpecialisationDAO specialisationDAO = new SpecialisationDAO();
    private final Gson gson = new Gson();
    private static class Status<T>{
        T result;
        Status(T result){this.result = result;}
    }
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/list")
    public Response getList(){
        List<SpecialisationVO> list  = specialisationDAO.getList();
        return Response.ok(gson.toJson(list),MediaType.APPLICATION_JSON).build();
    }
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path(("/tag/{param}"))
    public Response getSpecialisationVO(@PathParam("param") String tag){
        SpecialisationVO specialisationVO = specialisationDAO.getSpecialisationVO(tag);
        return Response.ok(gson.toJson(specialisationVO),MediaType.APPLICATION_JSON).build();
    }
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/id/{param}")
    public Response getSpecialisationVOById(@PathParam("param") String id){
        SpecialisationVO specialisationVO = specialisationDAO.getSpecialisationVO(Integer.parseInt(id));
        return Response.ok(gson.toJson(specialisationVO),MediaType.APPLICATION_JSON).build();
    }
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Path("/post")
    public Response insertSpecialisation(String jsonData){
        SpecialisationVO specialisationVO = gson.fromJson(jsonData,SpecialisationVO.class);
        specialisationDAO.insert(specialisationVO);
        return Response.ok().build();
    }
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/tag/contains/{param}")
    public Response containsSpecialisation(@PathParam("param") String tag){
        if(specialisationDAO.containsTag(tag)){
            return Response.ok(gson.toJson(new Status<>(true)),MediaType.APPLICATION_JSON).build();
        }else{
            return Response.ok(gson.toJson(new Status<>(false)),MediaType.APPLICATION_JSON).build();
        }
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/count")
    public Response getCount(){
        return Response.ok(gson.toJson(new Status<>(specialisationDAO.getCount()))).build();
    }

}

package rest;

import com.google.gson.Gson;
import dao.UserDAO;
import vo.UserVO;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.*;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("/home")
public class HomeREST {
    private final Gson gson = new Gson();
    private final UserDAO userDAO = new UserDAO();
    private static class Status<T>{
        T result;
        Status(T val){result = val;}
    }
    @POST
    @Path("/login")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response getData(@Context HttpServletRequest request,String jsonData){
        UserVO userVO = gson.fromJson(jsonData,UserVO.class);
        if(userDAO.login(userVO)){
            HttpSession session = request.getSession(false);
            if(session!=null){
                session.setAttribute("token",userVO.getEmail());
                return Response.ok(gson.toJson(new Status<>(true)),MediaType.APPLICATION_JSON).build();
            }else{
                HttpSession sessionNew = request.getSession();
                sessionNew.setAttribute("token",userVO.getEmail());
                return Response.ok(gson.toJson(new Status<>(true)),MediaType.APPLICATION_JSON).build();
            }
        }else{
            return Response.ok(gson.toJson(new Status<>(false)),MediaType.APPLICATION_JSON).build();
        }

    }
    @GET
    @Path("/list")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getList(){
        return Response.ok(gson.toJson(userDAO.getList()),MediaType.APPLICATION_JSON).build();
    }


    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Response post(String jsonData){
        UserVO userVO = gson.fromJson(jsonData,UserVO.class);
        Integer id = userDAO.insert(userVO);
        return Response.ok(gson.toJson(new Status<>(id)),MediaType.APPLICATION_JSON).build();
    }
}

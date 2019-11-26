package rest;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import dao.CourseDAO;
import vo.CourseVO;

import javax.annotation.PostConstruct;
import javax.print.attribute.standard.Media;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;


@Path("/course")
public class CourseREST {
    private final Gson gson = new Gson();
    private final CourseDAO courseDAO = new CourseDAO();
    private static class Status<T>{
        T result;
        Status(T result){this.result = result;}
    }
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/list")
    public Response getList(){
        return Response.ok(gson.toJson(courseDAO.getList()),MediaType.APPLICATION_JSON).build();
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/tag/{param}")
    public Response getCourseVO(@PathParam("param") String tag){
        return Response.ok(gson.toJson(courseDAO.getCourseVO(tag)),MediaType.APPLICATION_JSON).build();
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/id/{param}")
    public Response getCourseVOById(@PathParam("param") String id){
        return Response.ok(gson.toJson(courseDAO.getCourseVO(Integer.parseInt(id))),MediaType.APPLICATION_JSON).build();
    }
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/post")
    public Response insertCourseVO(String jsonData){
        Integer courseVO = courseDAO.insert(gson.fromJson(jsonData, CourseVO.class));
        return Response.ok(gson.toJson(new Status<>(courseVO)),MediaType.APPLICATION_JSON).build();
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Path("/post/list")
    public Response insertCourseVOList(String jsonData){
        Type listType = new TypeToken<ArrayList<CourseVO>>(){}.getType();
        List<CourseVO>  list = gson.fromJson(jsonData,listType);
        List<Integer> ids = courseDAO.insertCourseVOList(list);
        return Response.ok(gson.toJson(new Status<>(ids))).build();
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/tag/contains/{param}")
    public Response containsCourse(@PathParam("param") String tag){
        if(courseDAO.containsTag(tag)){
            return Response.ok(gson.toJson(new Status<>(true)),MediaType.APPLICATION_JSON).build();
        }else{
            return Response.ok(gson.toJson(new Status<>(false)),MediaType.APPLICATION_JSON).build();
        }
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/tag/containsid/{param}")
    public Response containsCourseID(@PathParam("param") String tag){
        Integer id = courseDAO.containsTagId(tag);
        return Response.ok(gson.toJson(new Status<>(id)),MediaType.APPLICATION_JSON).build();
    }


    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/count")
    public Response getCount(){
        return Response.ok(gson.toJson(new Status<>(courseDAO.getCount()))).build();
    }

    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    @Path("/update")
    public Response updateCourse(String jsonData){
        CourseVO courseVO = gson.fromJson(jsonData,CourseVO.class);
        courseDAO.update(courseVO,courseVO.getId());
        return Response.ok(gson.toJson(new Status<>("success"))).build();
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/valid/from/{param1}/to/{param2}")
    public Response checkValidity(@PathParam("param1") String from,@PathParam("param2") String to){
        CourseVO f = courseDAO.getCourseVO(Integer.parseInt(from));
        CourseVO t = courseDAO.getCourseVO(Integer.parseInt(to));
        boolean result = courseDAO.isValid(f,t);
        return Response.ok(gson.toJson(new Status<>(result)),MediaType.APPLICATION_JSON).build();
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/delete/{param}")
    public Response deleteCourse(@PathParam("param") String id){
        courseDAO.deleteById(Integer.parseInt(id));
        return Response.ok(gson.toJson(new Status<>("success")),MediaType.APPLICATION_JSON).build();
    }

}

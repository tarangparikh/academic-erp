import dao.*;
import org.hibernate.collection.internal.PersistentSet;
import org.omg.CORBA.INTERNAL;
import vo.CourseVO;
import vo.PrerequisiteVO;
import vo.SpecialisationVO;
import vo.UserVO;

import java.util.*;

public class App {
    public static void main(String...args){
        UserVO userVO = new UserVO();
        userVO.setEmail("tushar.masane@iiitb.org");
        userVO.setPassword("hellobaby");
        System.out.println( new UserDAO().login(userVO));

    }
}

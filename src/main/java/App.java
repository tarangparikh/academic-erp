import dao.*;
import org.hibernate.collection.internal.PersistentSet;
import vo.CourseVO;
import vo.PrerequisiteVO;
import vo.SpecialisationVO;

import java.util.*;

public class App {
    public static void main(String...args){
        String[] courseName = new String[]{"Algorithms","Advanced Algorithms","Approximation Algorithms"};
        int[] courseCredits = new int[]{5,4,6};
        String[] courseTags = new String[]{"CS101","CS102","CS103"};
        int[] capacity = new int[]{200,100,5};

        PersistenceDAO.getSessionFactory();
    }
}

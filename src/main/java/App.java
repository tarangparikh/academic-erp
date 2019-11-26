import dao.*;
import org.hibernate.collection.internal.PersistentSet;
import org.omg.CORBA.INTERNAL;
import vo.CourseVO;
import vo.PrerequisiteVO;
import vo.SpecialisationVO;

import java.util.*;

public class App {
    public static void main(String...args){
        SpecialisationVO specialisationVO = new SpecialisationVO();
        specialisationVO.setSpecialisationTag("DS");
        specialisationVO.setSpecialisationName("Data Science");
        specialisationVO.setCredits(50);

        new SpecialisationDAO().insert(specialisationVO);
    }
}

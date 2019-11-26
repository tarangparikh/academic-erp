package dao;

import org.hibernate.query.Query;
import vo.CourseVO;
import java.util.ArrayList;
import java.util.List;

public class CourseDAO {
    private final DBOperationDAO dbOperationDAO = new DBOperationDAO();
    public Integer insert(CourseVO courseVO){
        dbOperationDAO.openCurrentSessionWithTransaction();;
        Integer id = (Integer)dbOperationDAO.insert(courseVO);
        dbOperationDAO.closeCurrentSessionWithTransaction();
        return id;
    }
    public List<CourseVO> getList(){
        dbOperationDAO.openCurrentSessionWithTransaction();
        List<CourseVO> send = dbOperationDAO.getList(CourseVO.class,"from vo.CourseVO");
        dbOperationDAO.closeCurrentSessionWithTransaction();
        return send;
    }
    public boolean containsTag(String tag){
        return getCourseVO(tag)!=null;
    }
    public int containsTagId(String tag){
        CourseVO courseVO = getCourseVO(tag);
        return courseVO!=null?courseVO.getId():-1;
    }
    public CourseVO getCourseVO(String tag){
        dbOperationDAO.openCurrentSessionWithTransaction();
        Query<CourseVO> query = dbOperationDAO.getCurrentSession().createQuery("from vo.CourseVO as S where S.courseTag = :tag");
        query.setParameter("tag",tag);
        List<CourseVO> courseVOS = query.getResultList();
        dbOperationDAO.closeCurrentSessionWithTransaction();
        return courseVOS.isEmpty() ? null : courseVOS.get(0);
    }
    public CourseVO getCourseVO(int id){
        dbOperationDAO.openCurrentSessionWithTransaction();
        Query<CourseVO> query = dbOperationDAO.getCurrentSession().createQuery("from vo.CourseVO as S where S.id = :tag");
        query.setParameter("tag",id);
        List<CourseVO> courseVOS = query.getResultList();
        dbOperationDAO.closeCurrentSessionWithTransaction();
        return courseVOS.isEmpty() ? null : courseVOS.get(0);
    }
    public List<Integer> insertCourseVOList(List<CourseVO> list){
        dbOperationDAO.openCurrentSessionWithTransaction();
        List<Integer> ids = new ArrayList<>();
        for(CourseVO courseVO : list){
            ids.add(dbOperationDAO.insert(courseVO));
        }
        dbOperationDAO.closeCurrentSessionWithTransaction();
        return ids;
    }
    public Long getCount(){
        dbOperationDAO.openCurrentSessionWithTransaction();
        String query = "select count(*) from CourseVO";
        Query query1 = dbOperationDAO.getCurrentSession().createQuery(query);
        Long count =  (Long)query1.uniqueResult();
        dbOperationDAO.closeCurrentSessionWithTransaction();
        return count;
    }
    public void update(CourseVO courseVO,int course_id) {
        dbOperationDAO.openCurrentSessionWithTransaction();
        courseVO.setId(course_id);
        dbOperationDAO.update(courseVO);
        dbOperationDAO.closeCurrentSessionWithTransaction();
    }
    public void deleteById(int _course_id){
        dbOperationDAO.openCurrentSessionWithTransaction();
        dbOperationDAO.deleteById(CourseVO.class,_course_id);
        dbOperationDAO.closeCurrentSessionWithTransaction();
    }
    public boolean isValid(CourseVO a,CourseVO b){
        if(a.getCourseTag().compareTo(b.getCourseTag())==0) return false;
        boolean send = true;
        for(CourseVO courseVO : a.getPrerequisiteVOS()){
            send &= isValid(courseVO,b);
            if(!send) return send;
        }
        return send;
    }

}

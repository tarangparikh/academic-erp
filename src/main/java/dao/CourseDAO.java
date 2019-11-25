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


}

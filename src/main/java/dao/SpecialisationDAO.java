package dao;

import org.hibernate.query.Query;
import vo.CourseVO;
import vo.SpecialisationVO;

import java.util.ArrayList;
import java.util.List;

public class SpecialisationDAO {
    private final DBOperationDAO dbOperationDAO = new DBOperationDAO();
    public Integer insert(SpecialisationVO specialisationVO){
        dbOperationDAO.openCurrentSessionWithTransaction();
        Integer id = (Integer)dbOperationDAO.insert(specialisationVO);
        dbOperationDAO.closeCurrentSessionWithTransaction();
        return id;
    }
    public List<SpecialisationVO> getList(){
        dbOperationDAO.openCurrentSessionWithTransaction();
        List<SpecialisationVO> send = dbOperationDAO.getList(SpecialisationVO.class,"from vo.SpecialisationVO");
        dbOperationDAO.closeCurrentSessionWithTransaction();
        return send;
    }
    public boolean containsTag(String tag){
        return getSpecialisationVO(tag)!=null;
    }
    public SpecialisationVO getSpecialisationVO(String tag){
        dbOperationDAO.openCurrentSessionWithTransaction();
        Query<SpecialisationVO> query = dbOperationDAO.getCurrentSession().createQuery("from vo.SpecialisationVO as S where S.specialisationTag = :tag ");
        query.setParameter("tag",tag);
        List<SpecialisationVO> specialisationVOS = query.getResultList();
        dbOperationDAO.closeCurrentSessionWithTransaction();
        return specialisationVOS.isEmpty() ? null : specialisationVOS.get(0);
    }
    public SpecialisationVO getSpecialisationVO(int id){
        dbOperationDAO.openCurrentSessionWithTransaction();
        Query<SpecialisationVO> query = dbOperationDAO.getCurrentSession().createQuery("from vo.SpecialisationVO as S where S.id = :tag ");
        query.setParameter("tag",id);
        List<SpecialisationVO> specialisationVOS = query.getResultList();
        dbOperationDAO.closeCurrentSessionWithTransaction();
        return specialisationVOS.isEmpty() ? null : specialisationVOS.get(0);
    }
    public List<Integer> insertSpecialisationVOList(List<SpecialisationVO> list){
        dbOperationDAO.openCurrentSessionWithTransaction();
        List<Integer> ids = new ArrayList<>();
        for(SpecialisationVO specialisationVO : list){
            ids.add(dbOperationDAO.insert(specialisationVO));
        }
        dbOperationDAO.closeCurrentSessionWithTransaction();
        return ids;
    }

    public Long getCount(){
        dbOperationDAO.openCurrentSessionWithTransaction();
        String query = "select count(*) from SpecialisationVO ";
        Query query1 = dbOperationDAO.getCurrentSession().createQuery(query);
        Long count =  (Long)query1.uniqueResult();
        dbOperationDAO.closeCurrentSessionWithTransaction();
        return count;
    }
}

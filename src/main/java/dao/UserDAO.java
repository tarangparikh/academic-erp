package dao;

import org.hibernate.query.Query;
import vo.UserVO;

import java.util.List;

public class UserDAO {
    DBOperationDAO dbOperationDAO = new DBOperationDAO();
    public Integer insert(UserVO userVO){
        dbOperationDAO.openCurrentSessionWithTransaction();
        Integer id = dbOperationDAO.insert(userVO);
        dbOperationDAO.closeCurrentSessionWithTransaction();
        return id;
    }
    public List<UserVO> getList(){
        dbOperationDAO.openCurrentSessionWithTransaction();
        List<UserVO> userVOS = dbOperationDAO.getList(UserVO.class,"from vo.UserVO");
        dbOperationDAO.closeCurrentSessionWithTransaction();
        return userVOS;
    }
    public boolean login(UserVO userVO){
        dbOperationDAO.openCurrentSessionWithTransaction();
        Query<UserVO> userVOQuery = dbOperationDAO.getCurrentSession().createQuery("from vo.UserVO as U where U.email = :em and U.password = :ps",UserVO.class);
        userVOQuery.setParameter("em",userVO.getEmail());
        userVOQuery.setParameter("ps",userVO.getPassword());
        List<UserVO> resultList = userVOQuery.getResultList();
        dbOperationDAO.closeCurrentSessionWithTransaction();
        return resultList.size()>0;
    }

}

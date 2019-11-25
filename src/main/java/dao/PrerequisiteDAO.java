package dao;

import vo.PrerequisiteVO;

public class PrerequisiteDAO {
    private final DBOperationDAO dbOperationDAO = new DBOperationDAO();
    public Integer insert(PrerequisiteVO prerequisiteVO){
        dbOperationDAO.openCurrentSessionWithTransaction();
        Integer id = dbOperationDAO.insert(prerequisiteVO);
        dbOperationDAO.closeCurrentSessionWithTransaction();
        return id;
    }
}

package vo;

import javax.persistence.*;

@Entity
@Table
public class PrerequisiteVO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    CourseVO prequisiteCourseVO;

    public PrerequisiteVO() {
    }

    @Override
    public String toString() {
        return "PrerequisiteVO{" +
                "id=" + id +
                ", prequisiteCourseVO=" + prequisiteCourseVO +
                '}';
    }

    public PrerequisiteVO(CourseVO prequisiteCourseVO) {
        this.prequisiteCourseVO = prequisiteCourseVO;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public CourseVO getPrequisiteCourseVO() {
        return prequisiteCourseVO;
    }

    public void setPrequisiteCourseVO(CourseVO prequisiteCourseVO) {
        this.prequisiteCourseVO = prequisiteCourseVO;
    }
}

package vo;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table
public class SpecialisationVO {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "specialisation_id")
    int id;

    @Column(unique = true)
    String specialisationTag;

    @Column
    String specialisationName;

    @ManyToMany(mappedBy="specialisations",fetch = FetchType.EAGER)
    private transient Set<CourseVO> courseVOS;
    @Column
    int credits;

    public SpecialisationVO() {
    }

    public SpecialisationVO(String specialisationTag, String specialisationName, Set<CourseVO> courseVOS, int credits) {
        this.specialisationTag = specialisationTag;
        this.specialisationName = specialisationName;
        this.courseVOS = courseVOS;
        this.credits = credits;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSpecialisationTag() {
        return specialisationTag;
    }

    public void setSpecialisationTag(String specialisationTag) {
        this.specialisationTag = specialisationTag;
    }

    public String getSpecialisationName() {
        return specialisationName;
    }

    public void setSpecialisationName(String specialisationName) {
        this.specialisationName = specialisationName;
    }

    public Set<CourseVO> getCourseVOS() {
        return courseVOS;
    }

    public void setCourseVOS(Set<CourseVO> courseVOS) {
        this.courseVOS = courseVOS;
    }

    public int getCredits() {
        return credits;
    }

    public void setCredits(int credits) {
        this.credits = credits;
    }

    @Override
    public String toString() {
        return "SpecialisationVO{" +
                "id=" + id +
                ", specialisationTag='" + specialisationTag + '\'' +
                ", specialisationName='" + specialisationName + '\'' +
                ", courseVOS=" + courseVOS +
                ", credits=" + credits +
                '}';
    }
}

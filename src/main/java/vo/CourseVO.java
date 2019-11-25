package vo;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Entity
@Table
public class CourseVO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Column(unique = true)
    private String courseTag;

    @Column
    private String courseName;

    @Column
    private
    int capacity;

    @Column
    private
    int credits;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "Course_Course",joinColumns = {@JoinColumn(name = "id")})
    private Set<CourseVO> prerequisiteVOS;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "Course_Specialisation", joinColumns = { @JoinColumn(name = "id") } , inverseJoinColumns = { @JoinColumn(name = "specialisation_id") })
    private List<SpecialisationVO> specialisations;

    public CourseVO() {
    }

    public CourseVO(String courseTag, String courseName, int capacity, int credits, Set<CourseVO> prerequisiteVOS, List<SpecialisationVO> specialisations) {
        this.courseTag = courseTag;
        this.courseName = courseName;
        this.capacity = capacity;
        this.credits = credits;
        this.prerequisiteVOS = prerequisiteVOS;
        this.specialisations = specialisations;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCourseTag() {
        return courseTag;
    }

    public void setCourseTag(String courseTag) {
        this.courseTag = courseTag;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public int getCredits() {
        return credits;
    }

    public void setCredits(int credits) {
        this.credits = credits;
    }

    public Set<CourseVO> getPrerequisiteVOS() {
        return prerequisiteVOS;
    }

    public void setPrerequisiteVOS(Set<CourseVO> prerequisiteVOS) {
        this.prerequisiteVOS = prerequisiteVOS;
    }

    public List<SpecialisationVO> getSpecialisations() {
        return specialisations;
    }

    public void setSpecialisations(List<SpecialisationVO> specialisations) {
        this.specialisations = specialisations;
    }

    @Override
    public String toString() {
        return "CourseVO{" +
                "id=" + id +
                ", courseTag='" + courseTag + '\'' +
                ", courseName='" + courseName + '\'' +
                ", capacity=" + capacity +
                ", credits=" + credits +
                ", prerequisiteVOS=" + prerequisiteVOS +
                ", specialisations=" + specialisations +
                '}';
    }
}

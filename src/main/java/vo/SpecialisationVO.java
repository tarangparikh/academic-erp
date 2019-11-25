package vo;

import javax.persistence.*;

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

    @Column
    int credits;

    public SpecialisationVO() {
    }

    public SpecialisationVO(String specialisationTag, String specialisatoinName, int credits) {
        this.specialisationTag = specialisationTag;
        this.specialisationName = specialisatoinName;
        this.credits = credits;
    }

    public String getSpecialisationName() {
        return specialisationName;
    }

    public void setSpecialisationName(String specialisationName) {
        this.specialisationName = specialisationName;
    }

    @Override
    public String toString() {
        return "SpecialisationVO{" +
                "id=" + id +
                ", specialisationTag='" + specialisationTag + '\'' +
                ", specialisatoinName='" + specialisationName
                + '\'' +
                ", credits=" + credits +
                '}';
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

    public int getCredits() {
        return credits;
    }

    public void setCredits(int credits) {
        this.credits = credits;
    }


}

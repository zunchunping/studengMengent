package entity;

import java.util.Date;

public class Department {
    private Integer depar_id;

    private String depar_Name;

    private String depar_president;

    private Integer depar_count;

    private Date depar_time;

    private Integer depar_stu_awardedMarks;

    private String depar_type;

    public Integer getDepar_id() {
        return depar_id;
    }

    public void setDepar_id(Integer depar_id) {
        this.depar_id = depar_id;
    }

    public String getDepar_Name() {
        return depar_Name;
    }

    public void setDepar_Name(String depar_Name) {
        this.depar_Name = depar_Name;
    }

    public String getDepar_president() {
        return depar_president;
    }

    public void setDepar_president(String depar_president) {
        this.depar_president = depar_president;
    }

    public Integer getDepar_count() {
        return depar_count;
    }

    public void setDepar_count(Integer depar_count) {
        this.depar_count = depar_count;
    }

    public Date getDepar_time() {
        return depar_time;
    }

    public void setDepar_time(Date depar_time) {
        this.depar_time = depar_time;
    }

    public Integer getDepar_stu_awardedMarks() {
        return depar_stu_awardedMarks;
    }

    public void setDepar_stu_awardedMarks(Integer depar_stu_awardedMarks) {
        this.depar_stu_awardedMarks = depar_stu_awardedMarks;
    }

    public String getDepar_type() {
        return depar_type;
    }

    public void setDepar_type(String depar_type) {
        this.depar_type = depar_type;
    }
}
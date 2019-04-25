package entity;

import java.util.Date;

public class Supplementary_Examination {
    private Integer supp_id;

    private Integer exam_id;

    private Date supp_date;

    private String supp_pass;

    private String supp_type;

    private Integer supp_number;

    public Integer getSupp_id() {
        return supp_id;
    }

    public void setSupp_id(Integer supp_id) {
        this.supp_id = supp_id;
    }

    public Integer getExam_id() {
        return exam_id;
    }

    public void setExam_id(Integer exam_id) {
        this.exam_id = exam_id;
    }

    public Date getSupp_date() {
        return supp_date;
    }

    public void setSupp_date(Date supp_date) {
        this.supp_date = supp_date;
    }

    public String getSupp_pass() {
        return supp_pass;
    }

    public void setSupp_pass(String supp_pass) {
        this.supp_pass = supp_pass;
    }

    public String getSupp_type() {
        return supp_type;
    }

    public void setSupp_type(String supp_type) {
        this.supp_type = supp_type;
    }

    public Integer getSupp_number() {
        return supp_number;
    }

    public void setSupp_number(Integer supp_number) {
        this.supp_number = supp_number;
    }
}
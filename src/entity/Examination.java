package entity;

import java.util.Date;

public class Examination {
    private Integer examination_id;

    private Integer stu_gard_class;

    private Integer stu_xuehao;

    private String exam_pass;

    private String exam_subject;

    private Date exam_date;

    private Integer exam_number;

    private Integer supp_exa_reason;

    public Integer getExamination_id() {
        return examination_id;
    }

    public void setExamination_id(Integer examination_id) {
        this.examination_id = examination_id;
    }

    public Integer getStu_gard_class() {
        return stu_gard_class;
    }

    public void setStu_gard_class(Integer stu_gard_class) {
        this.stu_gard_class = stu_gard_class;
    }

    public Integer getStu_xuehao() {
        return stu_xuehao;
    }

    public void setStu_xuehao(Integer stu_xuehao) {
        this.stu_xuehao = stu_xuehao;
    }

    public String getExam_pass() {
        return exam_pass;
    }

    public void setExam_pass(String exam_pass) {
        this.exam_pass = exam_pass;
    }

    public String getExam_subject() {
        return exam_subject;
    }

    public void setExam_subject(String exam_subject) {
        this.exam_subject = exam_subject;
    }

    public Date getExam_date() {
        return exam_date;
    }

    public void setExam_date(Date exam_date) {
        this.exam_date = exam_date;
    }

    public Integer getExam_number() {
        return exam_number;
    }

    public void setExam_number(Integer exam_number) {
        this.exam_number = exam_number;
    }

    public Integer getSupp_exa_reason() {
        return supp_exa_reason;
    }

    public void setSupp_exa_reason(Integer supp_exa_reason) {
        this.supp_exa_reason = supp_exa_reason;
    }
}
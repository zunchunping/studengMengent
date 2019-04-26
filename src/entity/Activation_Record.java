package entity;

import java.util.Date;

//记录表
public class Activation_Record {
    private Integer ac_re_id;

    private Integer depar_mass_d;

    private Integer ac_re_user_id;

    private Date ac_re_time;

    private String ac_re_purpose;

    private String ac_re_EnableModeration;

    private Integer ac_re_jiafen;

    private Integer ac_re_approve;

    private String ac_re_content;

    public Integer getAc_re_id() {
        return ac_re_id;
    }

    public void setAc_re_id(Integer ac_re_id) {
        this.ac_re_id = ac_re_id;
    }

    public Integer getDepar_mass_d() {
        return depar_mass_d;
    }

    public void setDepar_mass_d(Integer depar_mass_d) {
        this.depar_mass_d = depar_mass_d;
    }

    public Integer getAc_re_user_id() {
        return ac_re_user_id;
    }

    public void setAc_re_user_id(Integer ac_re_user_id) {
        this.ac_re_user_id = ac_re_user_id;
    }

    public Date getAc_re_time() {
        return ac_re_time;
    }

    public void setAc_re_time(Date ac_re_time) {
        this.ac_re_time = ac_re_time;
    }

    public String getAc_re_purpose() {
        return ac_re_purpose;
    }

    public void setAc_re_purpose(String ac_re_purpose) {
        this.ac_re_purpose = ac_re_purpose;
    }

    public String getAc_re_EnableModeration() {
        return ac_re_EnableModeration;
    }

    public void setAc_re_EnableModeration(String ac_re_EnableModeration) {
        this.ac_re_EnableModeration = ac_re_EnableModeration;
    }

    public Integer getAc_re_jiafen() {
        return ac_re_jiafen;
    }

    public void setAc_re_jiafen(Integer ac_re_jiafen) {
        this.ac_re_jiafen = ac_re_jiafen;
    }

    public Integer getAc_re_approve() {
        return ac_re_approve;
    }

    public void setAc_re_approve(Integer ac_re_approve) {
        this.ac_re_approve = ac_re_approve;
    }

    public String getAc_re_content() {
        return ac_re_content;
    }

    public void setAc_re_content(String ac_re_content) {
        this.ac_re_content = ac_re_content;
    }
}
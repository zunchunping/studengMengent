package entity;

public class ClassName {
    private Integer class_id;//主键

    private Integer gard_id;

    private String class_Name;

    public Integer getClass_id() {
        return class_id;
    }

    public void setClass_id(Integer class_id) {
        this.class_id = class_id;
    }

    public Integer getGard_id() {
        return gard_id;
    }

    public void setGard_id(Integer gard_id) {
        this.gard_id = gard_id;
    }

    public String getClass_Name() {
        return class_Name;
    }

    public void setClass_Name(String class_Name) {
        this.class_Name = class_Name;
    }
}
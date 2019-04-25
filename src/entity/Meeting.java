package entity;

import java.util.Date;

public class Meeting {
    private Integer meeting_id;

    private Integer meeting_compere;

    private Integer meeting_class;

    private Integer meeting_record;

    private Date meeting_date;

    private Integer meeting_depa;

    public Integer getMeeting_id() {
        return meeting_id;
    }

    public void setMeeting_id(Integer meeting_id) {
        this.meeting_id = meeting_id;
    }

    public Integer getMeeting_compere() {
        return meeting_compere;
    }

    public void setMeeting_compere(Integer meeting_compere) {
        this.meeting_compere = meeting_compere;
    }

    public Integer getMeeting_class() {
        return meeting_class;
    }

    public void setMeeting_class(Integer meeting_class) {
        this.meeting_class = meeting_class;
    }

    public Integer getMeeting_record() {
        return meeting_record;
    }

    public void setMeeting_record(Integer meeting_record) {
        this.meeting_record = meeting_record;
    }

    public Date getMeeting_date() {
        return meeting_date;
    }

    public void setMeeting_date(Date meeting_date) {
        this.meeting_date = meeting_date;
    }

    public Integer getMeeting_depa() {
        return meeting_depa;
    }

    public void setMeeting_depa(Integer meeting_depa) {
        this.meeting_depa = meeting_depa;
    }
}
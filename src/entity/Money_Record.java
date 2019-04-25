package entity;

import java.util.Date;

public class Money_Record {
    private Integer money_record_id;

    private Integer apply_de_mass;

    private Integer apply_money;

    private Integer reality_money;

    private Integer money_turnover;

    private Date turnover_date;

    private Integer operator;

    private String turnover_reason;

    public Integer getMoney_record_id() {
        return money_record_id;
    }

    public void setMoney_record_id(Integer money_record_id) {
        this.money_record_id = money_record_id;
    }

    public Integer getApply_de_mass() {
        return apply_de_mass;
    }

    public void setApply_de_mass(Integer apply_de_mass) {
        this.apply_de_mass = apply_de_mass;
    }

    public Integer getApply_money() {
        return apply_money;
    }

    public void setApply_money(Integer apply_money) {
        this.apply_money = apply_money;
    }

    public Integer getReality_money() {
        return reality_money;
    }

    public void setReality_money(Integer reality_money) {
        this.reality_money = reality_money;
    }

    public Integer getMoney_turnover() {
        return money_turnover;
    }

    public void setMoney_turnover(Integer money_turnover) {
        this.money_turnover = money_turnover;
    }

    public Date getTurnover_date() {
        return turnover_date;
    }

    public void setTurnover_date(Date turnover_date) {
        this.turnover_date = turnover_date;
    }

    public Integer getOperator() {
        return operator;
    }

    public void setOperator(Integer operator) {
        this.operator = operator;
    }

    public String getTurnover_reason() {
        return turnover_reason;
    }

    public void setTurnover_reason(String turnover_reason) {
        this.turnover_reason = turnover_reason;
    }
}
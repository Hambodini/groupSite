/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business;

import java.io.Serializable;
import java.time.LocalDate;

/**
 *
 * @author fs148523
 */
public class TacoOrder implements Serializable {

    private int orderID, num;
    private String name;
    private LocalDate date;

    public TacoOrder() {

    }

    public TacoOrder(int orderID, int num, String name, LocalDate date) {
        this.orderID = orderID;
        this.num = num;
        this.name = name;
        this.date = date;
    }

    public TacoOrder(int num, String name, LocalDate date) {
        //If an orderID of 0 is inserted into the DB then it will take the autoID instead
        this.orderID = 0;
        this.num = num;
        this.name = name;
        this.date = date;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package business;

import java.io.Serializable;
import java.time.LocalDate;

/**
 *
 * @author nosam
 */
public class User implements Serializable {
    private int id = 0;
    private String username, email, password; 
    private LocalDate birthday;

    public User() {
    }

    public User(String username, String email, String password, int id, LocalDate birthday) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.id = id;
        this.birthday = birthday;
    }
    
    public User(String username, String email, String password, LocalDate birthday) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.birthday = birthday;
    }
    
    public User(int id, String username, String email, String password, LocalDate birthday) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.birthday = birthday;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public LocalDate getBirthday() {
        return birthday;
    }

    public void setBirthday(LocalDate birthday) {
        this.birthday = birthday;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
}

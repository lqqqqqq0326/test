package com.igeet.day1124.entity;

import java.util.Date;

public class User {
    private Integer id;
    private String name;
    private String pwd;
    private String gender;
    private Date birthday;
    private String email;
    private Integer age;
    private String photo;
    private String state;

    public User() {
    }

    public User(String name, String pwd, String gender, Date birthday, String email) {
        this.name = name;
        this.pwd = pwd;
        this.gender = gender;
        this.birthday = birthday;
        this.email = email;
    }

    public User(Integer id, String name, String pwd, String gender, Date birthday, String email, Integer age, String photo, String state) {
        this.id = id;
        this.name = name;
        this.pwd = pwd;
        this.gender = gender;
        this.birthday = birthday;
        this.email = email;
        this.age = age;
        this.photo = photo;
        this.state = state;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", pwd='" + pwd + '\'' +
                ", gender='" + gender + '\'' +
                ", birthday='" + birthday + '\'' +
                ", email='" + email + '\'' +
                ", age=" + age +
                '}';
    }
}

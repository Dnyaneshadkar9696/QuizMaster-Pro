package com.quizmaster.model;

public class User {

    private int id;
    private String name;
    private String email;
    private String password;
    private String phone;
    private String college;
    private String branch;
    private String year;
    private String skills;

  
    public User() {
    }

 
    public User(String name, String email, String password,
                String phone, String college, String branch,
                String year, String skills) {

        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.college = college;
        this.branch = branch;
        this.year = year;
        this.skills = skills;
    }

    public User(int id, String name, String email, String password,
                String phone, String college, String branch,
                String year, String skills) {

        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.college = college;
        this.branch = branch;
        this.year = year;
        this.skills = skills;
    }

 

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + ", phone=" + phone
				+ ", college=" + college + ", branch=" + branch + ", year=" + year + ", skills=" + skills + "]";
	}
    
    
}
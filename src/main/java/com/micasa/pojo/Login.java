/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.micasa.pojo;

import java.util.HashSet;
import java.util.Set;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 *
 * @author Pranali
 */
public class Login {
    private long id;
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private String phoneNumber;
    private String address;
    private String role;
    private Set<Rent> rentRecord = new HashSet<>();
    private Set<Request> customerRequest = new HashSet<>();
//    private CommonsMultipartFile photo;
//    private String image;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
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

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Set<Rent> getRentRecord() {
        return rentRecord;
    }

    public void setRentRecord(Set<Rent> rentRecord) {
        this.rentRecord = rentRecord;
    }
    
    public void addRentRecord(Rent rent){
        rentRecord.add(rent);
    }
    
    public void addCustomerRequest(Request request){
        customerRequest.add(request);
    }

//    public String getImage() {
//        return image;
//    }
//
//    public void setImage(String image) {
//        this.image = image;
//    }
//
//    public CommonsMultipartFile getPhoto() {
//        return photo;
//    }
//
//    public void setPhoto(CommonsMultipartFile photo) {
//        this.photo = photo;
//    }

    public Set<Request> getCustomerRequest() {
        return customerRequest;
    }

    public void setCustomerRequest(Set<Request> customerRequest) {
        this.customerRequest = customerRequest;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.micasa.dao;

import com.micasa.pojo.Login;
import com.micasa.pojo.Rent;
import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Pranali
 */
public class LoginDAO {
    private static final SessionFactory sf = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
    private Session session = null;

    private Session getSession() {
        if (session == null || !session.isOpen()) {
            session = sf.openSession();
        }
        return session;
    }

    private void beginTransaction() {
        getSession().beginTransaction();
    }

    private void commit() {
        getSession().getTransaction().commit();;
    }

    private void close() {
        getSession().close();
    }

    private void rollbackTransaction() {
        getSession().getTransaction().rollback();
    }
    
    public int addUser(String firstName, String lastName, String email, String password, String phoneNumber, String address, String role) {
        int result = 0;
        try {
            Login u = new Login();
            u.setFirstName(firstName);
            u.setLastName(lastName);
            u.setEmail(email);
            u.setPassword(password);
            u.setPhoneNumber(phoneNumber);
            u.setAddress(address);
            u.setRole(role);
            beginTransaction();
            getSession().save(u);
            commit();
            result = 1;
        } catch (HibernateException e) {
            throw e;
//            rollbackTransaction();
        } finally {
            close();
        }
        return result;
    }
    
//    public Login saveImage(File file){
//        byte[] bFile = new byte[(int) file.length()];
//        try{
//            FileInputStream fileInputStream = new FileInputStream(file);
//            //convert file into array of bytes
//            fileInputStream.read(bFile);
//            fileInputStream.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        } 
//        
//        Login l = new Login();
//        l.setImage(bFile);
//        beginTransaction();
//        getSession().save(l);
//        commit();
//        
//        return l;
//    }
    
    public Login authenticateLogin(String email, String password) {
        Login u = null;
        try {
            beginTransaction();
            Query q = getSession().createQuery("from Login where email= :email AND password= :password");
            q.setString("email", email);
            q.setString("password", password);
            u = (Login) q.uniqueResult();
            commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            rollbackTransaction();
        } finally {
            close();
        }
        return u;
    }
    
    public Login getUserByID(long id) {
    Login u = null;
    try {
        beginTransaction();
        Query q = getSession().createQuery("from Login where id= :id");
        q.setLong("id", id);
        u = (Login) q.uniqueResult();
        commit();
    } catch (HibernateException e) {
        e.printStackTrace();
        rollbackTransaction();
    } finally {
        close();
    }
    return u;
}
    public int getUserByEmail(String email) {
        int result = 0;
    Login u = null;
    try {
        beginTransaction();
        Query q = getSession().createQuery("from Login where email= :email");
        q.setString("email", email);
        u = (Login) q.uniqueResult();
        commit();
        result =1;
    } catch (HibernateException e) {
        e.printStackTrace();
        rollbackTransaction();
    } finally {
        close();
    }
    return result;
}
    
    public List<Login> getAllUsers() {
        List<Login> ll = new ArrayList<>();
        try {
            beginTransaction();
            //Query q = getSession().createQuery("from Message where userName= :username");
            Query q = getSession().createQuery("from Login");
            ll = q.list();
            commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            rollbackTransaction();
        } finally {
            close();
        }
        return ll;
    }
    
    public int saveImage(String email, File file){
        byte[] bFile = new byte[(int) file.length()];

        try{
            FileInputStream fileInputStream = new FileInputStream(file);
            //convert file into array of bytes
            fileInputStream.read(bFile);
            fileInputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        } 
        
        int result = 0;
        try{
            beginTransaction();
            Query q = getSession().createQuery("from Login where email= :email");
            q.setString("email", email);
            Login l = (Login) q.uniqueResult();
//            l.setImage(bFile);
            getSession().save(l);
            commit();
            result = 1;
        } catch(HibernateException ex){
            ex.printStackTrace();
            rollbackTransaction();
        } finally{
            close();
        }
        return result;
    }
    
    public int updateCustomerRent(Login login,Rent rent){
        int result = 0;
        try{
            beginTransaction();
//            Query q = getSession().createQuery("from Login where id= :id");
//            q.setLong("id", id);
//            Login l = (Login) q.uniqueResult();
            login.addRentRecord(rent);
            //getSession().update(login);
//            commit();
            result = 1;
        } catch(HibernateException ex){
            ex.printStackTrace();
            rollbackTransaction();
        } finally{
            close();
        }
        return result;
    }
    
    public int updateUser(long id, String firstName,String lastName,String userEmail,String userPhone,String userAddress,String password){
        int result = 0;
        try{
        beginTransaction();
        Query q = getSession().createQuery("from Login where id= :id");
        q.setLong("id", id);
        Login m = (Login) q.uniqueResult();
        m.setFirstName(firstName);
        m.setLastName(lastName);
        m.setEmail(userEmail);
        m.setPhoneNumber(userPhone);
        m.setAddress(userAddress);
        m.setPassword(password);
        getSession().save(m);
        commit();
        result = 1;
    } catch(HibernateException ex){
        ex.printStackTrace();
        rollbackTransaction();
    } finally{
        close();
    }
        return result;
    }
    
    public List getUserByRole(String role){
        List<Login> loginlist = new ArrayList<>();
        try {
            beginTransaction();
            //Query q = getSession().createQuery("from Message where userName= :username");
            Query q = getSession().createQuery("from Login where role= :role");
            q.setString("role", role);
            loginlist = q.list();
            commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            rollbackTransaction();
        } finally {
            close();
        }
        return loginlist;
    }
    
    public int deleteUser(long id) {
        int result = 0;
        try {
            beginTransaction();
            Query q = getSession().createQuery("from Login where id= :id");
            q.setLong("id", id);
            Login userToDelete = (Login) q.uniqueResult();
            getSession().delete(userToDelete);
            commit();
            result = 1;
        } catch (HibernateException e) {
            e.printStackTrace();
            rollbackTransaction();
        } finally {
            close();
        }
        return result;
    }
}

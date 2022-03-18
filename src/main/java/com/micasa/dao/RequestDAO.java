/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.micasa.dao;

import com.micasa.pojo.Login;
import com.micasa.pojo.Request;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Pranali
 */
public class RequestDAO {
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
    
    public Request addCustomerRequest(Login login, String problemCategory, String problemdesc,String worker,String status) {
//        int result = 0;
        Request request = new Request();
        try {
            request.setLogin(login);
            request.setRequestType(problemCategory);
            request.setRequestDesc(problemdesc);
            request.setAssignWorker(worker);
            request.setStatus(status);
            beginTransaction();
            getSession().save(request);
            commit();
//            result = 1;
        } catch (HibernateException e) {
            e.printStackTrace();
            rollbackTransaction();
        } finally {
            close();
        }
        return request;
    }
    
        public Request updateCustomerRequest(long id,Login login, String problemCategory, String problemdesc,String worker,String status) {
//        int result = 0;
        Request r = null;
        try {
            Query q = getSession().createQuery("from Request where id= :id");
            q.setLong("id", id);
            r = (Request) q.uniqueResult();
            r.setLogin(login);
            r.setRequestType(problemCategory);
            r.setRequestDesc(problemdesc);
            r.setAssignWorker(worker);
            r.setStatus(status);
            beginTransaction();
            getSession().save(r);
            commit();
//            result = 1;
        } catch (HibernateException e) {
            e.printStackTrace();
            rollbackTransaction();
        } finally {
            close();
        }
        return r;
    }
    
    
}

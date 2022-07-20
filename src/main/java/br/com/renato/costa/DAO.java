package br.com.renato.costa;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.hibernate.Session;
import org.hibernate.ejb.*;


public class DAO {

	private static EntityManagerFactory emf = null;

	public EntityManagerFactory getEntityManager() {
		if(emf == null) {
			emf = Persistence.createEntityManagerFactory("sistema");
		}
		
		return emf;
	}

	public DAO() {
		
	}
	/*
	public Session getSession() {
		Session session = null;
		if(getEntityManager().getDelegate() instanceof EntityManagerImpl) {
			EntityManagerImpl entityManagerImpl = EntityManagerImpl) getEntityManager().getDelegate();
		
			return entityManagerImpl.getSession();
			*/
		
		
	}



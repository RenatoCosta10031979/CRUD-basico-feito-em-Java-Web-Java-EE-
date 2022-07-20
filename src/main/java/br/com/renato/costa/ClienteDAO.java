package br.com.renato.costa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import org.hibernate.boot.model.source.spi.EmbeddableSource;

@SuppressWarnings("unused")
public class ClienteDAO extends DAO {
	
	//Método salvar ( READER)
	public void salvar(Cliente cliente) {
		EntityManager em = getEntityManager().createEntityManager();

		try {

			em.getTransaction().begin();
			em.persist(cliente);
			em.getTransaction().commit();
			em.close();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}

	}
	//MÉTODO QUE RETORNA UM  OBJETO DO TIPO CLIENTE ATRAVÉS DO ID
	public Cliente getById(int idCliente) {
		EntityManager em = null;
		try {
			em = getEntityManager().createEntityManager();
		return em.find(Cliente.class, idCliente);
			
		}finally {
			em.close();
		}
		
	}
	
	//Método UPDATE
	public void update(Cliente cliente) {
		EntityManager em = getEntityManager().createEntityManager();
		try {
			em.getTransaction().begin();
			//Recupera o objeto
			Cliente c = em.find(Cliente.class, cliente.getId());
			
			//Atualiza o objeto recuperado
			c.setNome(cliente.getNome());
			c.setSobrenome(cliente.getSobrenome());
			c.setCat(cliente.getCat());
			em.getTransaction().commit();
			em.close();
		}catch(Exception e) {
			em.getTransaction().rollback();
		}
	}
	
	//Método APAGAR (DELETE)
	public void delete(Cliente cliente) {
		EntityManager em = getEntityManager().createEntityManager();
		
		try {
			em.getTransaction().begin();
			Cliente c = em.find(Cliente.class, cliente.getId());
			em.remove(c);
			em.getTransaction().commit();
			
		}catch(Exception e) {
			em.getTransaction().rollback();
		}
	}
	

	@SuppressWarnings("unchecked")
	public List<Cliente> exibir(){
		EntityManager em = getEntityManager().createEntityManager();
		
		try{
			Query q = em.createQuery("select object(c) from Cliente as c");
			return q.getResultList();
		} finally{
			em.close();
		}
	}

	}



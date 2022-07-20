package br.com.renato.costa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

public class CategoriaDAO extends DAO {

	// Método CRIAR (CREATE)
	public void salvar(Categoria cat) {
		EntityManager em = getEntityManager().createEntityManager();

		try {
			em.getTransaction().begin();
			em.persist(cat);
			em.getTransaction().commit();
		} catch (Exception e) {

			em.getTransaction().rollback();

		}
	}

	// Método retornar um objeto a partir do ID
	public Categoria getById(int idCat) {
		EntityManager em = getEntityManager().createEntityManager();
		return em.find(Categoria.class, idCat);
	}

	// MÉTODO ATUALIZAR (UPDATE)
	public void update(Categoria cat) {

		EntityManager em = getEntityManager().createEntityManager();

		try {
			em.getTransaction().begin();
			Categoria c = em.find(Categoria.class, cat.getId());
			c.setNome(cat.getNome());
			c.setOrdem(cat.getOrdem());
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}

	// Método APAGAR( DELETE)
	public void delete(Categoria cat) {
		EntityManager em = getEntityManager().createEntityManager();

		try {
			em.getTransaction().begin();
			Categoria c = em.find(Categoria.class, cat.getId());
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}

	public List<Categoria> exibir() {
		EntityManager em = getEntityManager().createEntityManager();

		try {
			Query q = em.createQuery("select object (c) from Categoria as c");
			return q.getResultList();
		} finally {
			em.close();
		}
	}
}

package ptithcm.dao.impl;



import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ModelAttribute;

import ptithcm.dao.IGeneralDAO;

@Transactional
@Repository
public class GeneralDAO<L, K> implements IGeneralDAO<L, K> {

	@Autowired
	protected SessionFactory factory;

	
	public L create(L entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}
	
	
	public void update(L entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	public void delete(K... ids) {
		Session session = factory.getCurrentSession();
		for (K id : ids) {
			L entity = this.findById(id);
			session.delete(entity);
		}
	}
	
	@SuppressWarnings("unchecked")
	public L findById(K id) {
		Session session = factory.getCurrentSession();
		Class<L> entityClass = this.getEntityClass();
		L entity = (L) session.get(entityClass, (Serializable) id);
		return entity;
	}


	@SuppressWarnings("unchecked")
	private Class<L> getEntityClass() {
		ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();
		return  (Class<L>) type.getActualTypeArguments()[0];
	}

	@SuppressWarnings("unchecked")
	public List<L> findAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM " + this.getEntityClass().getSimpleName();
		Query query = session.createQuery(hql);
		List<L> entity = query.list();
		return entity;
	}
}

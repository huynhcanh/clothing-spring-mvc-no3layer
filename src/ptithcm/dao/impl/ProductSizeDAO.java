package ptithcm.dao.impl;


import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import ptithcm.dao.IProductSizeDAO;
import ptithcm.entity.ProductsSizesEntity;

@Repository
@Transactional
public class ProductSizeDAO extends GeneralDAO<ProductsSizesEntity, Integer> implements IProductSizeDAO{

	@Override
	public List<ProductsSizesEntity> findByIdProduct(Integer idProduct, Integer idSize) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductsSizesEntity A WHERE A.product.id= :id1 AND A.size.id= :id2";
		Query query = session.createQuery(hql);
		query.setParameter("id1", idProduct);
		query.setParameter("id2", idSize);
		List<ProductsSizesEntity> result = query.list();
		return result;
	}

	@Override
	public List<ProductsSizesEntity> getListDesc() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductsSizesEntity a ORDER BY a.id DESC";
		Query query = session.createQuery(hql);
		List<ProductsSizesEntity> product = query.list();
		return product;
	}

	@Override
	public List<ProductsSizesEntity> getListbyIdProduct(Integer idProduct) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductsSizesEntity A WHERE A.product.id= :id1";
		Query query = session.createQuery(hql);
		query.setParameter("id1", idProduct);
		List<ProductsSizesEntity> result = query.list();
		return result;
	}

}

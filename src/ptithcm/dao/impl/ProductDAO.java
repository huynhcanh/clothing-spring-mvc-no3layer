package ptithcm.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import ptithcm.dao.IProductDAO;
import ptithcm.entity.ProductsEntity;


@Repository
@Transactional
public class ProductDAO extends GeneralDAO<ProductsEntity, Integer> implements IProductDAO {

	@Override
	public List<ProductsEntity> findByCategoryId(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductsEntity p WHERE p.categories.id = :idp";
		Query query = session.createQuery(hql);
		query.setParameter("idp", id);
		List<ProductsEntity> product = query.list();
		return product;
	}

}

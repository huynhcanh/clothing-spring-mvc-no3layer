package ptithcm.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import ptithcm.dao.IOrderDetailsDAO;
import ptithcm.entity.OrderDetailsEntity;


@Repository
@Transactional
public class OrderDetailsDAO extends GeneralDAO<OrderDetailsEntity, Integer> implements IOrderDetailsDAO{

	@Override
	public List<OrderDetailsEntity> findByOrderId(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM OrderDetailsEntity a WHERE a.order.id = :idp";
		Query query = session.createQuery(hql);
		query.setParameter("idp", id);
		List<OrderDetailsEntity> result = query.list();
		return result;
	}

}

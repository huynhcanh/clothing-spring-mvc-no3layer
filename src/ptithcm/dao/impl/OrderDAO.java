package ptithcm.dao.impl;

import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import ptithcm.dao.IOrderDAO;
import ptithcm.entity.OrdersEntity;

@Repository
@Transactional
public class OrderDAO extends GeneralDAO<OrdersEntity, Integer> implements IOrderDAO {

}

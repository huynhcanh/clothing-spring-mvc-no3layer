package ptithcm.dao;

import java.util.List;

import ptithcm.entity.OrderDetailsEntity;

public interface IOrderDetailsDAO extends IGeneralDAO<OrderDetailsEntity, Integer> {

	List<OrderDetailsEntity> findByOrderId(Integer id) ;

}

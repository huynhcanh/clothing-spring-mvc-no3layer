package ptithcm.service;

import java.util.List;

import ptithcm.entity.OrderDetailsEntity;

public interface IOrderDetailsService extends IGeneralService<OrderDetailsEntity, Integer> {
	List<OrderDetailsEntity> findByOrderId(Integer Id);
}

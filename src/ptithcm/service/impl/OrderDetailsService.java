package ptithcm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ptithcm.dao.IOrderDetailsDAO;
import ptithcm.entity.OrderDetailsEntity;
import ptithcm.service.IOrderDetailsService;

@Service
public class OrderDetailsService extends GeneralService<OrderDetailsEntity, Integer> implements IOrderDetailsService{

	@Autowired
	private IOrderDetailsDAO dao;
	
	@Override
	public List<OrderDetailsEntity> findByOrderId(Integer id) {
		return dao.findByOrderId(id);
	}

}

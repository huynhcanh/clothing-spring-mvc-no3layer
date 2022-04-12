package ptithcm.service.impl;

import org.springframework.stereotype.Service;

import ptithcm.entity.OrdersEntity;
import ptithcm.service.IOrderService;

@Service
public class OrderService extends GeneralService<OrdersEntity, Integer> implements IOrderService {

}

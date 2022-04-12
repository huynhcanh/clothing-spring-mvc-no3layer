package ptithcm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ptithcm.dao.IProductDAO;
import ptithcm.entity.ProductsEntity;
import ptithcm.service.IProductService;

@Service
public class ProductService extends GeneralService<ProductsEntity, Integer>implements IProductService {

	@Autowired
	private IProductDAO dao;
	
	@Override
	public List<ProductsEntity> findByCategoryId(Integer id) {
		return dao.findByCategoryId(id);
	}

}


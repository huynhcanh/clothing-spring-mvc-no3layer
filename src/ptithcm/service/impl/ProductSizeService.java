package ptithcm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ptithcm.dao.IProductSizeDAO;
import ptithcm.entity.ProductsSizesEntity;
import ptithcm.service.IProductSizeService;

@Service
public class ProductSizeService extends GeneralService<ProductsSizesEntity, Integer>implements IProductSizeService {
	
	@Autowired
	private IProductSizeDAO dao;
	
	@Override
	public List<ProductsSizesEntity> findByIdProduct(Integer idProduct, Integer idSize) {
		return dao.findByIdProduct(idProduct, idSize);
	}

	@Override
	public List<ProductsSizesEntity> getListDesc() {
		return dao.getListDesc();
	}

	@Override
	public List<ProductsSizesEntity> getByProduct(Integer idProduct) {
		return dao.getListbyIdProduct(idProduct);
	}
	

}

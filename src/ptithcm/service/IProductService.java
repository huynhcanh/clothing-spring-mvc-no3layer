package ptithcm.service;

import java.util.List;

import ptithcm.entity.ProductsEntity;

public interface IProductService extends IGeneralService<ProductsEntity, Integer> {
	List<ProductsEntity> findByCategoryId(Integer id);
}

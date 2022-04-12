package ptithcm.dao;

import java.util.List;

import ptithcm.entity.ProductsEntity;

public interface IProductDAO extends IGeneralDAO<ProductsEntity, Integer> {
	List<ProductsEntity> findByCategoryId(Integer id);
}
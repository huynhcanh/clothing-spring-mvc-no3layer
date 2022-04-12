package ptithcm.dao;

import java.util.List;

import ptithcm.entity.ProductsSizesEntity;

public interface IProductSizeDAO extends IGeneralDAO<ProductsSizesEntity, Integer> {
	List<ProductsSizesEntity> findByIdProduct(Integer idProduct, Integer idSize);
	List<ProductsSizesEntity> getListDesc();
	List<ProductsSizesEntity> getListbyIdProduct(Integer idProduct);
}

package ptithcm.service;

import java.util.List;

import ptithcm.entity.ProductsSizesEntity;

public interface IProductSizeService extends IGeneralService<ProductsSizesEntity, Integer> {
	List<ProductsSizesEntity> findByIdProduct(Integer idProduct, Integer idSize);
	List<ProductsSizesEntity> getByProduct(Integer idProduct);
	List<ProductsSizesEntity> getListDesc();
}

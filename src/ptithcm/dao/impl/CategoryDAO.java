package ptithcm.dao.impl;

import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import ptithcm.dao.ICategoryDAO;
import ptithcm.entity.CategoriesEntity;

@Repository
@Transactional
public class CategoryDAO extends GeneralDAO<CategoriesEntity, Integer> implements ICategoryDAO {

}

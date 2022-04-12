package ptithcm.dao.impl;


import javax.transaction.Transactional;


import org.springframework.stereotype.Repository;

import ptithcm.dao.ISizeDAO;
import ptithcm.entity.SizesEntity;

@Repository
@Transactional
public class SizeDAO extends GeneralDAO<SizesEntity, Integer> implements ISizeDAO{

}

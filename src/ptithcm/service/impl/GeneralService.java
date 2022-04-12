package ptithcm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import ptithcm.dao.IGeneralDAO;
import ptithcm.service.IGeneralService;



public class GeneralService<L, K> implements IGeneralService<L, K> {
	@Autowired
	private IGeneralDAO<L, K> dao;

	public L add(L entity) {
		return dao.create(entity);
	}

	public void update(L entity) {
		dao.update(entity);
	}

	public void delete(K... ks) {
		dao.delete(ks);
	}

	public List<L> findAll() {
		return dao.findAll();
	}

	public L findById(K id) {
		return dao.findById(id);
	}

}

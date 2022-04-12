package ptithcm.service;

import java.util.List;

public interface IGeneralService<L,K> {
	L add(L entity);
	void update(L entity);
	void delete(K...ks);	
	List<L> findAll();
	L findById(K id);

}

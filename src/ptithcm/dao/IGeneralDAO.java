package ptithcm.dao;

import java.util.List;

public interface IGeneralDAO<L, K> {
	L create(L entity);

	void update(L entity);

	void delete(K... ids);

	L findById(K id);

    List<L> findAll();
}

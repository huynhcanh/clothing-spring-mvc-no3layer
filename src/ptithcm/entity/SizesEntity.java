package ptithcm.entity;

import java.util.Collection;

import javax.persistence.*;

@Entity
@Table(name="Sizes")
public class SizesEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	
	@Column(name="name")
	private String name;
	
	@OneToMany(mappedBy = "size", cascade = CascadeType.ALL)
    private Collection<ProductsSizesEntity> productsize;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Collection<ProductsSizesEntity> getProductsize() {
		return productsize;
	}

	public void setProductsize(Collection<ProductsSizesEntity> productsize) {
		this.productsize = productsize;
	}

	public SizesEntity(Integer id, String name, Collection<ProductsSizesEntity> productsize) {
		super();
		this.id = id;
		this.name = name;
		this.productsize = productsize;
	}

	public SizesEntity() {
		super();
	}
	
	
}

package ptithcm.entity;

import java.util.Collection;

import javax.persistence.*;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name="Categories")
public class CategoriesEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	
	@Column(name="name")
	@NotBlank(message="Not empty !")
	private String name;
	
	@OneToMany(mappedBy = "categories", cascade = CascadeType.ALL)
	private Collection<ProductsEntity> products;

	

	public CategoriesEntity() {
		super();
	}

	public CategoriesEntity(Integer id, String name, Collection<ProductsEntity> products) {
		super();
		this.id = id;
		this.name = name;
		this.products = products;
	}

	public CategoriesEntity(Integer id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public CategoriesEntity(Integer id) {
		super();
		this.id = id;
	}

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

	public Collection<ProductsEntity> getProducts() {
		return products;
	}

	public void setProducts(Collection<ProductsEntity> products) {
		this.products = products;
	}
	
}

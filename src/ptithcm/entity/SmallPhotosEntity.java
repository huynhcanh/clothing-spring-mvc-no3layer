package ptithcm.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="SmallPhotos")
public class SmallPhotosEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	
	@Column(name="photo")
	private String photo;

	@ManyToOne
	@JoinColumn(name="product_id")
	private ProductsEntity product;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public ProductsEntity getProduct() {
		return product;
	}

	public void setProduct(ProductsEntity product) {
		this.product = product;
	}

	public SmallPhotosEntity(Integer id, String photo, ProductsEntity product) {
		super();
		this.id = id;
		this.photo = photo;
		this.product = product;
	}

	public SmallPhotosEntity() {
		super();
	}

	
}

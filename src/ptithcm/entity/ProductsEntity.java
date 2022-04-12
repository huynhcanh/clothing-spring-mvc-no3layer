package ptithcm.entity;

import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="Products")
public class ProductsEntity{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;

	@Column(name="name")
	@NotNull
	private String name;


	@Column(name="image")
	private String image;

	@Column(name="unitPrice")
	@NotNull
	private Float unitPrice;
	
	@Column(name="salePrice")
	@NotNull
	private Float salePrice;

	@Column(name="discount")
	@NotNull
	private Float discount;


	@Column(name="description")
	@NotNull
	private String description;


	@ManyToOne
	@JoinColumn(name="category_id")
	private CategoriesEntity categories;

	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private Collection<ProductsSizesEntity> productsize;

	@Transient
	private Integer quantity;

	@Transient
	private Integer size;

	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
	private Collection<SmallPhotosEntity> smallphotos;

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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Float getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Float unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Float getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(Float salePrice) {
		this.salePrice = salePrice;
	}

	public Float getDiscount() {
		return discount;
	}

	public void setDiscount(Float discount) {
		this.discount = discount;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public CategoriesEntity getCategories() {
		return categories;
	}

	public void setCategories(CategoriesEntity categories) {
		this.categories = categories;
	}

	public Collection<ProductsSizesEntity> getProductsize() {
		return productsize;
	}

	public void setProductsize(Collection<ProductsSizesEntity> productsize) {
		this.productsize = productsize;
	}

	public Collection<SmallPhotosEntity> getSmallphotos() {
		return smallphotos;
	}

	public void setSmallphotos(Collection<SmallPhotosEntity> smallphotos) {
		this.smallphotos = smallphotos;
	}

	public ProductsEntity(Integer id, String name, String image, Float unitPrice, Float salePrice, Float discount,
			String description, CategoriesEntity categories,
			Collection<ProductsSizesEntity> productsize, Collection<SmallPhotosEntity> smallphotos) {
		super();
		this.id = id;
		this.name = name;
		this.image = image;
		this.unitPrice = unitPrice;
		this.salePrice = salePrice;
		this.discount = discount;
		this.description = description;
		this.categories = categories;
		this.productsize = productsize;
		this.smallphotos = smallphotos;
	}

	public ProductsEntity() {
		super();
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}


}

package ptithcm.entity;

import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name="ProductsSizes", uniqueConstraints= @UniqueConstraint(columnNames= {"size_id", "product_id"}))
public class ProductsSizesEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	
	@Column(name="quantity")
	private Integer quantity;
	
	@ManyToOne
	@JoinColumn(name="size_id")
    private SizesEntity size;
	
	@ManyToOne
	@JoinColumn(name="product_id")
    private ProductsEntity product;

	@OneToMany(mappedBy = "productsize", cascade = CascadeType.ALL)
    private Collection<OrderDetailsEntity> orderdetails;
	
	@OneToMany(mappedBy = "productsize", cascade = CascadeType.ALL)
    private Collection<CartsEntity> cart;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public SizesEntity getSize() {
		return size;
	}

	public void setSize(SizesEntity size) {
		this.size = size;
	}

	public ProductsEntity getProduct() {
		return product;
	}

	public void setProduct(ProductsEntity product) {
		this.product = product;
	}

	public Collection<OrderDetailsEntity> getOrderdetails() {
		return orderdetails;
	}

	public void setOrderdetails(Collection<OrderDetailsEntity> orderdetails) {
		this.orderdetails = orderdetails;
	}

	public Collection<CartsEntity> getCart() {
		return cart;
	}

	public void setCart(Collection<CartsEntity> cart) {
		this.cart = cart;
	}

	public ProductsSizesEntity(Integer id, SizesEntity size, ProductsEntity product,
			Collection<OrderDetailsEntity> orderdetails, Collection<CartsEntity> cart) {
		super();
		this.id = id;
		this.size = size;
		this.product = product;
		this.orderdetails = orderdetails;
		this.cart = cart;
	}

	public ProductsSizesEntity() {
		super();
	}
	
	
	
}

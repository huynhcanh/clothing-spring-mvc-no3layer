package ptithcm.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name="Carts", uniqueConstraints= @UniqueConstraint(columnNames= {"customer_id", "productsize_id"}))
public class CartsEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	
	@Column(name="quantity")
	private Integer quantity;
	
	@Column(name="totalMoney")
	private Float totalMoney;
	
	@ManyToOne
	@JoinColumn(name="customer_id")
    private CustomersEntity customer;
	
	@ManyToOne
	@JoinColumn(name="productsize_id")
    private ProductsSizesEntity productsize;

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

	public Float getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(Float totalMoney) {
		this.totalMoney = totalMoney;
	}

	public CustomersEntity getCustomer() {
		return customer;
	}

	public void setCustomer(CustomersEntity customer) {
		this.customer = customer;
	}

	public ProductsSizesEntity getProductsize() {
		return productsize;
	}

	public void setProductsize(ProductsSizesEntity productsize) {
		this.productsize = productsize;
	}

	public CartsEntity(Integer id, Integer quantity, Float totalMoney, CustomersEntity customer,
			ProductsSizesEntity productsize) {
		super();
		this.id = id;
		this.quantity = quantity;
		this.totalMoney = totalMoney;
		this.customer = customer;
		this.productsize = productsize;
	}

	public CartsEntity() {
		super();
	}
	
	
}

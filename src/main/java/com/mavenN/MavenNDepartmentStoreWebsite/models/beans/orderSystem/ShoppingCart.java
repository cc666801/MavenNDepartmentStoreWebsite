package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem;

import java.text.DateFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;

@Entity
@Table(name = "shopping_cart")
public class ShoppingCart {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "shopping_cart_id")
    private Integer shoppingCartId;
    
    @ManyToOne
    @JoinColumn(name = "fk_member_id", unique = true)
    private Member member;
    
    @OneToMany(cascade = CascadeType.PERSIST, orphanRemoval = true, mappedBy = "shoppingCart")
    private List<ShoppingCartCommodity> shoppingCartCommodities;
    
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @Column(name = "last_updated_time", columnDefinition = "datetime")
    private Date lastUpdatedTime;
    
    @PrePersist
    public void setLastUpdatedTimeIfNull() {
        if (lastUpdatedTime == null) {
        	lastUpdatedTime = new Date();
        }
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss.SSS", Locale.US);
        dateFormat.setLenient(false);  // 禁用毫秒數格式化
        dateFormat.setDateFormatSymbols(new DateFormatSymbols(Locale.US) {

       	/**
       	 * 
       	 */
       	private static final long serialVersionUID = 1L;
			@Override
            public String[] getMonths() {
                return new String[]{"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
            }
        });  // 避免月份被縮寫
        lastUpdatedTime.setTime((lastUpdatedTime.getTime() / 1000) * 1000);  // 將毫秒數設為0
        String formattedDate = dateFormat.format(lastUpdatedTime);
        System.out.println("Formatted date: " + formattedDate);
    }
    

    // getter and setter methods
	public Integer getShoppingCartId() {
		return shoppingCartId;
	}

	public void setShoppingCartId(Integer shoppingCartId) {
		this.shoppingCartId = shoppingCartId;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public List<ShoppingCartCommodity> getShoppingCartCommodities() {
		return shoppingCartCommodities;
	}

	public void setShoppingCartCommodities(List<ShoppingCartCommodity> shoppingCartCommodities) {
		this.shoppingCartCommodities = shoppingCartCommodities;
	}
	
	public Date getLastUpdatedTime() {
        return lastUpdatedTime;
    }

    public void setLastUpdatedTime(Date lastUpdatedTime) {
        this.lastUpdatedTime = lastUpdatedTime;
    }

	@Override
	public String toString() {
		return "ShoppingCart [shoppingCartId=" + shoppingCartId + ", member=" + member + ", shoppingCartCommodities="
				+ shoppingCartCommodities + "]";
	}

}



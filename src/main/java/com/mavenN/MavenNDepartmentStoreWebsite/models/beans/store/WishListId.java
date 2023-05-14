package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.store;

import java.io.Serializable;
import java.util.Objects;

public class WishListId implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer member;

    private Integer commodity;

	public Integer getMember() {
		return member;
	}

	public void setMember(Integer member) {
		this.member = member;
	}

	public Integer getCommodity() {
		return commodity;
	}

	public void setCommodity(Integer commodity) {
		this.commodity = commodity;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

    // constructors, getters, and setters
    
    
    
    
}
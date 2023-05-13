package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.store;

import java.io.Serializable;
import java.util.Objects;

public class WishListId implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer member;
    private Integer commodity;

    public WishListId() {}

    public WishListId(Integer member, Integer commodity) {
        this.member = member;
        this.commodity = commodity;
    }

    // getters and setters

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof WishListId)) return false;
        WishListId that = (WishListId) o;
        return Objects.equals(getMember(), that.getMember()) &&
                Objects.equals(getCommodity(), that.getCommodity());
    }

    private Object getCommodity() {
		// TODO Auto-generated method stub
		return null;
	}

	private Object getMember() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
    public int hashCode() {
        return Objects.hash(getMember(), getCommodity());
    }
}
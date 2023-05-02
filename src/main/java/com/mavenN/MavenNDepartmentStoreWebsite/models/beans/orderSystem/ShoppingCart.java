//package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem;
//
//@Entity
//@Table(name = "shopping_cart")
//public class ShoppingCart {
//    
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @Column(name = "id")
//    private Long id;
//    
//    @ManyToOne
//    @JoinColumn(name = "user_id", referencedColumnName = "id")
//    private User user;
//    
//    @OneToMany(mappedBy = "shoppingCart", cascade = CascadeType.ALL)
//    private List<CartItem> cartItems;
//    
//    public ShoppingCart() {
//        cartItems = new ArrayList<>();
//    }
//    
//    public void addItem(CartItem item) {
//        cartItems.add(item);
//        item.setShoppingCart(this);
//    }
//    
//    public void removeItem(CartItem item) {
//        cartItems.remove(item);
//        item.setShoppingCart(null);
//    }
//    
//    public void setUser(User user) {
//        this.user = user;
//    }
//    
//    public User getUser() {
//        return user;
//    }
//    
//    public List<CartItem> getCartItems() {
//        return cartItems;
//    }
//    
//    public void setCartItems(List<CartItem> cartItems) {
//        this.cartItems = cartItems;
//    }
//    
//    public Long getId() {
//        return id;
//    }
//    
//    public void setId(Long id) {
//        this.id = id;
//    }
//    
//    public Double getTotalPrice() {
//        Double totalPrice = 0.0;
//        for (CartItem item : cartItems) {
//            totalPrice += item.getProduct().getPrice() * item.getQuantity();
//        }
//        return totalPrice;
//    }
//}
//

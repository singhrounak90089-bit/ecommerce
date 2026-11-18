package com.jtspringproject.JtSpringProject.dao;

import java.util.Collections;
import java.util.List;
import javax.persistence.NoResultException;
import com.jtspringproject.JtSpringProject.models.Cart;

import com.jtspringproject.JtSpringProject.models.CartProduct;
import com.jtspringproject.JtSpringProject.models.Product;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class cartProductDao {
    private final SessionFactory sessionFactory;

    public cartProductDao(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Transactional
    public CartProduct addCartProduct(CartProduct cartProduct) {
        this.sessionFactory.getCurrentSession().save(cartProduct);
        return cartProduct;
    }

    @Transactional
    public List<CartProduct> getCartProducts() {
        return this.sessionFactory.getCurrentSession().createQuery("from CART_PRODUCT", CartProduct.class).list();
    }

    @Transactional
    public List<CartProduct> getCartProducts(Cart cart) {
        return this.sessionFactory.getCurrentSession()
                .createQuery("select cp from CartProduct cp join fetch cp.product p left join fetch p.category where cp.cart.id = :cartId", CartProduct.class)
                .setParameter("cartId", cart.getId())
                .list();
    }

    @Transactional
    public CartProduct getCartProduct(Cart cart, Product product) {
        try {
            return this.sessionFactory.getCurrentSession()
                    .createQuery("from CartProduct cp where cp.cart.id = :cartId and cp.product.id = :productId", CartProduct.class)
                    .setParameter("cartId", cart.getId())
                    .setParameter("productId", product.getId())
                    .getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }

    @Transactional
    public List<Product> getProductByCartID(Integer cart_id) {
        String sql = "SELECT product_id FROM cart_product WHERE cart_id = :cart_id";
        List<Integer> productIds = this.sessionFactory.getCurrentSession()
                .createNativeQuery(sql)
                .setParameter("cart_id", cart_id)
                .list();

        if (productIds.isEmpty()) {
            return Collections.emptyList();
        }

        sql = "SELECT * FROM product WHERE id IN (:product_ids)";
        return this.sessionFactory.getCurrentSession()
                .createNativeQuery(sql, Product.class)
                .setParameterList("product_ids", productIds)
                .list();
    }

    @Transactional
    public void updateCartProduct(CartProduct cartProduct) {
        this.sessionFactory.getCurrentSession().update(cartProduct);
    }

    @Transactional
    public void deleteCartProduct(CartProduct cartProduct) {
        this.sessionFactory.getCurrentSession().delete(cartProduct);
    }
}

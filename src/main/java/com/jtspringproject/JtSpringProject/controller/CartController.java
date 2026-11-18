package com.jtspringproject.JtSpringProject.controller;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jtspringproject.JtSpringProject.dao.cartProductDao;
import com.jtspringproject.JtSpringProject.models.Cart;
import com.jtspringproject.JtSpringProject.models.CartProduct;
import com.jtspringproject.JtSpringProject.models.Product;
import com.jtspringproject.JtSpringProject.models.User;
import com.jtspringproject.JtSpringProject.services.cartService;
import com.jtspringproject.JtSpringProject.services.productService;
import com.jtspringproject.JtSpringProject.services.userService;

@Controller
public class CartController {
	private final cartService cartService;
	private final cartProductDao cartProductDao;
	private final productService productService;
	private final userService userService;

	public CartController(cartService cartService, cartProductDao cartProductDao,
			productService productService, userService userService) {
		this.cartService = cartService;
		this.cartProductDao = cartProductDao;
		this.productService = productService;
		this.userService = userService;
	}

	@GetMapping("/cart")
	public String viewCart(Authentication authentication, Model model) {
		User customer = currentUser(authentication);
		if (customer == null) {
			return "redirect:/login";
		}
		Cart cart = cartService.getOrCreateCart(customer);
		List<CartProduct> items = cartProductDao.getCartProducts(cart);
		model.addAttribute("cartItems", items);
		model.addAttribute("total", items.stream().mapToInt(item -> item.getProduct().getPrice()).sum());
		return "cartproduct";
	}

	@PostMapping("/cart/add")
	public String addToCart(@RequestParam("id") int productId, Authentication authentication) {
		User customer = currentUser(authentication);
		if (customer == null) {
			return "redirect:/login";
		}
		Product product = productService.getProduct(productId);
		if (product != null && product.getQuantity() > 0) {
			Cart cart = cartService.getOrCreateCart(customer);
			if (cartProductDao.getCartProduct(cart, product) == null) {
				cartProductDao.addCartProduct(new CartProduct(cart, product));
			}
		}
		return "redirect:/cart";
	}

	@PostMapping("/cart/remove")
	public String removeFromCart(@RequestParam("id") int productId, Authentication authentication) {
		User customer = currentUser(authentication);
		if (customer == null) {
			return "redirect:/login";
		}
		Cart cart = cartService.getOrCreateCart(customer);
		Product product = productService.getProduct(productId);
		if (product != null) {
			CartProduct item = cartProductDao.getCartProduct(cart, product);
			if (item != null) {
				cartProductDao.deleteCartProduct(item);
			}
		}
		return "redirect:/cart";
	}

	private User currentUser(Authentication authentication) {
		return authentication == null ? null : userService.getUserByUsername(authentication.getName());
	}
}

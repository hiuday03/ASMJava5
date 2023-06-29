package com.poly.asmht.controller;

import com.poly.asmht.DTO.ProductDTO;
import com.poly.asmht.DTO.UserDTO;
import com.poly.asmht.entity.Account;
import com.poly.asmht.entity.Order;
import com.poly.asmht.entity.OrderDetail;
import com.poly.asmht.entity.Product;
import com.poly.asmht.service.impl.AccountServiceImpl;
import com.poly.asmht.service.impl.CategoryServiceImpl;
import com.poly.asmht.service.impl.OrderDetailServiceImpl;
import com.poly.asmht.service.impl.OrderServiceImpl;
import com.poly.asmht.service.impl.ProductServiceImpl;
import com.poly.asmht.service.impl.ShoppingCartServiceImpl;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Optional;

@Controller
public class HomeController {

    @Autowired
    private CategoryServiceImpl categoryService;

    @Autowired
    private ProductServiceImpl productService;

    @Autowired
    private AccountServiceImpl accountService;

    @Autowired
    private OrderServiceImpl orderService;

    @Autowired
    private OrderDetailServiceImpl orderDetailService;

    @Autowired
    private ShoppingCartServiceImpl shoppingCartService;

    @GetMapping( "/home")
    public String home(Model model, @RequestParam("p") Optional<Integer> p, @RequestParam("sort") Optional<String> sort, HttpSession session) {
        int pageSize = 6;
        int currentPage = p.orElse(0);
        Sort.Direction sortDirection = Sort.Direction.DESC;
        String sortField = sort.orElse("price");

        if (sortField == null || sortField.isEmpty()) {
            sortField = "price";
        }
        Sort sortObj = Sort.by(sortDirection, sortField);
        Pageable pageable = PageRequest.of(currentPage, pageSize, sortObj);
        Page<Product> page = productService.getAll(pageable);
        model.addAttribute("listProduct", page.getContent());
        model.addAttribute("listCategory", categoryService.getAll());
        model.addAttribute("page", page);

        UserDTO userDTO = (UserDTO) session.getAttribute("user");
        model.addAttribute("userDTO", userDTO);
        return "Home/home";
    }

    @GetMapping("/home/productDetail/{id}")
    public String productDetail(Model model, @PathVariable int id, HttpSession session) {
        Optional<Product> product = productService.findById(id);
        if (product.isPresent()) {
            model.addAttribute("product", product.get());
            session.setAttribute("product", product.get());
            return "Home/productDetail";
        }

        return "redirect:/home";
    }

//    cart

    @GetMapping("/home/cart")
    public String view(Model model) {
        model.addAttribute("cart", shoppingCartService);
        model.addAttribute("totalPrice", shoppingCartService.getAmount());
        return "cart/cart";
    }

    @GetMapping("/cart/add/{id}")
    public String add(@PathVariable("id") Integer id) {
        shoppingCartService.add(id);
        return "redirect:/home/cart"; // hiển thị giỏ hàng
    }

    @GetMapping("/cart/remove/{id}")
    public String remove(@PathVariable("id") Integer id) {
        shoppingCartService.remove(id);
        return "redirect:/home/cart";
    }

    @RequestMapping("/cart/update/{id}")
    public String update(@PathVariable("id") Integer id,
                         @RequestParam("qty") Integer qty) {
        shoppingCartService.update(id, qty);
        return "redirect:/home/cart";
    }

    @GetMapping("/cart/clear")
    public String clear() {
        shoppingCartService.clear();
        return "redirect:/home/cart";
    }

    //category
    @GetMapping("/home/category/{id}")
    public String getProductByCategoryId(@PathVariable("id") String id, Model model, @RequestParam("p") Optional<Integer> p, @RequestParam("sort") Optional<String> sort) {
        int pageSize = 12;
        int currentPage = p.orElse(0);
        Sort.Direction sortDirection = Sort.Direction.DESC;
        String sortField = sort.orElse("price");

        if (sortField == null || sortField.isEmpty()) {
            sortField = "price";
        }
        Sort sortObj = Sort.by(sortDirection, sortField);
        Pageable pageable = PageRequest.of(currentPage, pageSize, sortObj);

        // Thực hiện tìm kiếm sản phẩm dựa trên categoryId và phân trang
        Page<Product> page = productService.findByCategoryId(id, pageable);

        model.addAttribute("listProduct", page.getContent());
        model.addAttribute("listCategory", categoryService.getAll());
        model.addAttribute("page", page);

        return "Home/home";

    }

    //    // order
    @GetMapping("checkout/add")
    public String viewAddOrder(Model model) {
        model.addAttribute("order", new Order());
        return "Manage/Order/viewAdd";
    }

    @PostMapping("checkout/add")
    public String addAccount(@ModelAttribute("order") Order order, HttpSession session, @Param("address") String address) {
        UserDTO userDTO = (UserDTO) session.getAttribute("user");
        if (userDTO == null ) {
            return "redirect:/login";
        }
        order.setCreateDate(LocalDate.now());
        order.setAddress(address);
        Optional<Account> account = accountService.findById(userDTO.getAccountName());
        if (account.isPresent()) {
            order.setAccount(account.get());
        }
        order.setOrderDetails(new ArrayList<>()); // Khởi tạo danh sách orderDetails

        orderService.save(order);

        for (ProductDTO cartItem : shoppingCartService.getItems()) {
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setOrder(order); // Thiết lập đơn hàng

            Optional<Product> product = productService.findById(cartItem.getId());
            if (product.isPresent()) {
                orderDetail.setProduct(product.get());
            }
            orderDetail.setPrice(cartItem.getPrice() * cartItem.getQty()); // Thiết lập giá
            orderDetail.setQuantity(cartItem.getQty()); // Thiết lập số lượng

            orderDetailService.save(orderDetail); // Lưu trữ thông tin orderDetail

            order.getOrderDetails().add(orderDetail); // Thêm orderDetail vào danh sách order.getOrderDetails()
        }

        orderService.save(order); // Lưu trữ thông tin order

        return "redirect:/home";
    }




}

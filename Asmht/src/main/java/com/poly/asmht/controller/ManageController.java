package com.poly.asmht.controller;

import com.poly.asmht.entity.Account;
import com.poly.asmht.entity.Category;
import com.poly.asmht.entity.Order;
import com.poly.asmht.entity.Product;
import com.poly.asmht.service.impl.AccountServiceImpl;
import com.poly.asmht.service.impl.CategoryServiceImpl;
import com.poly.asmht.service.impl.OrderDetailServiceImpl;
import com.poly.asmht.service.impl.OrderServiceImpl;
import com.poly.asmht.service.impl.ProductServiceImpl;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Optional;
import java.util.UUID;

@Controller
public class ManageController {

    public static String uploadDir = System.getProperty("user.dir") + "/src/main/resources/static/productImages";

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

    @GetMapping("/admin")
    public String adminHome(Model model) {
        return "Manage/ManageHome";
    }

    //Category

    //Page
    @GetMapping("/admin/categories")
    public String paginateCategory(Model model, @RequestParam("p") Optional<Integer> p, @RequestParam("sort") Optional<String> sort) {
        int pageSize = 5;
        int currentPage = p.orElse(0);
        Sort.Direction sortDirection = Sort.Direction.DESC;
        String sortField = sort.orElse("name");

        if (sortField == null || sortField.isEmpty()) {
            sortField = "name";
        }
        Sort sortObj = Sort.by(sortDirection, sortField);
        Pageable pageable = PageRequest.of(currentPage, pageSize, sortObj);
        Page<Category> page = categoryService.getAll(pageable);
        model.addAttribute("listCategory", page.getContent());
        model.addAttribute("page", page);

        return "Manage/Category/listCategory";
    }

    @GetMapping("/admin/categories/add")
    public String viewAddCategory(Model model) {
        model.addAttribute("category", new Category());
        return "Manage/Category/viewAdd";
    }

    @PostMapping("/admin/categories/add")
    public String addCategory(@ModelAttribute("category") Category category) {
        if (category.getId()== null || category.getId().isEmpty()){
            category.setId(UUID.randomUUID().toString().substring(5,8));
        }
            categoryService.save(category);
        return "redirect:/admin/categories";
    }

    @GetMapping("/admin/categories/delete/{id}")
    public String deleteCategory(@PathVariable String id) {
        categoryService.deleteById(id);
        return "redirect:/admin/categories";
    }

    @GetMapping("/admin/categories/update/{id}")
    public String updateCategory(@PathVariable String id, Model model) {
        Optional<Category> category = categoryService.findById(id);
        if (category.isPresent()) {
            model.addAttribute("category", category.get());
            return "Manage/Category/viewAdd";
        }
        return "redirect:/admin/categories";
    }

    //Product

    @GetMapping("/admin/products/add")
    public String viewAddProduct(Model model) {
        model.addAttribute("product", new Product());
        model.addAttribute("listCategory", categoryService.getAll());
        return "Manage/Product/viewAdd";
    }

    @PostMapping("/admin/products/add")
    public String addProduct(@ModelAttribute("product") @Valid Product product, BindingResult result,
                             @RequestParam("imageFile") MultipartFile imageFile, HttpSession session, HttpServletRequest request,
                             @RequestParam("imagName") String imagName) throws IOException {
        String imageUUID = "";
        if (!imageFile.isEmpty()) {
            imageUUID = imageFile.getOriginalFilename();
            Path fileNamAndPath = Paths.get(uploadDir, imageUUID);
            Files.write(fileNamAndPath, imageFile.getBytes());
        } else {
            imageUUID = imagName;
        }
        //Date
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyymmddhhmmss");
        LocalDateTime now = LocalDateTime.now();
        String datenow =  dtf.format(now).toLowerCase();
        product.setImage(imageUUID);
        product.setCreateDate(LocalDate.now());
        productService.save(product);
        return "redirect:/admin/products";
    }

    @GetMapping("/admin/products/delete/{id}")
    public String deleteProduct(@PathVariable int id) {
        productService.deleteById(id);
        return "redirect:/admin/products";
    }

    @GetMapping("/admin/products/update/{id}")
    public String viewUpdateProduct(@PathVariable int id, Model model) {
        Product product = productService.findById(id).get();
        model.addAttribute("listCategory", categoryService.getAll());
        model.addAttribute("product", product);
        return "Manage/Product/viewAdd";
    }
    //Page

    @GetMapping("/admin/products")
    public String paginate(Model model, @RequestParam("p") Optional<Integer> p, @RequestParam("sort") Optional<String> sort) {
        int pageSize = 5;
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
        model.addAttribute("field", sortField.toUpperCase());
        model.addAttribute("page", page);

        return "Manage/Product/listProduct";
    }


    //Account
    @GetMapping("/admin/accounts")
    public String paginateAccount(Model model, @RequestParam("p") Optional<Integer> p, @RequestParam("sort") Optional<String> sort) {
        int pageSize = 5;
        int currentPage = p.orElse(0);
        Sort.Direction sortDirection = Sort.Direction.DESC;
        String sortField = sort.orElse("fullname");

        if (sortField == null || sortField.isEmpty()) {
            sortField = "fullname";
        }
        Sort sortObj = Sort.by(sortDirection, sortField);
        Pageable pageable = PageRequest.of(currentPage, pageSize, sortObj);
        Page<Account> page = accountService.getAll(pageable);
        model.addAttribute("listAccount", page.getContent());
        model.addAttribute("field", sortField.toUpperCase());
        model.addAttribute("page", page);

        return "Manage/Account/listAccount";
    }

//    @GetMapping("/admin/accounts/add")
//    public String viewAddAccount(Model model) {
//        model.addAttribute("account", new Account());
//        return "Manage/Account/viewAdd";
//    }

    @PostMapping("/admin/accounts/add")
    public String addAccount(@ModelAttribute("account") Account account) {
        accountService.save(account);
        return "redirect:/admin/accounts";
    }

    @GetMapping("/admin/accounts/delete/{username}")
    public String deleteAccount(@PathVariable String username) {
        accountService.deleteById(username);
        return "redirect:/admin/accounts";
    }

    @GetMapping("/admin/accounts/update/{username}")
    public String updateAccount(@PathVariable String username, Model model) {
        Optional<Account> account = accountService.findById(username);
        if (account.isPresent()) {
            model.addAttribute("account", account.get());
            return "Manage/Account/viewAdd";
        }
        return "redirect:/admin/accounts";
    }

    //Orders

    @GetMapping("/admin/orders")
    public String paginateOrder(Model model, @RequestParam("p") Optional<Integer> p, @RequestParam("sort") Optional<String> sort) {
        int pageSize = 5;
        int currentPage = p.orElse(0);
        Sort.Direction sortDirection = Sort.Direction.DESC;
        String sortField = sort.orElse("address");

        if (sortField == null || sortField.isEmpty()) {
            sortField = "address";
        }
        Sort sortObj = Sort.by(sortDirection, sortField);
        Pageable pageable = PageRequest.of(currentPage, pageSize, sortObj);
        Page<Order> page = orderService.getAll(pageable);
        model.addAttribute("listOrder", page.getContent());
        model.addAttribute("field", sortField.toUpperCase());
        model.addAttribute("page", page);

        return "Manage/Order/listOrder";
    }

//    @GetMapping("/admin/orders/add")
//    public String viewAddOrder(Model model) {
//        model.addAttribute("order", new Order());
//        return "Manage/Order/viewAdd";
//    }

    @PostMapping("/admin/orders/add")
    public String addOrder(@ModelAttribute("order") Order order) {
        orderService.save(order);
        return "redirect:/admin/orders";
    }

    @GetMapping("/admin/orders/delete/{id}")
    public String deleteOrder(@PathVariable Long id,Model model) {
        orderService.deleteById(id);
        return "redirect:/admin/orders";
    }

    @GetMapping("/admin/orders/orderDetail/{id}")
    public String orderDetail(@PathVariable Long id,Model model) {
        model.addAttribute("listOrderDetail", orderDetailService.findAllByOrderId(id));
        return "Manage/OrderDetail/listOrderDetail";
    }

//    @GetMapping("/admin/orders/update/{id}")
//    public String updateOrder(@PathVariable Long id, Model model) {
//        Optional<Order> order = orderService.findById(id);
//        if (order.isPresent()) {
//            model.addAttribute("order", order.get());
//            return "Manage/Order/viewAdd";
//        }
//        return "redirect:/admin/orders";
//    }

    //home



}

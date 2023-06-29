package com.poly.asmht.controller;

import com.poly.asmht.DTO.UserDTO;
import com.poly.asmht.entity.Account;
import com.poly.asmht.entity.Order;
import com.poly.asmht.exception.UserException;
import com.poly.asmht.request.LoginRequest;
import com.poly.asmht.request.RegiterRequest;
import com.poly.asmht.service.impl.AccountServiceImpl;
import com.poly.asmht.service.impl.OrderDetailServiceImpl;
import com.poly.asmht.service.impl.OrderServiceImpl;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;
import java.util.UUID;

@Controller
public class UserController {

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private AccountServiceImpl userService;

    @Autowired
    private OrderServiceImpl orderService;

    @Autowired
    private OrderDetailServiceImpl orderDetailService;

    @Autowired
    private AccountServiceImpl accountService;

    @GetMapping("/login")
    public String showLogin(Model model) {
        model.addAttribute("loginRequest", new LoginRequest("", ""));
        return "User/login";
    }

    @PostMapping("/login")
    public String handleLogin(@Valid @ModelAttribute("loginRequest") LoginRequest loginRequest, BindingResult bindingResult, HttpSession session) {
        if (bindingResult.hasErrors()) {
            return "User/login";
        }
        Account user;
        try {
            user = userService.login(loginRequest.getAccountName(), loginRequest.getPassword());
            session.setAttribute("user", new UserDTO(user.getFullname(),user.getUsername(),user.getEmail(),(user.getAdmin())));
            return "redirect:/home";
        } catch (UserException e) {
            switch (e.getMessage()) {
                case "User is not found":
                    bindingResult.addError(new FieldError("loginRequest", "accountName", "User is not found"));
                    break;
                case "User is not active":
                    bindingResult.addError(new FieldError("loginRequest", "accountName", "User is not active"));
                    break;
                case "Password is incorrect":
                    bindingResult.addError(new FieldError("loginRequest", "password", "Password is incorrect"));
                    break;
            }
        }
        return "User/login";
    }

    @GetMapping("/register")
    public String showRegister(Model model) {
        model.addAttribute("registerRequest", new RegiterRequest("", "","",""));
        return "User/register";
    }

    @PostMapping("/register")
    public String handleRegister(@Valid @ModelAttribute("registerRequest") RegiterRequest registerRequest, BindingResult bindingResult, HttpSession session) {

        if (bindingResult.hasErrors()) {
            return "User/register";
        }
        Account user;
        try {
            user = userService.register(registerRequest.getAccountName(),registerRequest.getFullName(), registerRequest.getEmail(), registerRequest.getPassword());
            session.setAttribute("user", new UserDTO(user.getFullname(),user.getUsername() , user.getEmail(),(user.getAdmin())));

            return "User/verifyUser"; // Trả về view "User/verifyUser" nếu không có lỗi xảy ra
        } catch (Exception e) {
            switch (e.getMessage()) {
                case "Username already exists":
                    bindingResult.addError(new FieldError("registerRequest", "accountName", "Username already exists"));
                    break;
                case "Email already exists":
                    bindingResult.addError(new FieldError("registerRequest", "email", "Email already exists"));
                    break;
            }
        }

        return "User/register"; // Trả về view "User/register" nếu có lỗi xảy ra
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "redirect:/home";
    }

    @GetMapping("/verifyUser")
    public String verifyUser(Model model) {
        return "User/verifyUser";
    }

    @PostMapping("/verifyUser")
    public String handleVerifyUser(@RequestParam("verifyUser") String verifyUser, HttpSession session, Model model) {
        UserDTO userDTO = (UserDTO) session.getAttribute("user");
        try {
            userService.verifyUser(userDTO.getAccountName(), verifyUser);
            return "redirect:/login";
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
        }
        return "User/verifyUser";

    }

//    Manege Account

@GetMapping("/home/accountOrder/{id}")
public String viewAccount(@PathVariable("id") String id,Model model, @RequestParam("p") Optional<Integer> p, @RequestParam("sort") Optional<String> sort) {
    int pageSize = 5;
    int currentPage = p.orElse(0);
    Sort.Direction sortDirection = Sort.Direction.DESC;
    String sortField = sort.orElse("address");

    if (sortField == null || sortField.isEmpty()) {
        sortField = "address";
    }
    Sort sortObj = Sort.by(sortDirection, sortField);
    Pageable pageable = PageRequest.of(currentPage, pageSize, sortObj);
    Page<Order> page = orderService.findByAccountUsername(id,pageable);
    if (page.getContent().size() > 0){
        model.addAttribute("listOrder", page.getContent());
        model.addAttribute("field", sortField.toUpperCase());
        model.addAttribute("page", page);
    }


    return "Account/listOrder";
}
    @GetMapping("/home/viewAccountOrder")
    public String viewAccountOrer(Model model,HttpSession session){
        UserDTO userDTO = (UserDTO) session.getAttribute("user");
        return "redirect:/home/accountOrder/" + userDTO.getAccountName();
    }

    @GetMapping("/home/order/delete/{id}")
    public String deleteOrder(@PathVariable Long id,HttpSession session) {
        orderService.deleteById(id);
        UserDTO userDTO = (UserDTO) session.getAttribute("user");
        return "redirect:/home/accountOrder/" + userDTO.getAccountName();

    }

    @GetMapping("/home/viewAccount")
    public String viewAccount(Model model,HttpSession session){
        UserDTO userDTO = (UserDTO) session.getAttribute("user");
        Optional<Account> account = accountService.findById(userDTO.getAccountName());
        if (account.isPresent()){
            model.addAttribute("account", account.get());
            return "Account/viewAccount";
        }
        return "Account/viewAccount";

    }

    @PostMapping("/home/accounts/add")
    public String addAccount(@ModelAttribute("account") Account account,HttpSession session) {
        accountService.save(account);
        UserDTO userDTO = (UserDTO) session.getAttribute("user");
        return "redirect:/home/accountOrder/" + userDTO.getAccountName();
    }


//    @GetMapping("/home/accounts/findPassword")
//    public String findPassword(@ModelAttribute("account") Account account,HttpSession session) {
//
//        String subject = "Xác thực tài khoản của bạn";
//        String text = "Cảm ơn bạn đã đăng ký trên trang web của chúng tôi. Để hoàn tất đăng ký, vui lòng nhập mã xác thực sau đây: " + verificationCode;
//        sendEmail(user.getEmail(), subject, text);
//
//        accountService.save(account);
//        UserDTO userDTO = (UserDTO) session.getAttribute("user");
//        return "redirect:/home/accountOrder/" + userDTO.getAccountName();
//    }
    @GetMapping("/home/account/changePassword")
    public String changePassword(Model model) {

        return "Account/changePassword";
    }
    @PostMapping("/home/account/changePassword")
    public String changePassword(HttpSession session, @RequestParam("passOld") String passOld,@RequestParam("passNew") String passNew) {
        UserDTO userDTO = (UserDTO) session.getAttribute("user");
        Optional<Account> user0 = accountService.findByUsername(userDTO.getAccountName());

        if (passwordEncoder.matches(passOld, user0.get().getPassword())) {
            user0.get().setPassword(passNew);
            accountService.addUser(user0.get());
            return "redirect:/home/accountOrder/" + userDTO.getAccountName();

        }
        return "Account/changePassword";
    }

    @GetMapping("/home/account/findPassword")
    public String findPassword(Model model) {

        return "Account/findPassword";
    }
    @PostMapping("/home/account/findPassword")
    public String findPassword(HttpSession session, @RequestParam("email") String email) {

        Optional<Account> user0 = accountService.findByEmail(email);
        if (!user0.isPresent()){
            return "Account/findPassword";
        }
        String subject = "Mật khẩu của bạn";
        String pass = UUID.randomUUID().toString().substring(0, 7);
        String text = "Mật khẩu mới của bạn là: " + pass;
        accountService.sendEmail(email, subject, text);
        user0.get().setPassword(pass);
        accountService.addUser(user0.get());


        return "redirect:/login";
    }


//    @GetMapping("/home/accounts/update/{username}")
//    public String updateAccount(@PathVariable String username, Model model) {
//        Optional<Account> account = accountService.findById(username);
//        if (account.isPresent()) {
//            model.addAttribute("account", account.get());
//
//        }
//        return "Account/viewAccount";
//
//    }
}
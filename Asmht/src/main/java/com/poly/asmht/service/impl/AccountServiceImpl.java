package com.poly.asmht.service.impl;

import com.poly.asmht.entity.Account;
import com.poly.asmht.entity.State;
import com.poly.asmht.exception.UserException;
import com.poly.asmht.repository.AccountRepository;
import com.poly.asmht.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class AccountServiceImpl implements AccountService<Account> {
    @Autowired
    private AccountRepository repository;

    @Override
    public List<Account> getAll() {
        return repository.findAll();
    }




    @Override
    public void save(Account value) {
        repository.save(value);
    }

    @Override
    public void deleteById(String id) {
        repository.deleteById(id);
    }
    @Override
    public Optional<Account> findById(String id) {
        return   repository.findById(id);
    }
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private JavaMailSender mailSender;

    public Page<Account> getAll(Pageable pageable) {

        return repository.findAll(pageable);
    }

    @Override
    public Account login(String accountName, String password) {
        Optional<Account> user0 = repository.findByUsername(accountName);
        if (!user0.isPresent()) {
            throw new UserException("User is not found");
        }
        Account user = user0.get();
        if (user.getState() != State.ACTIVE) {
            throw new UserException("User is not active");
        }
        if (passwordEncoder.matches(password, user0.get().getPassword())) {
            return user0.get();

        } else {
            throw new UserException("Password is incorrect");
        }
    }

    @Override
    public boolean logout(String username) {
        return false;
    }

    private String generateVerificationCode() {
        // tạo một mã xác thực ngẫu nhiên
        return UUID.randomUUID().toString().substring(0, 6);
    }

    public void sendEmail(String to, String subject, String text) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject(subject);
        message.setText(text);
        mailSender.send(message);
    }

    @Override
    public  Account register(String accountName,String fullName, String email ,String password) {
        Optional<Account> user0 = repository.findByUsername(accountName);
        if (user0.isPresent()) {
            throw new UserException("Username already exists");
        }
        Optional<Account> user1 = repository.findByEmail(email);
        if (user1.isPresent()) {
            throw new UserException("Email already exists");
        }
        // tạo mã xác thực ngẫu nhiên
        String verificationCode = generateVerificationCode();
        // lưu mã xác thực vào cơ sở dữ liệu
        Account user = new Account();
        user.setUsername(accountName);
        user.setFullname(fullName);
        user.setEmail(email);
        user.setPassword(password);
        user.setVerificationCode(verificationCode);
        user.setState(State.PENDING);
        addUser(user);
        // gửi email xác thực
        String subject = "Xác thực tài khoản của bạn";
        String text = "Cảm ơn bạn đã đăng ký trên trang web của chúng tôi. Để hoàn tất đăng ký, vui lòng nhập mã xác thực sau đây: " + verificationCode;
        sendEmail(user.getEmail(), subject, text);
        return user;
    }

    @Override
    public void verifyUser(String accountName, String verificationCode) {
        Optional<Account> user = repository.findByUsername(accountName);
        if (user.isPresent() && user.get().getVerificationCode().equals(verificationCode)) {
            user.get().setState(State.ACTIVE);
            repository.save(user.get());
        } else {
            throw new UserException("Verification code is invalid");
        }
    }

    @Override
    public void addUser(Account user) {
        String encodedPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(encodedPassword);
        if(repository.findAll().size() < 1) {
            user.setAdmin(true);
        }
        repository.save(user);
    }

    @Override
    public void addUserThenAutoActive(Account user) {
        String encodedPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(encodedPassword);
        user.setState(State.ACTIVE);
        repository.save(user);
    }

    @Override
    public boolean activateUser(String actiation_code) {
        return false;
    }

    @Override
    public boolean updatePassword(String username, String password) {
        return false;
    }

    @Override
    public boolean updateEmail(String email, String newEmail) {
        return false;
    }

    @Override
    public Optional<Account> findByUsername(String accountName) {
        return repository.findByUsername(accountName);
    }

    @Override
    public Optional<Account> findByEmail(String emmail) {
        return repository.findByEmail(emmail);
    }
}

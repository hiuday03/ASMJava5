package com.poly.asmht.service;

import com.poly.asmht.entity.Account;

import java.util.List;
import java.util.Optional;

public interface AccountService<T> {
    List<T> getAll();

    void save(T value);

    void deleteById(String id);

    Optional<T> findById(String id);

    Account login(String accountName, String password);

    boolean logout(String accountName);

    Account register(String accountName,String fullName, String email ,String password);

    void verifyUser(String accountName, String verificationCode);

    void addUser(Account user);

    void addUserThenAutoActive(Account user);

    boolean activateUser(String actiation_code   );

    boolean updatePassword(String accountName, String password);

    boolean updateEmail(String email, String newEmail);

    Optional<Account> findByUsername(String accountName);

    Optional<Account> findByEmail(String emmail);
}

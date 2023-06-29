package com.poly.asmht.repository;

import com.poly.asmht.entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface AccountRepository extends JpaRepository<Account, String> {
    Optional<Account> findByUsername(String accountName);

    Optional<Account> findByEmail(String emmail);
}
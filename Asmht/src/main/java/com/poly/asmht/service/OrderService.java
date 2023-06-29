package com.poly.asmht.service;

import com.poly.asmht.entity.Order;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface OrderService<T> {
    List<T> getAll();

    void save(T value);

    void deleteById(Long id);

    Optional<T> findById(Long id);

    Page<Order> findByAccountUsername(String userName, Pageable pageable);

}

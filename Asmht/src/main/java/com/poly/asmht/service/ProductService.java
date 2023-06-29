package com.poly.asmht.service;

import com.poly.asmht.entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface ProductService<T> {
    List<T> getAll();

    void save(T value);

    void deleteById(int id);

    Optional<T> findById(int id);

    Page<Product> findByCategoryId(String categoryId, Pageable pageable);
}

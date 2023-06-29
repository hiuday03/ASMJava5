package com.poly.asmht.service;

import java.util.List;
import java.util.Optional;

public interface CategoryService<T> {
    List<T> getAll();

    void save(T value);

    void deleteById(String id);

    Optional<T> findById(String id);
}

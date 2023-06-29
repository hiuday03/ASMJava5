package com.poly.asmht.service;

import java.util.List;
import java.util.Optional;

public interface OrderDetailService<T> {
    List<T> getAll();

    void save(T value);

    void deleteById(Long id);

    Optional<T> findById(Long id);


}

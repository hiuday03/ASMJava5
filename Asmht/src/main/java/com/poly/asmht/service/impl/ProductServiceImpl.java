package com.poly.asmht.service.impl;

import com.poly.asmht.entity.Product;
import com.poly.asmht.repository.ProductRepository;
import com.poly.asmht.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductServiceImpl implements ProductService<Product> {
    @Autowired
    private ProductRepository repository;

    @Override
    public List<Product> getAll() {
        return repository.findAll();
    }

    public Page<Product> getAll(Pageable pageable) {
        return repository.findAll(pageable);
    }


    @Override
    public void save(Product value) {
        repository.save(value);
    }

    @Override
    public void deleteById(int id) {
        repository.deleteById(id);
    }
    @Override
    public Optional<Product> findById(int id) {
        return   repository.findById(id);
    }

    @Override
    public Page<Product> findByCategoryId(String categoryId, Pageable pageable) {
        return repository.findByCategoryId(categoryId,pageable);
    }

}

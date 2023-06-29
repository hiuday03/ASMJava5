package com.poly.asmht.service.impl;

import com.poly.asmht.entity.Category;
import com.poly.asmht.repository.CategoryRepository;
import com.poly.asmht.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CategoryServiceImpl implements CategoryService<Category> {
    @Autowired
    private CategoryRepository repository;

    @Override
    public List<Category> getAll() {
        return repository.findAll();
    }

    public List<Category> getAll(Sort sort) {
        return repository.findAll(sort);
    }

    public Page<Category> getAll(Pageable pageable) {
        return repository.findAll(pageable);
    }

    @Override
    public void save(Category value) {
        repository.save(value);
    }

    @Override
    public void deleteById(String id) {
        repository.deleteById(id);
    }
    @Override
    public Optional<Category> findById(String id) {
        return   repository.findById(id);
    }
}

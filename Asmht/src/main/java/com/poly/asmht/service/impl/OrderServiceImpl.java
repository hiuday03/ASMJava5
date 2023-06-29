package com.poly.asmht.service.impl;

import com.poly.asmht.entity.Order;
import com.poly.asmht.repository.OrderRepository;
import com.poly.asmht.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrderServiceImpl implements OrderService<Order> {
    @Autowired
    private OrderRepository repository;

    @Override
    public List<Order> getAll() {
        return repository.findAll();
    }


    public Page<Order> getAll(Pageable pageable) {
        return repository.findAll(pageable);
    }

    @Override
    public void save(Order value) {
        repository.save(value);
    }

    @Override
    public void deleteById(Long id) {
        repository.deleteById(id);
    }
    @Override
    public Optional<Order> findById(Long id) {
        return   repository.findById(id);
    }

    @Override
    public Page<Order> findByAccountUsername(String userName, Pageable pageable) {
        return repository.findByAccountUsername(userName,pageable);
    }
}

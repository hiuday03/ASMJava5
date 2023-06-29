package com.poly.asmht.service.impl;

import com.poly.asmht.entity.OrderDetail;
import com.poly.asmht.repository.OrderDetailRepository;
import com.poly.asmht.service.OrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrderDetailServiceImpl implements OrderDetailService<OrderDetail> {
    @Autowired
    private OrderDetailRepository repository;

    @Override
    public List<OrderDetail> getAll() {
        return repository.findAll();
    }

    @Override
    public void save(OrderDetail value) {
        repository.save(value);
    }

    @Override
    public void deleteById(Long id) {
        repository.deleteById(id);
    }
    @Override
    public Optional<OrderDetail> findById(Long id) {
        return   repository.findById(id);
    }

    public List<OrderDetail> findAllByOrderId(Long orderId) {
        return repository.findAllByOrderId(orderId);
    }
}

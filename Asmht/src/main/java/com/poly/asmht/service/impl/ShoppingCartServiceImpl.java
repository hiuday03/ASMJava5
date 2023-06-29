package com.poly.asmht.service.impl;

import com.poly.asmht.DTO.ProductDTO;
import com.poly.asmht.entity.Product;
import com.poly.asmht.service.ShoppingCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@SessionScope
@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {

    @Autowired
    private ProductServiceImpl productService;

    Map<Integer, ProductDTO> map = new HashMap<>();

    @Override
    public ProductDTO add(Integer id) {
        ProductDTO item = new ProductDTO();
        ProductDTO existingItem = map.get(id);
        if (existingItem == null) {
            Optional<Product> product = productService.findById(id);
            if (product.isPresent()) {
                item.setId(product.get().getId());
                item.setImage(product.get().getImage());
                item.setName(product.get().getName());
                item.setPrice(product.get().getPrice());
                item.setCategoryName(product.get().getCategory().getName());
                item.setQty(1);
                map.put(id, item);
            }
        } else {
            existingItem.setQty(existingItem.getQty() + 1);
        }
        return item;
    }


    @Override
    public void remove(Integer id) {
        map.remove(id);
    }

    @Override
    public ProductDTO update(Integer id, int qty) {
        if (map.containsKey(id)) {
            ProductDTO item = map.get(id);
            item.setQty(qty);
            return item;
        }
        return null;
    }

    @Override
    public void clear() {
        map.clear();
    }

    @Override
    public Collection<ProductDTO> getItems() {
        return map.values();
    }

    @Override
    public int getCount() {
        return map.values().stream().mapToInt(item -> item.getQty()).sum();
    }

    @Override
    public double getAmount() {
        return map.values().stream().mapToDouble(item -> item.getPrice() * item.getQty()).sum();
    }
}

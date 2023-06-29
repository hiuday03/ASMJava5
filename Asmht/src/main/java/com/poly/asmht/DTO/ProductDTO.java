package com.poly.asmht.DTO;

import lombok.Data;

@Data
        public class ProductDTO {

            private Integer id;

            private String name;

            private String image;

            private int qty = 1;

            private Double price;

            private String categoryName;

        }

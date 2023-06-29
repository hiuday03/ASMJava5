package com.poly.asmht.DTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class UserDTO {




    private String fullName;

    private String accountName;

    private String email;

    private Boolean admin;

}
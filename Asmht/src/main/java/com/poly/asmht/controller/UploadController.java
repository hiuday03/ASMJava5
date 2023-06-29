package com.poly.asmht.controller;

import jakarta.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Controller
@RequestMapping("/poly/upload")
public class UploadController {

    @Autowired
    ServletContext app;


    @GetMapping()
    public String upload() {

        return "upload/form";
    }

    @PostMapping()
    public String savefile(@RequestPart("photo") MultipartFile photo, @RequestParam("fullname") String fullname , Model model) throws IllegalStateException, IOException {

        if(!photo.isEmpty()) {

            String fileOrigionalName = photo.getOriginalFilename();

            System.out.println(fileOrigionalName);


            //Date
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyymmddhhmmss");
            LocalDateTime now = LocalDateTime.now();
            String datenow =  dtf.format(now).toLowerCase();
            File file = new File(app.getRealPath("/files/"+datenow + "_"+fileOrigionalName));

            System.out.println(file.getAbsolutePath());

            photo.transferTo(file);

            FileInputStream fis = new FileInputStream(file);

            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            byte[] buf = new byte[1024];
            try {
                for (int readNum; (readNum = fis.read(buf)) != -1;) {
                    //Writes to this byte array output stream
                    bos.write(buf, 0, readNum);
                    System.out.println("read " + readNum + " bytes,");
                }
            } catch (IOException ex) {
                // Logger.getLogger(ConvertImage.class.getName()).log(Level.SEVERE, null, ex);
            }
            byte[] bytes = bos.toByteArray();

            byte[] encodeBase64 = java.util.Base64.getEncoder().encode(bytes);

            String base64Encoded = new String(encodeBase64, "UTF-8");

            model.addAttribute("fullname", fullname);
            model.addAttribute("base64Encoded", file);
        }
        return "upload/displayimage";
    }
}

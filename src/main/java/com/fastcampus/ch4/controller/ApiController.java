//package com.fastcampus.ch4.controller;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import java.util.Map;
//
//
//@Controller
//@RequestMapping("/api")
//public class ApiController {
//
//    @PostMapping("/saveAddressData")
//    @ResponseBody
//    public String saveAddressData(@RequestBody Map<String, Object> requestData) {
//        // data 전체가 Map 형태로 전달됩니다.
//        Map<String, Object> data = (Map<String, Object>) requestData.get("data");
//
//        // 필요한 작업 수행
//        System.out.println("건물 코드: " + data.get("buildingCode"));
//
//        // 응답
//        return "{\"result\":\"success\"}";
//    }
//}
//

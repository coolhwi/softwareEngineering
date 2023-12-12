package com.fastcampus.ch4.controller;

import com.fastcampus.ch4.domain.BuildingDto;
import com.fastcampus.ch4.domain.BuildingInfo;
import com.fastcampus.ch4.service.BuildingService;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Map;

@Controller
public class BuildingController {
    BuildingInfo buildingInfo = new BuildingInfo();

    @Autowired
    BuildingService buildingService;

    @PostMapping("/api/saveAddressData")
    public String showBuildingInfo(@RequestBody Map<String, Object> requestData, Model model) {
        // 전달된 데이터에서 필요한 정보 추출
        Map<String, Object> data = (Map<String, Object>) requestData.get("data");
        String buildingCode = (String) data.get("buildingCode");
        String address = (String) data.get("address");

        System.out.println(buildingCode);
        System.out.println(address);

        buildingInfo.setBuildingCode(buildingCode);
        buildingInfo.setAddress(address);

        System.out.println("asdfsadf");

        return "buildingInfoPage";
    }

    @GetMapping("/buildingInfoPage")
    public String goBuildingInfoPage(Model m) throws Exception {
        BuildingDto buildingDto = null;
        try {
            buildingDto = buildingService.getBuildingInfo(buildingInfo.getBuildingCode());
            m.addAttribute("buildingPrice", buildingDto.getBuildingPrice());
            m.addAttribute("address", buildingDto.getBuildingAdress());
            m.addAttribute("material", buildingDto.getBuildingMaterial());
        } catch (Exception e) {
            m.addAttribute("buildingPrice","정보 없음");
            m.addAttribute("address",buildingInfo.getAddress());
            m.addAttribute("material", "정보없음");
            return "buildingInfoPage";
        }


//        if(buildingDto.equals(null)){
//            m.addAttribute("buildingPrice","정보 없음");
//            m.addAttribute("address",buildingInfo.getAddress());
//            m.addAttribute("material", "정보없음");
//        }else{
//            m.addAttribute("buildingPrice", buildingDto.getBuildingPrice());
//            m.addAttribute("address", buildingDto.getBuildingAdress());
//            m.addAttribute("material", buildingDto.getBuildingMaterial());
//        }
//        System.out.println(buildingDto.getBuildingPrice());
//        System.out.println(buildingDto.getBuildingAdress());



        return "buildingInfoPage";
    }

}
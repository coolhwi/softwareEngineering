package com.fastcampus.ch4.service;

import com.fastcampus.ch4.domain.BuildingDto;

public interface BuildingService {
    BuildingDto getBuildingInfo(String buildingNum) throws Exception;
}

package com.fastcampus.ch4.dao;

import com.fastcampus.ch4.domain.BuildingDto;

public interface BuildingDao {
    BuildingDto select(String buildingNum);
}

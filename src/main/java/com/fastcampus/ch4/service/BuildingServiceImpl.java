package com.fastcampus.ch4.service;

import com.fastcampus.ch4.dao.BuildingDao;
import com.fastcampus.ch4.domain.BuildingDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BuildingServiceImpl implements BuildingService {
    @Autowired
    BuildingDao buildingDao;

    public BuildingDto getBuildingInfo(String buildingNum) throws Exception{
        return buildingDao.select(buildingNum);
    }
}

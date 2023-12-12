package com.fastcampus.ch4.dao;

import com.fastcampus.ch4.domain.BuildingDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})

public class BuildingDaoImplTest {
    @Autowired
    BuildingDao buildingDao;

    @Test
    public void select() {
        assertTrue(buildingDao != null);
        System.out.println("buildingDao = " + buildingDao);
        BuildingDto buildingDto= buildingDao.select("1162010200105350027007583");
        System.out.println("buildingDto = " + buildingDto.getBuildingAdress());
        assertTrue(buildingDto.getBuildingNum().equals("1162010200105350027007583"));
    }
}
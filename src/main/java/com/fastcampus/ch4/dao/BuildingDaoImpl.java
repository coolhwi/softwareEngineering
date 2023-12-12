package com.fastcampus.ch4.dao;

import com.fastcampus.ch4.domain.BuildingDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BuildingDaoImpl implements BuildingDao {

    @Autowired
    SqlSession session;
    private static String namespace = "com.fastcampus.ch4.dao.BuildingMapper.";
    @Override
    public BuildingDto select(String buildingNum){
        return session.selectOne(namespace+"select",buildingNum);
    }
}

package com.fastcampus.ch4.domain;

public class BuildingInfo {
    private String address;

    private String buildingCode;


    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getBuildingCode() {
        return buildingCode;
    }

    public void setBuildingCode(String buildingCode) {
        this.buildingCode = buildingCode;
    }


    @Override
    public String toString() {
        return "BuildingInfo{" +
                "address='" + address + '\'' +
                ", buildingCode='" + buildingCode + '\'' +
                '}';
    }
}

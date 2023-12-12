package com.fastcampus.ch4.domain;

public class BuildingDto {
    private String buildingNum;
    private String buildingAdress;
    private Integer buildingPrice;
    private String buildingMaterial;

    public BuildingDto(){}
    public BuildingDto(String buildingNum, String buildingAdress, Integer buildingPrice,String buildingMaterial) {
        this.buildingNum = buildingNum;
        this.buildingAdress = buildingAdress;
        this.buildingPrice = buildingPrice;
        this.buildingMaterial = buildingMaterial;
    }

    public String getBuildingNum() {
        return buildingNum;
    }

    public void setBuildingNum(String buildingNum) {
        this.buildingNum = buildingNum;
    }

    public String getBuildingAdress() {
        return buildingAdress;
    }

    public void setBuildingAdress(String buildingAdress) {
        this.buildingAdress = buildingAdress;
    }

    public Integer getBuildingPrice() {
        return buildingPrice;
    }

    public void setBuildingPrice(Integer buildingPrice) {
        this.buildingPrice = buildingPrice;
    }

    public String getBuildingMaterial() {
        return buildingMaterial;
    }

    public void setBuildingMaterial(String buildingMaterial) {
        this.buildingMaterial = buildingMaterial;
    }
}

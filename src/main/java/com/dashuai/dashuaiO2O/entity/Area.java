package com.dashuai.dashuaiO2O.entity;

import java.util.Date;

/**
 * Created by wangyishuai on 2018/9/1
 * 商家区域实体
 */
public class Area {
    private Integer areaId; // 参考阿里 Java 开发手册，防止拆箱的空指针问题，而且不希望为其添加默认值，可以设置为 null
    private String areaName;
    private Integer priority; // 权重，越大越排前显示
    private Date createTime;
    private Date updateTime;

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}

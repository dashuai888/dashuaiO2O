package com.dashuai.dashuaiO2O.service;

import com.dashuai.dashuaiO2O.BaseTest;
import com.dashuai.dashuaiO2O.entity.Area;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.Assert.assertEquals;

/**
 * Created by wangyishuai on 2018/9/2
 */
public class AreaServiceTest extends BaseTest {
    @Autowired
    private AreaService areaService;

    @Test
    public void testGetAreaList() {
        List<Area> areaList = areaService.getAreaList();
        assertEquals("北京市昌平区回龙观", areaList.get(0).getAreaName());
    }
}

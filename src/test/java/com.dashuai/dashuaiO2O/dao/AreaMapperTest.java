package com.dashuai.dashuaiO2O.dao;

import com.dashuai.dashuaiO2O.BaseTest;
import com.dashuai.dashuaiO2O.entity.Area;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.Assert.assertEquals;

/**
 * Created by wangyishuai on 2018/9/2
 */
public class AreaMapperTest extends BaseTest {
    @Autowired
    private AreaMapper areaMapper;

    @Test
    public void testQueryArea() {
        List<Area> areaList = areaMapper.queryArea();
        assertEquals(1, areaList.size());
    }
}

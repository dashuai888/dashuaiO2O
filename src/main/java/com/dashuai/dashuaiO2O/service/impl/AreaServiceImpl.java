package com.dashuai.dashuaiO2O.service.impl;

import com.dashuai.dashuaiO2O.dao.AreaMapper;
import com.dashuai.dashuaiO2O.entity.Area;
import com.dashuai.dashuaiO2O.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by wangyishuai on 2018/9/2
 */
@Service
public class AreaServiceImpl implements AreaService {

    @Autowired
    private AreaMapper areaMapper;

    @Override
    public List<Area> getAreaList() {
        return areaMapper.queryArea();
    }
}

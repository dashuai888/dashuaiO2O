package com.dashuai.dashuaiO2O.web.admin;

import com.dashuai.dashuaiO2O.entity.Area;
import com.dashuai.dashuaiO2O.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wangyishuai on 2018/9/2
 */
@RestController
@RequestMapping("/admin")
public class AreaController {
    @Autowired
    private AreaService areaService;

    @RequestMapping(method = RequestMethod.GET, value = "/listarea")
    public Map<String, Object> listArea() {
        Map<String, Object> modelMap = new HashMap<>();
        List<Area> areaList;
        try {
            areaList = areaService.getAreaList();
            modelMap.put("rows", areaList);
            modelMap.put("total", areaList.size());
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.put("success", false);
            modelMap.put("errMsg", e.toString());
        }

        return modelMap;
    }
}

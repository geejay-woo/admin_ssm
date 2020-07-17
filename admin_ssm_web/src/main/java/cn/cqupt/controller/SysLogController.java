package cn.cqupt.controller;

import cn.cqupt.domain.SysLog;
import cn.cqupt.service.ISysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("sysLog")
public class SysLogController {

    @Autowired
    private ISysLogService sysLogService;

    @RequestMapping("findAll.do")
    public ModelAndView findAll() throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("syslog-list");
        List<SysLog> loglist = sysLogService.findAll();
        mv.addObject("sysLogs",loglist);
        return mv;
    }
}

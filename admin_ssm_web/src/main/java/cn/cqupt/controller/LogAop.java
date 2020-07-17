package cn.cqupt.controller;

import cn.cqupt.domain.SysLog;
import cn.cqupt.service.ISysLogService;
import net.sf.jsqlparser.statement.select.Join;
import org.aopalliance.intercept.Joinpoint;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.util.Date;

@Component
@Aspect
public class LogAop {

    @Autowired
    private ISysLogService sysLogService;

    @Autowired
    private HttpServletRequest request;

    //开始的时间
    private Date visitDate;
    //访问的类
    private Class clazz;
    //访问的方法
    private Method method;

    @Before("execution(* cn.cqupt.controller.*.*(..))")
    public void doBefore(JoinPoint jp) throws NoSuchMethodException {

        visitDate = new Date();//开始时间
        clazz = jp.getTarget().getClass();//要访问的类
        //获取方法
        String methodName = jp.getSignature().getName();//访问方法的名字
        Object[] args = jp.getArgs();//访问方法的参数
        if(args==null||args.length==0){
            method = clazz.getMethod(methodName);
        }else {
            //有参数
            Class[] parameterTypes = new Class[args.length];
            for(int i = 0; i<args.length; i++){
                parameterTypes[i] = args[i].getClass();
            }
            method = clazz.getMethod(methodName,parameterTypes);
        }
    }

    @After("execution(* cn.cqupt.controller.*.*(..))")
    public void doAfter(JoinPoint jp) throws Exception {
        long time = new Date().getTime()-visitDate.getTime();//获取执行时间

        //获取url
        String url = null;
        if(clazz!=null&&method!=null&&clazz!=LogAop.class){
            RequestMapping clazzAnnotation = (RequestMapping) clazz.getAnnotation(RequestMapping.class);
            if(clazzAnnotation!=null){
                String[] clazzValue = clazzAnnotation.value();
                RequestMapping methodAnnotation = method.getAnnotation(RequestMapping.class);
                if(methodAnnotation!=null){
                    String[] methodValue = methodAnnotation.value();
                    url = clazzValue[0]+methodValue[0];
                    //获取IP地址
                    String ip = request.getRemoteAddr();

                    //获取当前操作的对象
                    SecurityContext context = SecurityContextHolder.getContext();
                    User user = (User) context.getAuthentication().getPrincipal();
                    String username = user.getUsername();

                    //将日志信息封装
                    SysLog sysLog = new SysLog();
                    sysLog.setExecutionTime(time); //执行时长
                    sysLog.setIp(ip);
                    sysLog.setMethod("[类名] " + clazz.getName() + "[方法名] " + method.getName());
                    sysLog.setUrl(url);
                    sysLog.setUsername(username);
                    sysLog.setVisitTime(visitDate);

                    sysLogService.save(sysLog);
                }
            }
        }

    }

}

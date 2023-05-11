package com.mavenN.MavenNDepartmentStoreWebsite.models.services.articleAOP;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component	
public class BadWordsAspect {
//	 com.mavenN.MavenNDepartmentStoreWebsite.models.services.forum
    @Pointcut("execution(* com.mavenN.MavenNDepartmentStoreWebsite.controllers.forum.*.*(..))")
    public void pointCut() {}
    
   
    /**
     * 在方法執行前進行敏感詞過濾
     */
    @Around("pointCut()")
    public Object around(ProceedingJoinPoint joinPoint) throws Throwable {
        Object[] args = joinPoint.getArgs();
        if (args != null && args.length > 0) {
            for (int i = 0; i < args.length; i++) {
                Object arg = args[i];
                if (arg instanceof String) {
                    String content = (String) arg;
                    for (String word : BadWords.words) {
                        content = content.replaceAll(word, "******");
                        System.out.println("敏感字过滤");
                    }
                    args[i] = content;
                }
            }
        }

        return joinPoint.proceed(args);
    }
    
    

    
}

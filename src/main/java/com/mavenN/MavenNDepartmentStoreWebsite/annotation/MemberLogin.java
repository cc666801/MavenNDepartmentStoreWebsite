package com.mavenN.MavenNDepartmentStoreWebsite.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)//何時會跑
@Target(ElementType.METHOD)//目標哪裡可以使用
public @interface MemberLogin {

}

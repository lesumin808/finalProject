/*
 * package com.haeyo.biz.aop;
 * 
 * import org.aspectj.lang.annotation.Aspect; import
 * org.aspectj.lang.annotation.Before; import
 * org.springframework.stereotype.Component;
 * 
 * import lombok.extern.log4j.Log4j;
 * 
 * @Aspect //해당 클래스가 Aspect를 구현한 것임을 나타냄
 * 
 * @Log4j
 * 
 * @Component //스프링에서 bean객체로 인식하기 위함 public class LogAdvice {
 * 
 * @Before("execution(* com.haeyo.biz.profession*.*(..))") public void
 * logBefore() { log.info("===================="); } }
 */
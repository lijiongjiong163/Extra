package com.ljj.demo2;

/**
 * 将父母组合进娃对象里
 */
public class Child {
    private Dad dad=new Dad();
    private Mum mum=new Mum();
    public void wakeUp() {
        dad.doSomething();
        mum.doSomething();
    }
}
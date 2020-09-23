package com.ljj.demo3;

import java.util.ArrayList;

/**
 * 把所有Observer放进list中，再提供add和remove方法
 */
public class Child {
    private ArrayList<Observer> observerList = new ArrayList();

    /**
     * 宝宝醒了，就遍历一下观察者list，把所有人都叫一下
     */
    public void wakeUp() {
        for (Observer observer : observerList) {
            observer.doSomething();
        }
    }
    public void addObserver(Observer observer){
        observerList.add(observer);
    }
    public void removeObservers(Observer observer){
        observerList.remove(observer);
    }

}
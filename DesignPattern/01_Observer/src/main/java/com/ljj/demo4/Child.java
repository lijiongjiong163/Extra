package com.ljj.demo4;



import java.util.ArrayList;

/**
 * 当然事件源类也可以抽象出它的父类Source，这样Event封装事件源的时候就可以封装多种事件源啦
 */
public class Child {
    private ArrayList<Observer> observerList = new ArrayList();


    public void wakeUp() {
        //创建事件对象，把一些相关信息放进去
        WakeUpEvent wakeUpEvent = new WakeUpEvent(System.currentTimeMillis(),"bed","loud",this);
        for (Observer observer : observerList) {
            observer.doSomething(wakeUpEvent);
        }
    }
    public void addObserver(Observer observer){
        observerList.add(observer);
    }
    public void removeObservers(Observer observer){
        observerList.remove(observer);
    }

}
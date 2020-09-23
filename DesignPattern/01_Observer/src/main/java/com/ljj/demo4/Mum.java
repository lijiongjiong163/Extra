package com.ljj.demo4;


public class Mum implements Observer {
    public void doSomething(WakeUpEvent wakeUpEvent)  {

            System.out.println("宝宝哭声"+wakeUpEvent.voice);

        hug();
    }
    private void hug(){
        System.out.println("宝宝哭了，快抱抱他。。。。");
    }
}

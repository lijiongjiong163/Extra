package com.ljj.demo4;



public class Dad implements Observer {
    public void doSomething(WakeUpEvent wakeUpEvent)  {
        System.out.println("宝宝在"+wakeUpEvent.time+"醒啦");
        hit();
    }
    private void hit(){
        System.out.println("宝宝哭了，快打他。。。。");
    }

}

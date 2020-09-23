package com.ljj.demo3;

public class Mum implements Observer{
    public void doSomething()  {
        {
            System.out.println("妈妈在看，宝宝在睡觉。。。");
        }
        hug();
    }
    private void hug(){
        System.out.println("宝宝哭了，快抱抱他。。。。");
    }
}

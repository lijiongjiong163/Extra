package com.ljj.demo3;

public class Dad implements Observer{
    public void doSomething()  {
       {
            System.out.println("爸爸在看，宝宝在睡觉。。。");
        }
        hit();
    }
    private void hit(){
        System.out.println("宝宝哭了，快打他。。。。");
    }

}

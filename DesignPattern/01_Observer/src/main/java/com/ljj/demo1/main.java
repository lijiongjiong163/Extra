package com.ljj.demo1;

import java.util.Random;

public class main {
    public static void main(String[] args) throws InterruptedException {
        Child child = new Child();
        //创建爸爸对象,需要把孩子对象聚合进去，并一直查看其状态
        Dad dad = new Dad(child);
        //创建妈妈对象
        Mum mum = new Mum(child);
        //整两个线程，就是爸爸和妈妈，都来监视这个娃
        Thread thread1 = new Thread(new Runnable() {

            @Override
            public void run() {
                try {
                    dad.watch();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        });
        Thread thread2 = new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    mum.watch();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        });
        thread1.start();
        thread2.start();
        //娃的睡觉时长
        int i = new Random().nextInt(10)*500+3000;
        System.out.println(i);
        Thread.sleep(i);
        //睡了一个随机数以后，醒了
        child.setStatus("wakeup");
    }

}
class Child {
    //娃的状态，一开始在睡觉
    private String status = "sleep";

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}

/**
 * 爸爸
 */
class Dad{
    //聚合了娃
    private Child child;
    Dad(Child c){
        this.child=c;
    }


    public void watch() throws InterruptedException {
        while (child.getStatus()=="sleep"){
            System.out.println("爸爸在看，宝宝在睡觉。。。");
            Thread.sleep(1000);
        }
         hit();
    }
    private void hit(){
        System.out.println("宝宝哭了，快打他。。。。");
    }
}

/**
 * 妈妈
 */
class Mum{
    Mum(Child c){
        this.child=c;
    }
    private Child child;
    public void watch() throws InterruptedException {
        while (child.getStatus()=="sleep"){
            System.out.println("妈妈在看，宝宝在睡觉。。。");
            Thread.sleep(1700);
        }
        hug();
    }
    private void hug(){
        System.out.println("宝宝哭了，快抱抱他。。。。");
    }
}
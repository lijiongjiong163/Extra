package com.ljj.demo3;

public class main {
    public static void main(String[] args) {
        Child child = new Child();
        child.addObserver(new Dad());
        child.addObserver(new Mum());
        child.wakeUp();
    }
}

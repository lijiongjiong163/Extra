package com.ljj.demo4;

/**
 * 醒了这个事件的对象,这里将这个事件抽象出来单独作一个类。
 *  如果有多个事件，也可以抽象出父类Event，这样观察者们就可以观察多种事件了
 */
public class WakeUpEvent {
    //醒的时间
    long time;
    //醒的地点（床上，地上？）
    String loc;
    //哭的声音大小
    String voice;
    //事件源对象
    Child Source;

    public WakeUpEvent(long time, String loc,String voice,Child source) {
        this.time = time;
        this.loc = loc;
        this.voice = voice;
        this.Source = source;
    }

    public Child getSource() {
        return Source;
    }
}

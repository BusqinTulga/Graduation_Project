package com.learning.people_test;

public class People {
    int age = 23;
    void getAge() {
        System.out.println("getAge:" + age);
    }

    public static void main(String[] args) {
        People tutu = new People();
        tutu.getAge();
    }
}
package com.learning.people_test;

public class People2 {
    int age = 23;
    People2(int a) {
        this.age = a;
    }

    void getAge() {
        System.out.println("getAge:" + age);
    }

    public static void main(String[] args) {
        People2 tutu = new People2(2);
        tutu.getAge();
    }
}
package com.learning.employee_test;

 class Employee {
     String name;
    int age;
    double salary;

    Employee(String name) {
        this.name = name;
    }

    void empAge(int empAge) {
        age = empAge;
    }

    void empSalary(int empSalary) {
        salary = empSalary;
    }

    void printEmployee() {
        System.out.println("名字：" + name);
        System.out.println("年龄：" + age);
        System.out.println("工资：" + salary);
    }
}

public class EmployeeTest {
    public static void main(String[] args) {
    Employee emp1 = new Employee("1号");
    Employee emp2 = new Employee("2号");

    emp1.empAge(24);
    emp1.empSalary(3000);
    emp1.printEmployee();

    emp2.empAge(35);
    emp2.empSalary(16000);
    emp2.printEmployee();
    }
}
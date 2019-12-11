package papi_test;

public class Papi2 {
    int PapiAge;
    String name = "papi";
    int age = 15;
    Papi2( int age,String name ) {
        System.out.println("她的名字是：" + name);
    }

    void setAge() {
        PapiAge = age;
    }

    void getAge() {
        System.out.println("她的年龄为：" + PapiAge);
    }

    public static void main(String[] args) {
        Papi2 hiPapi = new Papi2(10, "wb");
        hiPapi.setAge();
        hiPapi.getAge();
        System.out.println("她的年龄为：" + hiPapi.PapiAge);
    }
}
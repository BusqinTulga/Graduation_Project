package papi_test;

public class Papi {
    int PapiAge;
    Papi(String name) {
        System.out.println("她的名字是：" + name);
    }

    void setAge(int age) {
        PapiAge = age;
    }

    void getAge() {
        System.out.println("她的年龄为：" + PapiAge);
    }

    public static void main(String[] args) {
        Papi hiPapi = new Papi("Papi");
        hiPapi.setAge(15);
        hiPapi.getAge();
        System.out.println("她的年龄为：" + hiPapi.PapiAge);
    }
}
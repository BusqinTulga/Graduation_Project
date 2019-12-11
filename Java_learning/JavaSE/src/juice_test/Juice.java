package juice_test;

class Juice {
    enum JuiceSize {big, middle, small};
    JuiceSize size;
}

class JuiceTest {
    public static void main(String[] args) {
        Juice juice = new Juice();
        juice.size = Juice.JuiceSize.big;
    }
}
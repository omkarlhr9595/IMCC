abstract class AbstractClass {

    void print1() {
        System.out.println("In print1 method");
    }

    abstract void print2();

}

class Child extends AbstractClass {

    void print2() {
        System.out.println("In print2 method");
    }

    public static void main(String[] args) {

        new Child().print1();
        new Child().print2();

    }

}
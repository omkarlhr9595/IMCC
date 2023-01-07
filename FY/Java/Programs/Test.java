class Test {

    void print() {
        System.out.println("lol");
    }
}

/**
 * B
 */
class B extends Test {
    void print() {
        System.err.println("lol2");
    }

    public static void main(String[] args) {
        new B().print();
    }
}
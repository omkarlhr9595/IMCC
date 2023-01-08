class Parent {

    void building() {
        System.out.println("One floor Building");
    }

}

class Child1 extends Parent {

    void building() {
        System.out.println("Two floor Building");
    }

    void owner() {
        System.out.println("Owner method");
    }

    public static void main(String[] args) {

        /*
         * Child c = new Child();
         * c.building();
         * c.owner();
         */

        Parent p = new Child1();
        p.building();

        /*
         * p.owner(); this will not work
         */

        Child1 c = (Child1) p; // Object Typecasting

        c.building();
        c.owner();

    }

}

/*
 * Output :
 * Two floor Building
 * Two floor Building
 * Owner method
 * 
 */
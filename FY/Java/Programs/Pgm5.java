class OuterClass {

    // Instance variable of Outer class
    int var1 = 10;

    class InnerClass {

        // Instance variable of Inner class
        int var1 = 100;

        void print() {

            System.out.println("In Inner class");

            // Accessing Inner class variable
            System.out.println(this.var1);

            // Accessing Outer class variable by classname
            System.out.println(OuterClass.this.var1);

        }

    }

    public static void main(String[] args) {

        // Outer class obj
        OuterClass o = new OuterClass();

        // Inner class obj using outer class obj
        OuterClass.InnerClass i = o.new InnerClass();

        // Accessing Outer class variable
        System.out.println(o.var1);

        // Accessing Inner class variable and method
        System.out.println(i.var1);
        i.print();

    }

}

/*
 * Output :
 * 10
 * 100
 * In Inner class
 * 100
 * 10
 * 
 */
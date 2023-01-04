class ConstructorClass {

    /*
     * default Constructor only gets called if programmer does not write any type
     * constructor in class
     */

    // 0 args Constructor
    ConstructorClass() {
        System.out.println("0 args Constructor got called");
    }

    ConstructorClass(int roll_no, String name) {
        System.out.println("Parameterized Constructor got called");
        System.out.println(roll_no + " " + name);
    }

    public static void main(String[] args) {

        // 0 args Constructor will be called
        new ConstructorClass();

        // Parameterized Constructor will be called of same signature
        new ConstructorClass(2201112, "Omkar");
    }

}

/*
 * Output :
 * 0 args Constructor got called
 * Parameterized Constructor got called
 * 2201112 Omkar
 * 
 */
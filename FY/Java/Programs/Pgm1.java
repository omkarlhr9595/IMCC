class InstanceVariables {

    // These are instace variables declared within class but outside method
    int roll_no = 2201112;
    String name = "Omkar Lohar";

    public static void main(String[] args) {

        InstanceVariables obj = new InstanceVariables();

        /*
         * To access instace variable in main method we have to create an object of
         * class
         */
        System.out.println(obj.roll_no + " " + obj.name);

    }
}

/*
 * Output :
 * 2201112 Omkar Lohar
 * 
 */
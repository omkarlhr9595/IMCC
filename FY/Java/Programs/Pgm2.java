class StaticVariables {
    
    //These are static variables
    static int roll_no = 2201112;
    static String name = "Omkar Lohar";

    public static void main(String[] args) {

        //To access static variable in main method we don't have create any object of class
        //we can access these variable via classname only
        //staic varible will have only 1 memory allocations for all the objects
        System.out.println(StaticVariables.roll_no+" "+StaticVariables.name);    

    }

}

/*
 * Output :
 * 2201112 Omkar Lohar
 * 
 */
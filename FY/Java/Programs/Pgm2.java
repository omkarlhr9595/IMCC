class Pgm2 {
    
    //These are static variables
    static int roll_no = 2201112;
    static String name = "Omkar Lohar";

    public static void main(String[] args) {

        //To access static variable in main method we don't have create any object of class
        //we can access these variable via classname only
        //staic varible will have only 1 memory allocations for all the objects
        System.out.println(Pgm2.roll_no+" "+Pgm2.name);    

    }

}

/*
 * Output :
 * 2201112 Omkar Lohar
 * 
 */
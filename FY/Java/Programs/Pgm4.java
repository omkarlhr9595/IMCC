class ThisKeyword {

    int var1 = 10;
    int var2 = 20;

    /*
     * If local variables and instance have same name we can use this keyword to
     * access instance variable in method
     */
    void print(int var1, int var2) {
        System.out.println("Local variable " + var1 + " " + var2);
        System.out.println("Instance variable " + this.var1 + " " + this.var2);
    }

    public static void main(String[] args) {
        new ThisKeyword().print(100, 200);
    }

}

/*
 * Output :
 * Local variable 100 200
 * Instance variable 10 20
 * 
 */
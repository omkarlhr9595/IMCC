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

    /*
     * this keyword can also be used to call another in a constructor
     */

    // 0 args constructor
    ThisKeyword() {
        this(10, 20);
    }

    // paramaterized constructor
    ThisKeyword(int a, int b) {
        System.out.println("constructor called by this keyword");
    }

    public static void main(String[] args) {
        new ThisKeyword().print(100, 200);
    }

}

/*
 * Output :
 * constructor called by this keyword
 * Local variable 100 200
 * Instance variable 10 20
 * 
 */
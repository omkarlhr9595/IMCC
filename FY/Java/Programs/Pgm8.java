class ConstructorOverloading {

    int num1, num2, num3;

    ConstructorOverloading(int num1, int num2) {
        this.num1 = num1;
        this.num2 = num2;

        System.out.println(this.num1 + " " + this.num2);
    }

    ConstructorOverloading(int num1, int num2, int num3) {
        this.num1 = num1;
        this.num2 = num2;
        this.num3 = num3;

        System.out.println(this.num1 + " " + this.num2 + " " + this.num3);
    }

    public static void main(String[] args) {

        new ConstructorOverloading(1, 2);
        new ConstructorOverloading(1, 2, 3);
    }

}

/*
 * Output :
 * 1 2
 * 1 2 3
 * 
 */
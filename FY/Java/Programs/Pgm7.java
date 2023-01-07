class MethodOverloading {

    // Addition function with 2 parameter
    int add(int num1, int num2) {
        return num1 + num2;
    }

    // Addition function with 3 parameter
    int add(int num1, int num2, int num3) {
        return num1 + num2 + num3;
    }

    public static void main(String[] args) {

        int additionOf2 = new MethodOverloading().add(12, 12);
        System.out.println(additionOf2);

        int additionOf3 = new MethodOverloading().add(12, 12, 12);
        System.out.println(additionOf3);

    }

}

/*
 * Output :
 * 24
 * 36
 * 
 */
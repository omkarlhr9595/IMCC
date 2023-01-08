interface If1 {

    void print();

}

interface If2 {

    void print();

}

// This class implements 2 interfaces
class Interfaces implements If1, If2 {

    public void print() {

        System.out.println("Good Morning");

    }

    public static void main(String[] args) {

        new Interfaces().print();

    }

}

/*
 * Output :
 * Good Morning
 * 
 */
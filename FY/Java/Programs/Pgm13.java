class Age {
    int x = 21;

    public void getAge() {
        System.out.println("Age");
    }
}

class A {

    public static void main(String[] args) {

        Age a = new Age() {
            public void getAge() {
                System.out.println(x);
            }
        };

        a.getAge();

    }

}
interface Age {

    int x = 21;

    void getAge();

}

class A {

    public static void main(String[] args) {
        Age a = new Age() {

            @Override
            public void getAge() {
                // TODO Auto-generated method stub
                System.out.println(x);

            }

        };

        a.getAge();
    }
}
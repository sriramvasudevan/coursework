class test16 {
    public static void main(String[] a) {
        System.out.println(new Test().start());
    }
}

class Test {

    int i;

    public int start() {

        Test test;
        int temp;

        test = new Test();

        i = 10;

        temp = ((test.first()).second());
        i = i + temp;

        return i;
    }

    public Test first() {

        return new Test();

    }

    public int second() {

        System.out.println(i);
        i = i + 10;
        System.out.println(i);

        return i;
    }
}

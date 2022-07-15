package other;


class Student1 extends Person {
    String school;
    int score;

    void sayHello(Student1 another) {
        System.out.println("Hi!");
        if (school.equals(another.school)) {
            System.out.println(" Shoolmates ");
        }
    }

    boolean isGoodStudent() {
        return score >= 90;
    }

    @Override
    void sayHello() {
        super.sayHello();//应输出："Hello! My name is " + name
        System.out.println("My school is " + school);
    }

    Student1(String name, int age, String school) {
        super(name, age);
        this.school = school;
    }

    void testThisAndSuper() {
        int a;
        a = age;
        a = this.age;
        a = super.age;
    }

    public static void main(String[] arggs) {
        Person p = new Person("Liming", 50);
        Student1 s = new Student1("Wangqiang", 20, "PKU");
        Person p2 = new Student1("Zhangyi", 18, "THU");
        Student1 s2 = (Student1) p2;
        p.sayHello(s);

        // Student s3 = (Student) p; //runtime exception


/*        Person[] manypeople = new Person[100];
        manypeople[0] = new Person("Li", 18);
        manypeople[1] = new Student1("Wang", 18, "PKU");*/
    }
}

package other;

public class Student { //方法名要和类名相同
    Student(String name,int age){
        System.out.println("我的身份是:"+name+","+age);
    }
    Student(int high){ //构造方法重载
        System.out.println("我的身高是:"+high+"cm");
    }

    public static void main(String args[]){
        Student student = new Student("大帅比",18);
        Student high = new Student(180);
    }
}

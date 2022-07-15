package other;

public class Dog {
    //方法例子
    static void add(int i,int j) //定义方法i,j是形参
    {
        System.out.println(i+j);
    }
     void add(int i,int j,int k) //方法重载
    {
        System.out.println(i+j+k);
    }
    /**public other.Dog(String m) //构造函数用public
    {
        System.out.println(m);
    }
     */

    //面向对象例子
    String name; //创建类属性,注意在main之外

    public static void main(String[] args) //尽量让main只负责执行
    {
        Dog d = new Dog(); //调用构造函数,可以把它看成和类名相同的方法
        d.name="lgy";
        System.out.println(d.name);

        Dog k = new Dog(); //非static方法需要new后才能访问
        //调用方法
        add(1,2); //1,2是实参
        k.add(1,2,3);
        /**
         类中使用数组
         */
        Dog[] a = new Dog[3]; //新建数组
        for (int c=0;c< 3;c++) //for循环实例化
        {
            a[c] = new Dog();
        }
        a[0].name = "sz";
        a[1].name = "lgy";
        a[2].name = "lgy1";
        for (int x=0;x< a.length;x++)
        System.out.println(a[x].name);
    }
}

package expception;

class Demo extends Exception //新建一个自定义的异常类
{
    public Demo(String message)
    {
        super(message);
    }
}

public class xiti3 {
    public static void main(String args[]) {
        try {
            int a=-10;
            if (a < 0)
                throw new Demo("错误");
            else
                System.out.println("yes");
        } catch (Demo e) {
            System.out.println(e);
        }
    }
}

package expception;

class Test extends Exception //新建一个自定义的异常类
{
    public Test(String message)
    {
        super(message);
    }
}

public class TestThrow3 //主函数入口
{
    public static void main(String args[]) throws Test {
        int a=-10;
        if (a<0){
            throw new Test("分母不能为0"); //抛出异常固定句式
        }else{
            System.out.println(a);
        }
    }
}

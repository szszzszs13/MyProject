package expception;

public class ExceptionDemo {

    public ExceptionDemo(String str) {
    }

    public static void main(String[] args) {
        try
        {
            int data=50/0; //may throw exception
        }
        //handling the exception
        catch(Exception e)
        {
            System.out.println(e.getMessage());  //若自定义异常输出内容，可修改括号内容
        }
        System.out.println("rest of the code");
    }
}

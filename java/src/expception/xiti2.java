package expception;

public class xiti2 {
    public static void main(String[] args) {
        try {
            throw new Exception("异常");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            System.out.println("finally");
        }
    }
}

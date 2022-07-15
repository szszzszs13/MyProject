package other;

public class Arry {
    public static void main(String[] args) {
        int arry[] = new int[5];
        for (int i=0;i<arry.length;i++){
            arry[i] = i;//赋值
        }
        for (int i=0;i<arry.length;i++){
            System.out.println("a["+i+"]:"+arry[i]);
        }
    }
}

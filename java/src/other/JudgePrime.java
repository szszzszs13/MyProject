package other;

public class JudgePrime {
    public static void main(String args[]) {
        for (int num = 2; num <= 100; num++) {
            int flag=1;
            for (int x = 2; x < num; x++) { //注意每次执行都重新让x=2
                if (num % x == 0) {
                    flag=0;
                    break;
                }
            }
            if (flag==1) {
                System.out.print(num+"  ");
            }
        }
    }
}


package other;

import java.util.Scanner;

public class JudgeYear {
    public static void main(String args[]){
        System.out.print("请输入年份:");
        try {
            Scanner get = new Scanner(System.in);
            int year = get.nextInt();
            if (year%400==0 || (year%4==0)&&(year%100!=0)){
                System.out.println(year+"是闰年");
            }else{
                System.out.println(year+"不是闰年 ");
            }
        }
        catch (RuntimeException e) //捕获运行时的异常
        {
            System.out.println("你输入的不是数字，请重新输入！"); //自定义异常提示
        }
    }
}

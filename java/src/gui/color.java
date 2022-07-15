package gui;
import javax.swing.*;
import java.awt.*;

public class color {

    public static void main(String args[])
        {
            //创建窗口
            JFrame f = new JFrame("颜色程序");
            f.setSize(600,300); //0
            //设置可见
            f.setVisible(true); //0
            //设置布局
            f.setLayout(new FlowLayout());

            //新建标签
            Label l1= new Label("label1");
            Label l2= new Label("label2");
            Label l3= new Label("label3");

            //标签背景色
            l1.setBackground(Color.yellow);  //0
            l2.setBackground(Color.blue);
            l3.setBackground(Color.red);

            //添加标签到窗口
            f.add(l1);
            f.add(l2);
            f.add(l3);

            //设置窗口可以关闭
            f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        }
    }

package gui;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

/*编写程序，包括一个标签、一个文本框和一个按钮，当用户单击按钮时，程序把文本框中的内容复制到标签中。*/

public class MyGui {

    public static void main(String[] args) {
        //1.创建窗体
        JFrame f = new JFrame("Java Program");
        f.setSize(600,300);    //f.setBounds(400, 200, 400, 300);
        f.setLayout(new FlowLayout());
        f.setVisible(true); //设置组件可见

        //2.创建标签，文本框，按钮
        JLabel lb = new JLabel("标签区域");;    //lb.setPreferredSize(new Dimension(100,100));
        TextField tf= new TextField(7);
        JButton jb = new JButton("点击复制");

        //3.将组件添加到各个窗体
        f.add(tf);
        f.add(jb);
        f.add(lb);

        //4.为按钮添加响应事件
        //4.1创建监听器
        class Listener implements ActionListener{
            @Override
            public void actionPerformed(ActionEvent e) {
                //获取文本框内容
                String str = tf.getText();
                //文本框内容添加到标签
                lb.setText(str);
            }
        }
        Listener jtq = new Listener();
        //4.2监听器添加到按钮
        jb.addActionListener(jtq);

        //5.设置窗口关闭（可省）
        f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }
}



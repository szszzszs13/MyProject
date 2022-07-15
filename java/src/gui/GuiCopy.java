package gui;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

/*编写程序，包括一个标签、一个文本框和一个按钮，当用户单击按钮时，程序把文本框中的内容复制到标签中。*/


public class GuiCopy {
    public static void main(String[] args) {


        //创建窗体
        Frame f = new Frame("数据拷贝");
        //设置窗体大小位置
        f.setBounds(400,200,400,300);
        //设置布局方式
        f.setLayout(new FlowLayout());
        //创建文本框
        final TextField tf= new TextField(20);
        //创建按钮
        final JButton jb = new JButton("点击复制");
        //创建文本域
        final TextArea ta = new TextArea(10,40);


        //将组件添加到窗体
        f.add(tf);
        f.add(jb);
        f.add(ta);


        //设置窗口关闭事件
        f.addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosing(WindowEvent e) {
                System.exit(0);
            }
        });


        //为按钮添加响应事件
        jb.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String str_tf = tf.getText().trim();
                //设置数据清空
                tf.setText("");
                //追加和换行
                ta.append(str_tf+"\r\n");
                //获取光标
                tf.requestFocus();
            }
        });
        f.setVisible(true);
    }
}

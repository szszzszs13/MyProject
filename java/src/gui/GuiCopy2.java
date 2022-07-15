package gui;

import java.awt.*;
import java.awt.event.*;

/*编写程序，包括一个标签、一个文本框和一个按钮，当用户单击按钮时，程序把文本框中的内容复制到标签中。*/

public class GuiCopy2 extends Frame implements ActionListener {

    private Button copy = new Button("Copy");
    private TextField text = new TextField(20);
    private Label label = new Label("");
    public GuiCopy2() {
        super("Example");
        setLayout(new GridLayout(3,0));
        add(text);
        add(label);
        add(copy);
        label.setBackground(Color.BLUE);
        copy.addActionListener(this);
        text.addActionListener(this);
        pack();
        setVisible(true);
    }

    @Override
    public void actionPerformed(ActionEvent e) {

        // TODO Auto-generated method stub
        if(e.getSource() == text) {
            text.getText().trim();
        }else if(e.getSource() == copy){
            //text.setText(str);
            label.setText(text.getText());
        }
    }

    public static void main(String[] args){
        GuiCopy2 click = new GuiCopy2();

    }
}

package other;

abstract class C {
	abstract void callme();

	void metoo() {
		System.out.println("Inside other.C's metoo( ) method");
	}
}

class D extends C {
	void callme() {
		System.out.println("Inside other.D's callme( ) method");
	} //实现抽象方法，否则D也是abstract类，所以后续才能New
}

public class AbstractTest {
	public static void main(String args[]) {
		C c = new D(); //abstract修饰的C不能实例化，
		c.callme();
		c.metoo();
	}
}

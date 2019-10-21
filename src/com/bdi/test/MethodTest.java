package com.bdi.test;

class Mother {
	static int a = 3;
	static {
	System.out.println("123");
	}
	Mother() {
		System.out.println("1");
	}
//	Mother(int a) {
//		System.out.println("sss");
//	}
//
//	public void test() {
//		System.out.println("난 상위클래스");
//	}
}

public class MethodTest extends Mother {

//	int a = 123;
//	MethodTest() {
////		super(1);
////		super.test();
////		System.out.println(this.a);
//		System.out.println("ㄴㄴ");
//	}
//	MethodTest(int a) {
////		super(1);
////		super.test();
////		System.out.println(this.a);
//		System.out.println("ㄴㄴㄴ");
//	}

	

	public static void main(String[] args) {
//		MethodTest mt = new MethodTest(1);
		// mt.test();
//		System.out.println(Mother.a);
//		new Mother();
//		new Mother();
		System.out.println(Mother.a);
		Mother m = new MethodTest();
	}

}

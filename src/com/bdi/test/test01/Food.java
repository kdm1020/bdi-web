package com.bdi.test.test01;

import java.util.ArrayList;
import java.util.List;

public class Food {
	private String name;
	private int price;
	private String etc;

	public Food(String name, int price, String etc) {
		this.name = name;
		this.price = price;
		this.etc = etc;
	}

	public String toString() {
		return "Food [name=" + name + ", price=" + price + ",etc=" + etc + "]";
	}

	public static void addMenu(List<Food> menu, String name, int price, String etc) {
		Food f = new Food(name, price, etc);
		menu.add(f);
	}

//	public static void main(String[] args) {
//		Food f = new Food();
//		f.name = "치킨";
//		f.price = 20000;
//		f.etc = "JMT";
//
//		Food f2 = new Food();
//		f2.name = "생맥주";
//		f2.price = 5000;
//		f2.etc = "500cc";
//
//		Food f3 = new Food();
//		f3.name = "소주";
//		f3.price = 4000;
//		f3.etc = "330cc";
//		List<Food> menus = new ArrayList<Food>();
//		menus.add(f);
//		menus.add(f2);
//		menus.add(f3);}

}

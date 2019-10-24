package com.bdi.test.test01;

public class SplitTest {

	public static void main(String[] args) {
		String hobby = "study,movie,game";
		String[] hobbies = hobby.split(",");
		String hob1 = "game";
		for (String str : hobbies) {
			if (str.equals(hob1)) {
				System.out.println("checked");
				break;
			}
		}

	}
}

package com.bdi.test;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Lotto {

	public static void main(String[] args) {
		Random r = new Random();
		List<Integer> nums = new ArrayList<Integer>();
//		for (int i = 0; i < 6; i++) {
//			nums.add(r.nextInt(45) + 1);
//			for (int j = 1; j < i; j++) {
//				// 중복제거
//				if (nums.get(i) == nums.get(j)) {
//					i--;
//				}
//			}
//		}
		for(int i=0;i<6;i++) {
			int rNum = r.nextInt(45)+1;
			if(nums.indexOf(rNum)==-1) {
				nums.add(rNum);
			}else {
				i--;
			}
		}
		// 정렬
		for (int i = 0; i < nums.size(); i++) {
			for (int j = i + 1; j < nums.size(); j++) {
				if (nums.get(i) > nums.get(j)) {
					int tmpInt = nums.get(i);
					nums.set(i, nums.get(j));
					nums.set(j, tmpInt);
				}
			}
		}
		System.out.println(nums);
	}
}

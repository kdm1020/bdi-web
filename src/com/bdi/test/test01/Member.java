package com.bdi.test.test01;

import java.util.ArrayList;
import java.util.List;

public class Member {
	int a;
	public String test(int a) {
		return "abc";
	}
	public static void changeMember(Member m) {
		m= new Member();
		m.a=10;
//		System.out.println(m.a);
	}
	
	public static void main(String[] args) {
//		String str = Member.test();//파라메터에 int값을 넣으면 에러가 나는건 5번라인이 static이 아니라서.
		Member m = new Member();
		List<Member> mList = new ArrayList<Member>();
		m.a =10;
		mList.add(m);
		m.a =20;
		mList.add(m);
		m.a =30;
		mList.add(m);
		m=new Member();
		
		//		m.a = 10; //a=10; static 영역에서는 비static변수를 사용할수 없다. 사용하려고 하면 메모리를 만들어줘야한다.
//		System.out.println(m.a);
//		changeMember(m);
//		System.out.println(m.a);//여기서 m.a는 4번라인a를 바라보므로 0이 출력됨. 18번 라인의 m은 8~10번 라인에만 존재.
		for(int i = 0;i<mList.size();i++) {
			System.out.println(mList.get(i).a);
		}
		
	}
}

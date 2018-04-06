package com.hw.controller;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hw.frame.Biz;
import com.hw.vo.Accident;
import com.hw.vo.Oldman;

@Controller
public class MainController {
	Connection conn;

	public MainController() {
		try {
			Class.forName("org.apache.hive.jdbc.HiveDriver");
			conn = DriverManager.getConnection("jdbc:hive2://192.168.111.100:10000/" + "default", "root", "111111");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/main.do")
	public String main() {
		return "main";
	}

	@RequestMapping("/chart1.do")
	public String chart1(Model m) {
		m.addAttribute("center", "chart1");
		return "main";
	}

	@RequestMapping("/chart2.do")
	public String chart2(Model m) {
		m.addAttribute("center", "chart2");
		return "main";
	}

	@RequestMapping("/chart3.do")
	public String chart3(Model m) {
		m.addAttribute("center", "chart3");
		return "main";
	}

	@RequestMapping("/chart4.do")
	public String chart4(Model m) {
		m.addAttribute("center", "chart4");
		System.out.println("chart4.jsp 작동");
		return "main";

	}

	@RequestMapping("/chart5.do")
	public String chart5(Model m) {
		m.addAttribute("center", "chart5");
		System.out.println("chart5.jsp 작동");
		return "main";

	}

	@RequestMapping("/chart1impl.do")
	@ResponseBody // data를 output로 보내겠다는 의미
	public void chart1impl(HttpServletResponse res) throws Exception {
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT Year, Month, COUNT(*) " + "FROM airline_delay "
				+ "WHERE delayYear=2006 " + "AND Month IN (1,2,3,4) " + "AND ArrDelay > 0 " + "GROUP BY Year, Month");
		JSONArray ja = new JSONArray();
		while (rs.next()) {
			JSONArray data = new JSONArray(); // []안에 []를 생성
			data.add(rs.getInt(2) + "월");
			data.add(rs.getInt(3));
			// ["1월", 20000]
			ja.add(data);
		}
		res.setCharacterEncoding("EUC-KR");
		res.setContentType("application/json");
		PrintWriter out = res.getWriter();

		out.print(ja.toJSONString());
		out.close();

	}

	@RequestMapping("/chart2impl.do")
	@ResponseBody // data를 output로 보내겠다는 의미
	public void chart2impl(HttpServletResponse res) throws Exception {
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT Year, Month, COUNT(*) " + "FROM airline_delay "
				+ "WHERE delayYear=2006 " + "AND Month IN (1,2,3,4) " + "AND ArrDelay > 0 " + "GROUP BY Year, Month");
		JSONArray ja = new JSONArray();
		while (rs.next()) {
			JSONObject data = new JSONObject(); // []안에 []를 생성
			data.put("name", rs.getInt(2) + "월");
			data.put("y", rs.getInt(3));

			ja.add(data);
		}
		res.setCharacterEncoding("EUC-KR");
		res.setContentType("application/json");
		PrintWriter out = res.getWriter();

		out.print(ja.toJSONString());
		out.close();

	}

	@RequestMapping("/chart3impl.do")
	@ResponseBody // data를 output로 보내겠다는 의미
	public void chart3impl(HttpServletResponse res) throws Exception {
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT sum(casualties) FROM car_accident GROUP BY year ");
		JSONArray ja = new JSONArray();

		while (rs.next()) {
			ja.add(rs.getInt(1));// rs는 시작번호 1
		}
		res.setCharacterEncoding("EUC-KR");
		res.setContentType("application/json");
		PrintWriter out = res.getWriter();
		out.write(ja.toJSONString());
		out.close();

	}

	@Resource(name = "oldmanBiz")
	Biz<Oldman, String> biz1;

	@RequestMapping("/chart4_1impl.do")
	@ResponseBody // data를 output로 보내겠다는 의미
	public void chart4impl(HttpServletResponse res) throws Exception {

		JSONArray ja = new JSONArray(); // 배열안에 배열을 넣어야함
		List<Oldman> list = null;
		list = biz1.get(); // oldman의 위도경도를 받아서 json에 넣고 1개
		for (Oldman u : list) {
			JSONArray data = new JSONArray();

			System.out.println(u.getLatitude() + "   " + u.getLongitude());
			data.add(Float.parseFloat(u.getLongitude()));
			data.add(Float.parseFloat(u.getLatitude()));
			ja.add(data);
		}

		res.setCharacterEncoding("EUC-KR");
		res.setContentType("application/json");
		PrintWriter out = res.getWriter();
		out.write(ja.toJSONString()); //
		out.close();
		System.out.println("chart4_1impl종료");

	}

	@Resource(name = "accidentBiz")
	Biz<Accident, String> biz2;

	@RequestMapping("/chart4_2impl.do")
	@ResponseBody // data를 output로 보내겠다는 의미
	public void chart4_2impl(HttpServletResponse res) throws Exception {
		JSONArray ja = new JSONArray();
		List<Accident> list = null;
		list = biz2.get();
		for (Accident u : list) {
			JSONArray data = new JSONArray();
			System.out.println(u.getLatitude() + "   " + u.getLongitude());
			data.add(Float.parseFloat(u.getLongitude()));
			data.add(Float.parseFloat(u.getLatitude()));
			ja.add(data);
		}
		res.setCharacterEncoding("EUC-KR");
		res.setContentType("application/json");
		PrintWriter out = res.getWriter();
		out.write(ja.toJSONString());
		out.close();
		System.out.println("chart4_2impl종료");

	}

	@RequestMapping("/chart5_1impl.do")
	@ResponseBody // data를 output로 보내겠다는 의미
	public void chart5_1impl(HttpServletResponse res){
		System.out.println("char5_impl시작");
		RConnection rconn = null;
		try {
			rconn = new RConnection();
		} catch (RserveException e) {
			System.out.println("R Connection Error");
		}
		System.out.println("R Connection OK");
		try {
			// 한글 문제 해결 한글이 깨지면 에러남
			rconn.setStringEncoding("utf8");
			rconn.eval("source('C:/Rproject/day08/hive2.R',encoding='UTF-8')");
			RList list = rconn.eval("r()").asList();
			System.out.println(list.size());
			double r[] = list.at(0).asDoubles();
			System.out.println("r받기");
			JSONArray ja_r = new JSONArray();
			for(int i=0; i<list.size(); i++) {
				ja_r.add(r[i]);
			}
			System.out.println(ja_r.toJSONString());
			res.setCharacterEncoding("EUC-KR");
			res.setContentType("application/json");
			PrintWriter out = res.getWriter();
			out.write(ja_r.toJSONString());

			out.close();
			System.out.println("chart5_1impl종료");

		} catch (Exception e) {

			e.printStackTrace();
		}

	}
	
	@RequestMapping("/chart5_2impl.do")
	@ResponseBody // data를 output로 보내겠다는 의미
	public void chart5_2impl(HttpServletResponse res){
		RConnection rconn = null;
		try {
			rconn = new RConnection();
		} catch (RserveException e) {
			System.out.println("R Connection Error");
		}
		System.out.println("R Connection OK");
		try {
			// 한글 문제 해결 한글이 깨지면 에러남
			rconn.setStringEncoding("utf8");
			rconn.eval("source('C:/Rproject/day08/hive2.R',encoding='UTF-8')");
			RList list = rconn.eval("r()").asList();
			System.out.println(list.size());
			int r1[] = list.at(1).asIntegers();
			System.out.println("r1받기");
			JSONArray ja_r1 = new JSONArray();
			for(int i=0; i<list.size(); i++) {
				ja_r1.add(r1[i]);
			}
			System.out.println(ja_r1.toJSONString());
			res.setCharacterEncoding("EUC-KR");
			res.setContentType("application/json");
			PrintWriter out = res.getWriter();
			out.write(ja_r1.toJSONString());
			out.close();
			System.out.println("chart5_2impl종료");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@RequestMapping("/chart5_3impl.do")
	@ResponseBody // data를 output로 보내겠다는 의미
	public void chart5_3impl(HttpServletResponse res){
		RConnection rconn = null;
		try {
			rconn = new RConnection();
		} catch (RserveException e) {
			System.out.println("R Connection Error");
		}
		System.out.println("R Connection OK");
		try {
			// 한글 문제 해결 한글이 깨지면 에러남
			rconn.setStringEncoding("utf8");
			rconn.eval("source('C:/Rproject/day08/hive2.R',encoding='UTF-8')");
			RList list = rconn.eval("r()").asList();
			System.out.println(list.size());
			int r2[] = list.at(2).asIntegers();
			System.out.println("r2받기");
			JSONArray ja_r2 = new JSONArray();
			for(int i=0; i<list.size(); i++) {
				ja_r2.add(r2[i]);
			}
			System.out.println(ja_r2.toJSONString());
			res.setCharacterEncoding("EUC-KR");
			res.setContentType("application/json");
			PrintWriter out = res.getWriter();
			out.write(ja_r2.toJSONString());

			out.close();
			System.out.println("chart5_3impl종료");

		} catch (Exception e) {

			e.printStackTrace();
		}

	}
	
	@RequestMapping("/chart5_4impl.do")
	@ResponseBody // data를 output로 보내겠다는 의미
	public void chart5_4impl(HttpServletResponse res){
		RConnection rconn = null;
		try {
			rconn = new RConnection();
		} catch (RserveException e) {
			System.out.println("R Connection Error");
		}
		System.out.println("R Connection OK");
		try {
			// 한글 문제 해결 한글이 깨지면 에러남
			rconn.setStringEncoding("utf8");
			rconn.eval("source('C:/Rproject/day08/hive2.R',encoding='UTF-8')");
			RList list = rconn.eval("r()").asList();
			System.out.println(list.size());
			int r3[] = list.at(3).asIntegers();
			System.out.println("r3받기");
			JSONArray ja_r3 = new JSONArray();
			for(int i=0; i<list.size(); i++) {
				ja_r3.add(r3[i]);
			}
			System.out.println(ja_r3.toJSONString());
			res.setCharacterEncoding("EUC-KR");
			res.setContentType("application/json");
			PrintWriter out = res.getWriter();
			out.write(ja_r3.toJSONString());

			out.close();
			System.out.println("chart5_4impl종료");

		} catch (Exception e) {

			e.printStackTrace();
		}

	}
	
}

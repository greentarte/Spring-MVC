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
		System.out.println("chart4.jsp �۵�");
		return "main";

	}

	@RequestMapping("/chart1impl.do")
	@ResponseBody // data�� output�� �����ڴٴ� �ǹ�
	public void chart1impl(HttpServletResponse res) throws Exception {
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT Year, Month, COUNT(*) " + "FROM airline_delay "
				+ "WHERE delayYear=2006 " + "AND Month IN (1,2,3,4) " + "AND ArrDelay > 0 " + "GROUP BY Year, Month");
		JSONArray ja = new JSONArray();
		while (rs.next()) {
			JSONArray data = new JSONArray(); // []�ȿ� []�� ����
			data.add(rs.getInt(2) + "��");
			data.add(rs.getInt(3));
			// ["1��", 20000]
			ja.add(data);
		}
		res.setCharacterEncoding("EUC-KR");
		res.setContentType("application/json");
		PrintWriter out = res.getWriter();

		out.print(ja.toJSONString());
		out.close();

	}

	@RequestMapping("/chart2impl.do")
	@ResponseBody // data�� output�� �����ڴٴ� �ǹ�
	public void chart2impl(HttpServletResponse res) throws Exception {
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT Year, Month, COUNT(*) " + "FROM airline_delay "
				+ "WHERE delayYear=2006 " + "AND Month IN (1,2,3,4) " + "AND ArrDelay > 0 " + "GROUP BY Year, Month");
		JSONArray ja = new JSONArray();
		while (rs.next()) {
			JSONObject data = new JSONObject(); // []�ȿ� []�� ����
			data.put("name", rs.getInt(2) + "��");
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
	@ResponseBody // data�� output�� �����ڴٴ� �ǹ�
	public void chart3impl(HttpServletResponse res) throws Exception {
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt
				.executeQuery("SELECT sum(casualties) FROM car_accident GROUP BY year ");
		JSONArray ja = new JSONArray();
		
		while (rs.next()) {
			ja.add(rs.getInt(1));// rs�� ���۹�ȣ 1
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
	@ResponseBody // data�� output�� �����ڴٴ� �ǹ�
	public void chart4impl(HttpServletResponse res) throws Exception {
		
		JSONArray ja = new JSONArray(); // �迭�ȿ� �迭�� �־����
		List<Oldman> list = null;
		list = biz1.get(); // oldman�� �����浵�� �޾Ƽ� json�� �ְ� 1��
		for (Oldman u : list) {
			JSONArray data = new JSONArray();
			
			System.out.println(u.getLatitude()+"   "+u.getLongitude());
			data.add(Float.parseFloat(u.getLongitude()));
			data.add(Float.parseFloat(u.getLatitude()));			
			ja.add(data);
		}

		res.setCharacterEncoding("EUC-KR");
		res.setContentType("application/json");
		PrintWriter out = res.getWriter();
		out.write(ja.toJSONString()); //
		out.close();
		System.out.println("chart4_1impl����");

	}

	@Resource(name = "accidentBiz")
	Biz<Accident, String> biz2;

	@RequestMapping("/chart4_2impl.do")
	@ResponseBody // data�� output�� �����ڴٴ� �ǹ�
	public void chart4_2impl(HttpServletResponse res) throws Exception {
		JSONArray ja = new JSONArray();
		List<Accident> list = null;
		list = biz2.get();
		for (Accident u : list) {
			JSONArray data = new JSONArray();
			System.out.println(u.getLatitude()+"   "+u.getLongitude());
			data.add(Float.parseFloat(u.getLongitude()));
			data.add(Float.parseFloat(u.getLatitude()));
			ja.add(data);
		}
		res.setCharacterEncoding("EUC-KR");
		res.setContentType("application/json");
		PrintWriter out = res.getWriter();
		out.write(ja.toJSONString());
		out.close();
		System.out.println("chart4_2impl����");

	}
}

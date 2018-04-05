package com.hw.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.hw.frame.Biz;
import com.hw.vo.Product;
import com.hw.vo.User;

@Controller
public class ProductController {
	@Resource(name = "productBiz")
	Biz<Product, Integer> biz;

	@RequestMapping("/productlist.do")
	public String list(Model m) {
		// DB에서 데이터를 조회 한다.
		List<Product> list = null;
		list = biz.get();
		m.addAttribute("productlist", list);
		m.addAttribute("center", "product/list");
		return "main";
	}

	@RequestMapping("/productadd.do")
	public String add(Model m) {
		m.addAttribute("center", "product/add");
		return "main";
	}

	@RequestMapping("/productaddimpl.do")
	public String addimpl(Model m, Product p) {
		System.out.println(p);
		MultipartFile mf = p.getMf();
		String imgName = mf.getOriginalFilename();
		System.out.println(imgName);
		p.setImgname(imgName);
		// C:\\spring\\mv\\web\\img
		byte[] data = null;
		FileOutputStream fo = null;
		try {
			data = mf.getBytes();
			fo = new FileOutputStream("C:\\spring\\mv\\web\\img\\" + imgName);
			fo.write(data);

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fo.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		// DB에 입력
		List<Product> list = null;
		list = biz.get();
		biz.register(p);
		m.addAttribute("productlist", list);
		m.addAttribute("center", "product/list");
		return "main";
	}

	@RequestMapping("/productinfo.do")
	public String info(Model m, Integer id) {
		Product product = null;
		product = biz.get(id);
		m.addAttribute("productinfo", product);
		m.addAttribute("center", "product/info");
		return "main";
	}

	@RequestMapping("/productdel.do")
	public String del(Model m, Integer id) {
		biz.remove(id);
		m.addAttribute("center", "product/del");
		return "main";
	}

	@RequestMapping("/productmod.do")
	public String mod(Model m, Product p) {
		// Product p는 들어오는 데이터를 받는 용도
		// Model m은 처리한 데이터를 넘기는 역할
		// 조건처리 시 null조건을 우선 검사하게 코딩
		System.out.println(p);
		if (!p.getMf().isEmpty()) {
			MultipartFile mf = p.getMf();
			String imgName = mf.getOriginalFilename();
			System.out.println(imgName);
			p.setImgname(imgName);
			byte[] data = null;
			FileOutputStream fo = null;
			try {
				data = mf.getBytes();
				fo = new FileOutputStream("C:\\spring\\mv\\web\\img\\" + imgName);
				fo.write(data);

			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				try {
					fo.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		biz.modify(p);
		m.addAttribute("center", "product/mod");
		return "main";
	}
}

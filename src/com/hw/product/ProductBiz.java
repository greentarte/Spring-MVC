package com.hw.product;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hw.frame.Biz;
import com.hw.frame.Dao;
import com.hw.vo.Product;
import com.hw.vo.User;

@Service("productBiz")
public class ProductBiz implements Biz<Product, Integer> {

	@Resource(name="productDao")
	Dao<Product, Integer> dao;


	public ProductBiz() {
		dao = new ProductDao();
	}

	@Transactional // 자동 트렌젝션 처리 데이터가 바뀔때
	@Override
	public void register(Product t) {
		dao.insert(t);

	}

	@Transactional
	@Override
	public void remove(Integer s) {
		dao.delete(s);

	}

	@Transactional
	@Override
	public void modify(Product t) {
		dao.update(t);

	}

	@Override
	public Product get(Integer s) {
		return dao.select(s);
	}

	@Override
	public List<Product> get() {
		return dao.select();
	}

}

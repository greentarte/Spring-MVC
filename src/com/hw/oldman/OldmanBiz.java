package com.hw.oldman;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hw.frame.Biz;
import com.hw.frame.Dao;
import com.hw.vo.Oldman;

@Service("oldmanBiz")
public class OldmanBiz implements Biz<Oldman, String> {

	@Resource(name="oldmanDao")
	Dao<Oldman, String> dao;
	
	public OldmanBiz() {
		dao = new OldmanDao();
	}
	
	@Transactional
	@Override
	public void register(Oldman t) {
		dao.insert(t);
	}

	//transaction이 되는 함수라는 뜻이다.
	@Transactional
	@Override
	public void remove(String s) {
		dao.delete(s);
	}

	//transaction이 되는 함수라는 뜻이다.
	@Transactional
	@Override
	public void modify(Oldman t) {
		dao.update(t);
	}

	
	@Override
	public Oldman get(String s) {
		return dao.select(s);
	}


	@Override
	public List<Oldman> get() {
		return dao.select();
	}

}

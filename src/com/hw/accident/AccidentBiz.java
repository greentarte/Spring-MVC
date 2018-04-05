package com.hw.accident;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hw.frame.Biz;
import com.hw.frame.Dao;
import com.hw.vo.Accident;

@Service("accidentBiz")
public class AccidentBiz implements Biz<Accident, String> {

	@Resource(name = "accidentDao")
	Dao<Accident, String> dao;

	public AccidentBiz() {
		dao = new AccidentDao();
	}

	@Transactional
	@Override
	public void register(Accident t) {
		dao.insert(t);
	}

	// transaction이 되는 함수라는 뜻이다.
	@Transactional
	@Override
	public void remove(String s) {
		dao.delete(s);
	}

	// transaction이 되는 함수라는 뜻이다.
	@Transactional
	@Override
	public void modify(Accident t) {
		dao.update(t);
	}

	@Override
	public Accident get(String s) {
		return dao.select(s);
	}

	@Override
	public List<Accident> get() {
		return dao.select();
	}

}

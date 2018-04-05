package com.hw.accident;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hw.frame.Dao;
import com.hw.mapper.AccidentMapper;
import com.hw.vo.Accident;


@Repository("accidentDao")
public class AccidentDao implements Dao<Accident, String> {

	@Autowired
	AccidentMapper mapper;
	
	
	@Override
	public void insert(Accident t) {
		mapper.insert(t);
	}

	@Override
	public void delete(String s) {
		mapper.delete(s);	
	}

	@Override
	public void update(Accident t) {
		mapper.update(t);
	}

	@Override
	public Accident select(String s) {
		
		return mapper.select(s);
	}

	@Override
	public List<Accident> select() {
		
		return  mapper.selectall();
	}

}

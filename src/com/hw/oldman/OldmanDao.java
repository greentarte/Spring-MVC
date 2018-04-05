package com.hw.oldman;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hw.frame.Dao;
import com.hw.mapper.OldmanMapper;
import com.hw.vo.Oldman;


@Repository("oldmanDao")
public class OldmanDao implements Dao<Oldman, String> {

	@Autowired
	OldmanMapper mapper;
	
	
	@Override
	public void insert(Oldman t) {
		mapper.insert(t);
	}

	@Override
	public void delete(String s) {
		mapper.delete(s);	
	}

	@Override
	public void update(Oldman t) {
		mapper.update(t);
	}

	@Override
	public Oldman select(String s) {
		
		return mapper.select(s);
	}

	@Override
	public List<Oldman> select() {
		
		return  mapper.selectall();
	}

}

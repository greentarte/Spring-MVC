package com.hw.mapper;

import java.util.List;

import com.hw.vo.Accident;

public interface AccidentMapper {
	public void insert(Accident obj);
	public void delete(String id);
	public void update(Accident obj);
	public Accident select(String id);
	public List<Accident> selectall();
}

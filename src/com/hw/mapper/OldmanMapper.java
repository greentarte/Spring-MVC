package com.hw.mapper;

import java.util.List;

import com.hw.vo.Oldman;

public interface OldmanMapper {
	public void insert(Oldman obj);
	public void delete(String id);
	public void update(Oldman obj);
	public Oldman select(String id);
	public List<Oldman> selectall();
}

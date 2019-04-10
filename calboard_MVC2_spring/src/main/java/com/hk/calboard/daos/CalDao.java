package com.hk.calboard.daos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.calboard.dtos.CalDto;



@Repository
public class CalDao implements ICalDao {
	
	private String namespace="com.hk.calboard.";

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<CalDto> getCalList(String id, String yyyyMMdd) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insertCalboard(CalDto dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<CalDto> getCalViewList(String id, String yyyyMM) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getCalViewCount(String id, String yyyyMMdd) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CalDto getCalBoard(int seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean updateCalBoard(CalDto dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean calMulDel(String[] seqs) {
		// TODO Auto-generated method stub
		return false;
	}
	
	
}

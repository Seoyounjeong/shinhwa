package com.hk.calboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hk.calboard.daos.ICalDao;
import com.hk.calboard.dtos.CalDto;

@Service
public class CalService implements ICalService {
	
	@Autowired
	private ICalDao calDao;
	
	@Override
	public List<CalDto> getCalList(String id, String yyyyMMdd) {
		return calDao.getCalList(id, yyyyMMdd);
	}
	
	@Override
	public boolean insertCalboard(CalDto dto) {
		return calDao.insertCalboard(dto);
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

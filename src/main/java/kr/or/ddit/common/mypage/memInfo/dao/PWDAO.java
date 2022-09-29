package kr.or.ddit.common.mypage.memInfo.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PWDAO {
	
	public int updateGenPW(Map<String, Object> map);
	
	public int updateComPW(Map<String, Object> map);

}

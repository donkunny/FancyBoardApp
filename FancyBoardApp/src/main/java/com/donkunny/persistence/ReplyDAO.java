package com.donkunny.persistence;

import java.util.List;

import com.donkunny.domain.ReplyVO;

public interface ReplyDAO {

	/**
	 * 댓글의 리스트와 댓글 등록, 수정, 삭제 기능
	 * @param bno
	 * @return 
	 * @throws Exception
	 */
	public List<ReplyVO> list(Integer bno) throws Exception;
	public void create(ReplyVO vo) throws Exception;
	public void update(ReplyVO vo) throws Exception;
	public void delete(Integer rno) throws Exception;
	
}

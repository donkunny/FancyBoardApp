package com.donkunny.persistence;

import java.util.List;

import com.donkunny.domain.Criteria;
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

	/**
	 * 페이징 기술을 위한 메소드
	 */
	public List<ReplyVO> listPage(Integer bno, Criteria cri) throws Exception;
	public int count(Integer bno) throws Exception;
	
	/**
	 * 댓글 개수를 가져오기 위해 필요한 메소드
	 */
	public int getBno(Integer rno) throws Exception;
}


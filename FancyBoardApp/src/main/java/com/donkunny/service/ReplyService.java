package com.donkunny.service;

import java.util.List;

import com.donkunny.domain.Criteria;
import com.donkunny.domain.ReplyVO;

public interface ReplyService {
	public void addReply(ReplyVO vo) throws Exception;
	public List<ReplyVO> listReply(Integer bno) throws Exception;
	public void modifyReply(ReplyVO vo) throws Exception;
	public void removeReply(Integer rno) throws Exception;
	
	/**
	 * 페이징 기능을 위한 메소드
	 */
	public List<ReplyVO> listReplyPage(Integer bno, Criteria cri) throws Exception;
	public int count(Integer bno) throws Exception;
	
}

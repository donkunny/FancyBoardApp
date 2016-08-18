package com.donkunny.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.donkunny.domain.ReplyVO;
import com.donkunny.persistence.ReplyDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ReplyDAOTest {

	@Inject
	private ReplyDAO dao;
	
	private static Logger logger =LoggerFactory.getLogger(ReplyDAOTest.class);
	
	@Test
	public void testCreate() throws Exception {
		ReplyVO reply = new ReplyVO();
		reply.setBno(134);
		reply.setReplytext("댓글을 추가합니다");
		reply.setReplyer("user00");
		
		dao.create(reply);
	}
}

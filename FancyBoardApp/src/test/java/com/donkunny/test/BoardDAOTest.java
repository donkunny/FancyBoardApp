package com.donkunny.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.donkunny.domain.BoardVO;
import com.donkunny.persistence.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class BoardDAOTest {

	@Inject
	private BoardDAO dao;
	
	private static Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);
	
	public void testCreate() throws Exception {
		BoardVO board = new BoardVO();
		board.setTitle("test title");
		board.setContent("test content");
		board.setWriter("donkunny");
		
		dao.create(board);
	}
	
	
	public void testRead() throws Exception {
		logger.info(dao.read(1).toString());
	}
	
//	@Test
	public void testUpdate() throws Exception {
		BoardVO board = new BoardVO();
		board.setBno(1);
		board.setTitle("edited title");
		board.setContent("edited content");
		dao.update(board);
	}
	
	@Test
	public void testDelete() throws Exception {
		dao.delete(1);
	}
}

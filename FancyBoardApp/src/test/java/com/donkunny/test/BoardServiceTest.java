package com.donkunny.test;



import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.donkunny.domain.BoardVO;
import com.donkunny.service.BoardService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class BoardServiceTest {

	@Inject
	private BoardService service;
	
	private static Logger logger = LoggerFactory.getLogger(BoardServiceTest.class);
	
//	@Test
	public void testRegist() throws Exception {
		BoardVO board = new BoardVO();
		board.setTitle("test title2");
		board.setContent("test content2");
		board.setWriter("donkunny2");
		
		service.regist(board);
	}
	
//	@Test
	public void testRead() throws Exception {
		logger.info(service.read(3).toString());
	}
}

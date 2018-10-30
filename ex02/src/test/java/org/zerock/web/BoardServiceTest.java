package org.zerock.web;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.service.BoardService;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })

public class BoardServiceTest {
	@Inject
	private BoardService service;

	private static Logger logger = LoggerFactory.getLogger(BoardServiceTest.class);

	@Test
	public void testRegist() throws Exception {
		BoardVO board = new BoardVO();
		board.setTitle("새로운 글을 넣습니다.");
		board.setContent("테스트 중입니다.");
		board.setWriter("coolldd");
		service.regist(board);
	}

	@Test
	public void testRead() throws Exception {
		logger.info(service.read(1).toString());
	}

	@Test
	public void testModify() throws Exception {
		BoardVO board = new BoardVO();
		board.setBno(1);
		board.setTitle("수정된 글 입니다.");
		board.setContent("수정 테스트");
		service.modify(board);
	}

	@Test
	public void testRemove() throws Exception {
		service.remove(1);
	}
}

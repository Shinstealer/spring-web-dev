package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;
import org.zerock.persistence.BoardDAO;



@Service
public class BoardServiceImpl implements BoardService{

	@Inject
	private BoardDAO dao;
	
	//BoardDAO의 Create()와 addAttach()를 연속으로 사용하기 때문에 트랜젝션 처리

	@Transactional
	@Override
	public void regist(BoardVO board) throws Exception {
		
		dao.create(board);
		
		String[] files = board.getFiles();
		
		if(files == null) {
			return;
		}
		
		
		for (String fileName : files) {
			
			dao.addAttach(fileName);
			
		}
		System.out.println("----------------------------------------------------------------------------------------");
		System.out.println(dao.getClass().getName());
		
	}
	
	// 격리수준은 DB가 기본으로 사용하는 수준 , 다른 연결이 커밋하지 않은 데이터는 볼 수 없음
	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public BoardVO read(Integer bno) throws Exception {
		dao.updateViewCnt(bno);
		return dao.read(bno);
		
	}
	
	//첨부파일 수정 , 기존 첨부파일 목록 삭제, 새로운 첨부파일 정보 입력 동시 처리 
	@Transactional
	@Override
	public void modify(BoardVO board) throws Exception {
		dao.update(board);
		
		Integer bno = board.getBno();
		
		dao.deleteAttach(bno);
		
		String[] files = board.getFiles();
		
		if(files == null) {
			return;}
		
		for (String fileName : files) {
			dao.replaceAttach(fileName, bno);
		}
	}

	//첨부파일 정보와 게시물 삭제 작업 동시 처리
	@Transactional
	@Override
	public void remove(Integer bno) throws Exception {
		dao.deleteAttach(bno);
		dao.delete(bno);
		
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {

		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {

		return dao.countPaging(cri);
	}

	@Override
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	@Override
	public List<String> getAttach(Integer bno) throws Exception {
		
		return dao.getAttach(bno);
	}
}

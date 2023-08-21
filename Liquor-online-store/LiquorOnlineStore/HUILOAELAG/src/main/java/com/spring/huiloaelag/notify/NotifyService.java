package com.spring.huiloaelag.notify;

import java.util.List;

public interface NotifyService {
	//공지사항 목록 
	List<NotifyVO> NotifyList(NotifyVO vo);
	
	//공지사항 상세 
}

package com.kh.codelit.community.notice.controller;


import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.codelit.attachment.model.vo.Attachment;
import com.kh.codelit.common.HelloSpringUtils;
import com.kh.codelit.community.notice.model.service.NoticeService;
import com.kh.codelit.community.notice.model.vo.Notice;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/community")
@Slf4j
public class noticeController {
	
	@Autowired
	private NoticeService service;
	
	
	@GetMapping("/noticeList.do")
	public void selectBoard(@RequestParam(defaultValue = "1") int cPage, Model model, HttpServletRequest request) {

		int numPerPage = 10;
		//클릭한 페이지, 총게시글 수전달
		Map<String, Object> param = new HashMap<>();
		param.put("numPerPage", numPerPage);
		param.put("cPage", cPage);
		
		List<Notice> list = service.noticeList(param);
		
		int count = service.getListCount();
		String uri = request.getRequestURI();
		String pageBar = HelloSpringUtils.getPageBar(count, cPage, numPerPage, uri);
		
		model.addAttribute("list", list);
		model.addAttribute("pageBar", pageBar);
	}
	
	@GetMapping("/noticeWrite.do")
	public void writeAdminBoard() {
		
	}
	
	@PostMapping("/noticeInsert.do")
	public String Enroll(
				@ModelAttribute Notice notice,
				@RequestParam(required = false) MultipartFile upFile,
				HttpServletRequest request,
				RedirectAttributes redirect,
				Principal pri) throws IllegalStateException, IOException {
		
		log.debug("================upFile = {}", upFile.getOriginalFilename());
		String saveDirectory =  request.getServletContext().getRealPath(Attachment.PATH_NOTICE);
		
		File dir = new File(saveDirectory);
		if(!dir.exists())
			dir.mkdir();
		
		notice.setRefMemberId(pri.getName());

		int result = service.insertBoard(notice);
		log.debug("NO=========================={}", notice.getNoticeNo());
		if(!upFile.isEmpty() || upFile.getSize() > 0) {
		
			File renamedFile = HelloSpringUtils.getRenamedFile(saveDirectory, upFile.getOriginalFilename());
			//파일 저장
			upFile.transferTo(renamedFile);
			
			//Attachment객체생성
			Attachment attach = new Attachment(0,notice.getNoticeNo(),upFile.getOriginalFilename(),renamedFile.getName(),Attachment.CODE_NOTICE,Attachment.PATH_NOTICE);
			
			service.insertAttachment(attach);
		}

		String msg = result > 0 ?"등록완료 되었습니다.":"등록 실패하였습니다.";
		redirect.addFlashAttribute("msg",msg);
		return "redirect:/community/noticeList.do";
	}
	
	@GetMapping(value = {"/noticeDetail.do", "/noticeUpdate.do"})
	public void selectOneNotice(@RequestParam int noticeNo, Model model) {
	
		int result = service.updateCnt(noticeNo);
		Notice notice = service.selectOneNotice(noticeNo);
		model.addAttribute("notice",notice);
		Attachment attach = service.selectOneAttach(noticeNo);
		if(attach != null) {
			String attachPath = attach.getContentsAttachPath() +"/"+ attach.getRenamedFilename();
			model.addAttribute("attachPath", attachPath);
			model.addAttribute("attach",attach);			
		}
		
	}
	
	
	@GetMapping("/noticeDelete.do")
	public String deleteNotice(@RequestParam int noticeNo, RedirectAttributes redirect) {
		int attDel = service.deleteAttach(noticeNo);
		int result = service.delete(noticeNo);
		String msg = result > 0 ?"삭제 성공" : "삭제 실패";
		redirect.addFlashAttribute("msg", msg);
		return "redirect:/community/noticeList.do";
	}
	
	@PostMapping("/noticeUpdate.do")
	public String updateNotice(@ModelAttribute Notice notice, RedirectAttributes redirect) {
		int result = service.update(notice);
		String msg = result > 0 ? "수정 성공":"수정 실패";
		redirect.addFlashAttribute("msg",msg);
		
		return "redirect:/community/noticeDetail.do?noticeNo="+notice.getNoticeNo();
	}
}
	

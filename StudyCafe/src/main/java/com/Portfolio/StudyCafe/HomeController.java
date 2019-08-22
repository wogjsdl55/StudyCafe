package com.Portfolio.StudyCafe;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import com.Portfolio.StudyCafe.dao.MemberDao;
import com.Portfolio.StudyCafe.dao.ReviewDao;
import com.Portfolio.StudyCafe.dto.Member_Dto;
import com.Portfolio.StudyCafe.dto.Review_Dto;
import com.sun.org.apache.xalan.internal.xsltc.compiler.sym;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
/*	Dao dao; */
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@Autowired 
	private JavaMailSender mailSender;

/*	@Autowired
	public void setDao(Dao dao) {
		this.dao = dao;
	}
*/	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);	
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping("/send_mail")
	public String send_mail(HttpServletRequest request, Model model){
		String setfrom = request.getParameter("setfrom");
		String tomail = "shwogjs00@gmail.com"; // 받는 사람 이메일
		String title = request.getParameter("title") + "입니다"; // 제목
		String content = request.getParameter("content"); // 내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "UTF-8");
  
			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
			
			model.addAttribute("msg", "메일전송이 성공하였습니다.");
		} catch (Exception e) {
			System.out.println(e);
			model.addAttribute("msg", "메일전송이 실패하였습니다.");
		}

		return "/send_mail";
	}

	
	@RequestMapping("/member/member")
	public String member(Model model) {
		
		return "/member/member";
	}
	
	@RequestMapping("/member/member_edit")
	public String member_edit(HttpServletRequest request, Model model) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		ArrayList<Member_Dto> member_edit = dao.member_edit( Integer.parseInt(request.getParameter("seq") ));
		model.addAttribute("result", member_edit);

		return "/member/member_edit";
	}
	
	@RequestMapping("/member/member_edit_proc")
	public String member_edit_proc(HttpServletRequest request, Model model) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		dao.member_edit_proc( Integer.parseInt(request.getParameter("MSeq")), request.getParameter("MId"), request.getParameter("MPwd"), request.getParameter("MName"), request.getParameter("MEmail"), request.getParameter("MNick"));
		model.addAttribute("msg", "수정이 완료되었습니다.");
		return "/member/member_edit_proc";
	}
	
	@RequestMapping("/member/member_proc")
	public String member_proc(HttpServletRequest request, Model model ) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		if (request.getParameter("MId") == null & request.getParameter("MPwd") == null ) {
			model.addAttribute("msg", "잘못된 접근입니다.");	
			return "/member/member_proc";
		}
		
		dao.member_proc(request.getParameter("MId"), request.getParameter("MPwd"), request.getParameter("MName"), request.getParameter("MEmail"), request.getParameter("MNick"));
		model.addAttribute("msg", "회원가입이 완료되었습니다.");
		return "/member/member_proc";
	}
	
	@RequestMapping("/member/login")
	public String login(Model model) {
		
		return "/member/login";
	}
	
	@RequestMapping("/member/login_out")
	public String login_out(Model model, HttpSession session) {
		session.removeAttribute("login_result");
		model.addAttribute("msg", "로그아웃 되었습니다.");
		return "/member/login_out";
	}
	
	@RequestMapping("/member/login_proc")
	public String login_proc(HttpServletRequest request, Model model, HttpSession session) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		if (request.getParameter("MId") == null & request.getParameter("MPwd") == null ) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "/member/login_proc";
		}
		
		ArrayList<Member_Dto> login_result = dao.login_proc(request.getParameter("MId"), request.getParameter("MPwd") );
	
		/*기존에 login이란 세션 값이 존재한다면, 기존값을 제거*/
		if ( session.getAttribute("login_result") != null ){
			session.removeAttribute("login_result");
		} 
		if (login_result.isEmpty() ) {
			model.addAttribute("msg", "아이디 또는 비밀번호가 잘못되었습니다.");
		}else {
			session.setAttribute("login_result", login_result);
			model.addAttribute("msg", "로그인 되었습니다.");
		}
		
		return "/member/login_proc";
	}
	
	@RequestMapping("/member/naver_login")
	public String naver_member(Model model, HttpSession session) {
	
		return "/member/naver_login";
	}

	@RequestMapping("/review/review")
	public String review_list(Model model) {
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		model.addAttribute("review_list", dao.review_list());
		
		return "/review/review";
	}
	
	@RequestMapping("/review/review_write")
	public String review_write(Model model) {
		return "/review/review_write";
	}
	
	@RequestMapping("/review/review_write_proc")
	public String review_write(HttpServletRequest request, Model model) {
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		dao.review_write(request.getParameter("RSubject"), request.getParameter("RComment"), Integer.parseInt(request.getParameter("MStar")), request.getParameter("MId"), request.getParameter("MNick") );
		
		model.addAttribute("msg", "글 작성이 완료 되었습니다.");
		return "/review/review_write_proc";
	}
	
	@RequestMapping("/review/review_view")
	public String review_view(HttpServletRequest request, Model model) {
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		
		dao.review_view_count(Integer.parseInt(request.getParameter("seq")) );
		  
		ArrayList<Review_Dto> view_result = dao.review_view(Integer.parseInt(request.getParameter("seq")) );
		model.addAttribute("result", view_result);
		
		ArrayList<Review_Dto> reply_list = dao.reply_list(Integer.parseInt(request.getParameter("seq")) );
		model.addAttribute("result_list", reply_list);

		return "/review/review_view";
	}
	
	
	@RequestMapping(value="/review/review_reply_ajax", produces="text/json; charset=utf-8", method=RequestMethod.POST)
	public  @ResponseBody String reply_proc(HttpServletRequest request, Model model ) {
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);

		dao.review_reply_proc(Integer.parseInt(request.getParameter("RSeq")), request.getParameter("ReComment"), request.getParameter("MNick") );

		return "/review/review_view";
	}
}

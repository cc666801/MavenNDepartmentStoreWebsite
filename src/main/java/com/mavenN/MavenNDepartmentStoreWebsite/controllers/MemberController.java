package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.memberSystem.MemberRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.EmailService;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	@Autowired
	private MemberRepository mRepository;
	@Autowired
	private EmailService emailService;

	// 跳轉會員中心時把新的資料塞入
	@GetMapping("/memberCentre")
	public String jumpPage(HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		Member updatedMember = mService.findMemberById(member.getId());
		session.setAttribute("member", updatedMember);
		return "member/memberCentre";
	}

//----------------------------------------------------------------------------------------
	// 搜索所有會員
	@GetMapping("/memberList")
	public String findAllLostBack(Model model) {
		List<Member> findAllMember = mService.findAllMember();
		model.addAttribute("memberList", findAllMember);
		return "member/memberList";
	}

	// 搜索單筆修改會員
	@GetMapping("/member/{id}")
	public String findMemberById(@PathVariable Integer id, Model model) {
		Member member = mService.findMemberById(id);
		model.addAttribute("member", member);
		return "redirect:/memberCentre";

	}
//-----------------------------------------------------------------------------------------------
	// 更新會員資料
	@GetMapping("/member/edit/{id}")
	public String editMember(@PathVariable("id") Integer id, Model model) {
		Member mem = mService.findMemberById(id);
		model.addAttribute("member", mem);
		return "member/editMember";
	}

	@PutMapping("/member/edit/{id}")
	public String updateMember(@PathVariable Integer id, @ModelAttribute("member") Member member, Model model) {
		member.setId(id);
		mService.updateMemberById(id, member);
		return "redirect:/member/{id}";
	}

	// 修改會員密碼
	@GetMapping("/member/editPassword/{id}")
	public String editMemberPassword(@PathVariable("id") Integer id, Model model) {
		Member mem = mService.findMemberById(id);
		model.addAttribute("member", mem);
		return "member/editMemberPassword";
	}

	@PutMapping("/member/editPassword/{id}")
	public String updateMemberPassword(@PathVariable Integer id, @ModelAttribute("member") Member member, Model model) {
		member.setId(id);
		mService.updateMemberById(id, member);
		return "redirect:/member/logout";
	}
//-----------------------------------------------------------------------------------------------
	// 更改會員權限
	@PostMapping("/updatePermission/{id}")
	public String updatePermission(@PathVariable Integer id) {
		Member member = mRepository.findById(id).orElse(null);
		if (member != null) {
			if (member.getPermissions().equals("會員")) {
				member.setPermissions("管理員");
			} else if (member.getPermissions().equals("管理員")) {
				member.setPermissions("會員");
			}
			mRepository.save(member);
		}
		return "redirect:/memberList"; // 重新導向到會員列表頁面
	}

	// 刪除會員資料
	@DeleteMapping("/memberdelete/{id}")
	public String deleteMember(@PathVariable Integer id) {
		mService.deleteMemberById(id);
		return "redirect:/memberList";
	}

//--------------------------------------------------------------------------
	// 註冊會員
	@GetMapping("/member/register")
	public String addMember(Model model) {
		model.addAttribute("member", new Member());
		return "member/addMemberPage";// 跳到JSP

	}

	@PostMapping("/member/post")
	public String postMember(@ModelAttribute("member") Member mem, Model model) {
		Optional<Member> existingMember = mRepository.findByAccount(mem.getAccount());
		if (existingMember.isPresent()) {
			model.addAttribute("error", "該帳號已經存在");
			return "member/addMemberPage";
		} else {
			mService.addMember(mem);
			return "member/jump";
		}
	}

	// 會員登入
	@GetMapping("/member/login")
	public String loginMember(Model model) {
		model.addAttribute("member", new Member());
		return "member/login";
	}

	@PostMapping("/member/login")
	public String postLoginMember(@ModelAttribute("member") Member mem, Model model, HttpSession session) {
		Optional<Member> memberOpt = mRepository.findByAccount(mem.getAccount());
		if (memberOpt.isPresent() && memberOpt.get().getPassword().equals(mem.getPassword())) {
			session.setAttribute("member", memberOpt.get());
			return "member/jump";
		} else {
			model.addAttribute("error", "帳號或密碼錯誤");
			return "member/login";
		}
	}

	@GetMapping("/member/logout")
	public String logout(HttpSession session) {
		// 刪除session中的會員資訊
		session.removeAttribute("member");
		// 重定向到首頁
		return "member/jump";
	}

//-------------------------------------------------------------------------------------------------------------------------
	// 驗證信
	@GetMapping("/member/verifyEmail")
	public String verifyEmail(HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("verify");

		model.addAttribute("member", member);
		model.addAttribute("success", false);
		model.addAttribute("failure", false);
		return "member/verifyEmailPage";
	}

	@PostMapping("/member/verifyEmail")
	public String sendVerificationEmail(HttpSession session, Model model, @ModelAttribute("member") Member member) {
		String token = UUID.randomUUID().toString();
		member.setToken(token); // 設置 token 值
		mService.addMember(member);
		emailService.sendVerificationEmail(member, token);
		member.setVerify("未驗證");
		mRepository.save(member);
		session.removeAttribute("verify");
		return "redirect:/memberCentre";
	}

	@GetMapping("/member/verify")
	public String verifyMember(@RequestParam(name = "token", required = true) String token) {
		Member member = mRepository.findByToken(token);
		if (member != null) {
			member.setVerify("已驗證");
			mRepository.save(member);
			return "member/emailSucessJump";
		} else {
			return "member/emailFailJump";
		}
	}

}

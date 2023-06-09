package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.Arrays;
import java.util.HashMap;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.mavenN.MavenNDepartmentStoreWebsite.annotation.MemberLogin;
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
	@MemberLogin
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
	@MemberLogin
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
	@MemberLogin
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
			if (member.getPermissions().equals("一般會員")) {
				member.setPermissions("管理員");
			} else if (member.getPermissions().equals("管理員")) {
				member.setPermissions("一般會員");
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
		Optional<Member> existingMember2 = Optional.ofNullable(mRepository.findByEmail(mem.getEmail()));
		if (existingMember.isPresent()) {
			model.addAttribute("error", "該帳號已經存在");
			return "member/addMemberPage";
		}
		if (existingMember2.isPresent()) {
			model.addAttribute("error", "該信箱已經存在");
			return "member/addMemberPage";
		} else {
			mService.addMember(mem);
			return "redirect:/member/login";
		}
	}

	// 會員登入
	@GetMapping("/member/login")
	public String loginMember(Model model, HttpSession session, HttpServletRequest request) {
		String previousUrl = request.getHeader("Referer");
		if (previousUrl != null && !previousUrl.contains("/member/login")) {
			session.setAttribute("previousUrl", previousUrl);
		}
		model.addAttribute("member", new Member());
		return "member/login";
	}

	@PostMapping("/member/login")
	public String postLoginMember(@ModelAttribute("member") Member mem, Model model, HttpSession session,
			HttpServletRequest request) {
		Optional<Member> memberOpt = mRepository.findByAccount(mem.getAccount());
		if (memberOpt.isPresent() && memberOpt.get().getPassword().equals(mem.getPassword())) {
			session.setAttribute("member", memberOpt.get());

			
			String previousUrl = (String) session.getAttribute("previousUrl");
			// 如果上一個頁面是註冊頁面，則將導向到首頁
			if (previousUrl != null && previousUrl.contains("/member/register")) {
				return "redirect:/";
			}
			// 取得上一個頁面的 URL
			if (previousUrl != null && !previousUrl.contains("/member/login")) {
				session.removeAttribute("previousUrl");
				return "redirect:" + previousUrl;
			}

			return "redirect:/";
		} else {
			model.addAttribute("error", "帳號或密碼錯誤");
			return "member/login";
		}
	}

	// 會員登出
	@GetMapping("/member/logout")
	public String logout(HttpSession session) {
		// 刪除session中的會員資訊
		session.removeAttribute("member");
		// 重定向到首頁
		return "redirect:/";
	}

//-------------------------------------------------------------------------------------------------------------------------
	// 信箱驗證信
	@MemberLogin
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
		return "member/emailSendSucess";
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

//-------------------------------------------------------------------------------------------------------------------------
	// 忘記密碼驗證信
	// 顯示忘記密碼頁面
	@GetMapping("/member/forgotPassword")
	public String showForgotPassword() {
		return "member/forgotPasswordPage";
	}

	// 發送重設密碼驗證信
	@PostMapping("/member/sendResetPasswordEmail")
	public String sendResetPasswordEmail(@RequestParam("email") String email, Model model) {
		Member member = mRepository.findByEmail(email);
		if (member == null) {
			model.addAttribute("error", "該電子郵件地址未被註冊！");
			return "member/forgotPasswordPage";
		} else {
			String token = UUID.randomUUID().toString();
			member.setToken(token);
			mRepository.save(member);
			emailService.sendVerificationPassword(member, token);
			model.addAttribute("success", "驗證信已發送至您的電子郵件，請查收！");
			return "member/emailSendSucess";
		}
	}

	// 顯示重設密碼頁面
	@GetMapping("/member/resetPassword")
	public String showResetPassword(@RequestParam("token") String token, Model model) {
		Member member = mRepository.findByToken(token);
		if (member == null) {
			model.addAttribute("error", "該驗證鏈接無效或已過期！");
			return "member/emailFailJump";
		} else {
			model.addAttribute("member", member);
			return "member/resetPasswordPage";
		}
	}

	// 提交重設密碼表單
	@PostMapping("/member/resetPassword")
	public String resetPassword(@ModelAttribute("member") Member member, Model model) {
		Member originalMember = mRepository.findByEmail(member.getEmail());
		if (originalMember == null) {
			model.addAttribute("error", "該用戶不存在！");
			return "member/emailFailJump";
		} else {
			originalMember.setPassword(member.getPassword());
			originalMember.setToken(null);
			mRepository.save(originalMember);
			model.addAttribute("success", "密碼已成功重設！");
			return "redirect:/member/logout";
		}
	}
	
//----------------------------------------------------------------------------------------------
	@GetMapping("/privacy")
	public String privacy() {
		return "member/privacy";
	}

//----------------------------------------------------------------------------------------------
	
	//抽點數頁面
	// 抽点数页面
    @MemberLogin
    @GetMapping("/game")
    public String showGamePage(Model model, HttpSession session) {
        Member member = (Member) session.getAttribute("member");
        model.addAttribute("member", member);
        return "member/game";
    }
  
    @MemberLogin
    @PostMapping("/game/play")
    @ResponseBody
    public Map<String, Object> playGame(HttpSession session) {
        Member member = (Member) session.getAttribute("member");
        int[] probabilities = {1, 36, 25, 10, 7, 6, 5, 5, 5};
        int[] points = {100, 1, 2, 3, 4, 5, 6, 7, 8};
        Random random = new Random();
        int index = getRandomIndex(probabilities, random);
        int point = points[index];
        member.setPoints(member.getPoints() + point);
        mService.updateMember(member);
        Map<String, Object> response = new HashMap<>();
        response.put("point", point);
        response.put("totalPoints", member.getPoints());
        return response;
    }
  
    private int getRandomIndex(int[] probabilities, Random random) {
        int sum = Arrays.stream(probabilities).sum();
        int rand = random.nextInt(sum);
        int index = 0;
        int cumulativeSum = probabilities[0];
        while (rand >= cumulativeSum && index < probabilities.length - 1) {
            index++;
            cumulativeSum += probabilities[index];
        }
        return index;
    }





}

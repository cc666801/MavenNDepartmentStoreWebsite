package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.mavenN.MavenNDepartmentStoreWebsite.models.services.ChatGptService;

@RestController
@RequestMapping("/chat")
public class ChatGptController {
    
    @Autowired
    private ChatGptService chatGptService;

    @PostMapping
    public ResponseEntity<Map<String, String>> getChatResponse(@RequestBody Map<String, String> requestBody) {
        try {
        	
        	
        	 String userInput = requestBody.get("prompt");
             String websiteContent = "使用繁體中文，你現在是一個叫做'MavenN百貨'的百貨公司網站裡的智能客服，"
                     + "如果有人詢問你關於'美食'的問題，請引導他到'http://localhost:8080/MavenNDepartmentStoreWebsite/restaurantfront\">http://localhost:8080/MavenNDepartmentStoreWebsite/restaurantfront'"
                     + "如果有人詢問你關於'商品'的問題，請引導他到'http://localhost:8080/MavenNDepartmentStoreWebsite/Store/Commodity/findAllComm\">http://localhost:8080/MavenNDepartmentStoreWebsite/Store/Commodity/findAllComm'"
                     + "如果有人詢問你關於'廠商'或'樓層'的問題，請引導他到'http://localhost:8080/MavenNDepartmentStoreWebsite/company/floor\">http://localhost:8080/MavenNDepartmentStoreWebsite/company/floor'";
             String prompt = websiteContent + " " + userInput; // 將使用者輸入和網站相關的內容結合在一起
            
//            String prompt = requestBody.get("prompt");
            String response = chatGptService.sendGPTRequest(prompt);
            Map<String, String> responseBody = new HashMap<>();
            responseBody.put("response", response);
            return ResponseEntity.ok(responseBody);
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.SC_INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping
    public ModelAndView getChatPage() {
        ModelAndView modelAndView = new ModelAndView("/customerService/chat/chatBot");
        modelAndView.addObject("response", "您好,請問有什麼需要幫助的嗎?");
        return modelAndView;
    }
}
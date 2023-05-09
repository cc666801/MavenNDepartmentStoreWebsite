package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.mavenN.MavenNDepartmentStoreWebsite.models.services.ChatGptService;

@RestController
public class ChatGptController {

private final ChatGptService chatGptService;

public ChatGptController(ChatGptService chatGptService) {
    this.chatGptService = chatGptService;
}

@PostMapping("/chat")
public ResponseEntity<Map<String, String>> getChatResponse(@RequestBody Map<String, String> requestBody) {
    try {
        String prompt = requestBody.get("prompt");
        String response = chatGptService.getChatResponse(prompt);
        Map<String, String> responseBody = new HashMap<>();
        responseBody.put("response", response);
        return ResponseEntity.ok(responseBody);
    } catch (IOException e) {
        e.printStackTrace();
        return ResponseEntity.status(HttpStatus.SC_INTERNAL_SERVER_ERROR).build();
    }
}

@GetMapping("/chat")
public ModelAndView getChatPage() {
    ModelAndView modelAndView = new ModelAndView("/customerService/chat/chatBot");
    modelAndView.addObject("message", "Welcome to the chat page!");
    return modelAndView;
}
}
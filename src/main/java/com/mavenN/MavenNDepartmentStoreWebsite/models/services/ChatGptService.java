package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class ChatGptService {
    private final CloseableHttpClient httpClient;

    @Value("${chatgpt.apiKey}")
    private String apiKey;

    private List<String> chatHistory;
    public ChatGptService(CloseableHttpClient httpClient) {
        this.httpClient = httpClient;
        this.chatHistory = new ArrayList<>();
    }

    public String getChatResponse(String prompt) throws IOException {
    	String model = "gpt-3.5-turbo";
    	JSONObject requestBody = new JSONObject();
        requestBody.put("model", model);
        requestBody.put("prompt", prompt);
        requestBody.put("temperature", 0.7);
        requestBody.put("max_tokens", 60);
        requestBody.put("stop", "\n");
        JSONArray messages = new JSONArray();
        for (String message : chatHistory) {
            messages.put(new JSONObject().put("role", "user").put("content", message));
        }
        messages.put(new JSONObject().put("role", "user").put("content", prompt));
        requestBody.put("messages", messages);
        String requestBodyString = requestBody.toString();
        
        HttpPost request = new HttpPost("https://api.openai.com/v1/chat/completions");
        StringEntity params = new StringEntity(requestBodyString, StandardCharsets.UTF_8);
        request.addHeader("Authorization", "Bearer " + apiKey);
        request.addHeader("content-type", "application/json");
        request.setEntity(params);

        try (CloseableHttpResponse response = httpClient.execute(request)) {
            HttpEntity entity = response.getEntity();
            String responseBody = EntityUtils.toString(entity);
            JSONObject responseJson = new JSONObject(responseBody);
            JSONArray choices = responseJson.getJSONArray("choices");
            JSONObject textObject = choices.getJSONObject(0);
            String text = textObject.getString("text");
            chatHistory.add(prompt);
            return text;
        }
    }
        
}
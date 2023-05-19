package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.io.IOException;
import java.nio.charset.StandardCharsets;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;


@Service
public class ChatGptService {

    // GPT API Endpoint
    private static final String API_URL = "https://api.openai.com/v1/chat/completions";

    // GPT API Authorization Token
    @Value("${gpt.apiKey}")
    private String apiKey;

    // ChatGPT API Request
    public String sendGPTRequest(String content) throws IOException {
    	String model = "gpt-3.5-turbo";
        JSONObject requestBody = new JSONObject();
        requestBody.put("model", model);
        requestBody.put("messages", new JSONArray().put(new JSONObject().put("role", "user").put("content", content)));
//        requestBody.put("prompt", content);
        requestBody.put("max_tokens", 500);
        requestBody.put("temperature", 0.6);
        String requestBodyString = requestBody.toString();
        HttpPost request = new HttpPost(API_URL);
        StringEntity params = new StringEntity(requestBodyString, StandardCharsets.UTF_8);
        request.addHeader("Authorization", "Bearer " + apiKey);
        request.addHeader("content-type", "application/json");
        request.setEntity(params);

        try (CloseableHttpClient httpClient = HttpClientBuilder.create().build()) {
            CloseableHttpResponse response = httpClient.execute(request);
            String responseBody = EntityUtils.toString(response.getEntity());
            String responseContent = getContentFromJsonString(responseBody);
            return responseContent;
        }
    }

    // Process GPT Response
    public String getContentFromJsonString(String jsonString) {
    	 ObjectMapper objectMapper = new ObjectMapper();
         try {
//             System.out.println("客服GPT " + jsonString);
             JsonNode rootNode = objectMapper.readTree(jsonString);

             String content = rootNode.get("choices").get(0).get("message").get("content").asText();

             return content;
         } catch (Exception e) {
             e.printStackTrace();
             return null;
         }
    }
}
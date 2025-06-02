package com.mid.product.service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import org.apache.hc.client5.http.classic.methods.HttpPost; // HTTP POST 요청
import org.apache.hc.client5.http.impl.classic.CloseableHttpClient; // HttpClient 객체 (클라이언트)
import org.apache.hc.client5.http.impl.classic.CloseableHttpResponse; // API 응답 처리
import org.apache.hc.client5.http.impl.classic.HttpClients; // HttpClient 생성 팩토리
import org.apache.hc.core5.http.io.entity.StringEntity; // 요청 본문 (JSON) 처리
import org.apache.hc.core5.http.io.entity.EntityUtils; // 응답 본문 읽기
import org.springframework.stereotype.Service;

import java.nio.charset.StandardCharsets;

@Service
public class GeminiService {
    // Google Gemini API Key (본인 API Key로 교체 필요)
    private static final String API_KEY = "AIzaSyBbmc7fQJCA6G3K0tx5n4KQvPHH3R0QzQs";

    // Gemini API 요청 URL (모델: gemini)
    private static final String ENDPOINT = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-pro-latest:generateContent?key=" + API_KEY;


    /**
     * 사용자가 입력한 메시지를 받아 Google Gemini API에 요청을 보내고,
     * 응답 결과(추천 응답)를 문자열로 반환하는 메서드.
     */
    public String getChatbotResponse(String userInput) throws Exception {
        // Gemini API에 전달할 JSON 데이터 생성
        JsonObject prompt = new JsonObject(); // 전체 요청 JSON
        JsonArray contents = new JsonArray(); // contents 배열
        JsonObject content = new JsonObject(); // content 객체
        JsonArray parts = new JsonArray(); // parts 배열 (사용자 입력 담음)
        JsonObject textPart = new JsonObject(); // text 파트 (사용자 입력)

        textPart.addProperty("text", userInput); // 사용자 입력 넣기
        parts.add(textPart);
        content.add("parts", parts);
        contents.add(content);
        prompt.add("contents", contents);

        // HTTP 요청 실행 (try-with-resources: 자동 닫힘)
        try (CloseableHttpClient client = HttpClients.createDefault()) {
            HttpPost post = new HttpPost(ENDPOINT); // POST 요청 생성
            post.setHeader("Content-Type", "application/json"); // 요청 헤더: JSON
            post.setEntity(new StringEntity(prompt.toString(), StandardCharsets.UTF_8)); // 요청 본문 (JSON)
            
            Thread.sleep(5000); // 1초 대기 (1000ms)
            
            // API 요청 실행 후 응답 받기
            try (CloseableHttpResponse response = client.execute(post)) {
                int statusCode = response.getCode(); // HTTP 상태 코드 확인
                if (statusCode >= 200 && statusCode < 300) {
                    // 응답 본문(JSON) 반환
                    return EntityUtils.toString(response.getEntity(), StandardCharsets.UTF_8);
                } else {
                    // 상태 코드 200번대가 아닌 경우 예외 발생
                    throw new RuntimeException("API 호출 실패: 상태 코드 = " + statusCode);
                }
            }
        }
    }
}

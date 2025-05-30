package com.mid.mainchatbot.controller;

import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

// BotController.java
@Controller
@RequestMapping("/deskset/chat")
public class BotController {

	@PostMapping(produces = "text/plain; charset=UTF-8")
    @ResponseBody
    public String getChatResponse(@RequestParam("question") String question) {
        try {
            RestTemplate restTemplate = new RestTemplate();
            String flaskUrl = "http://127.0.0.1:5000/?question=" + URLEncoder.encode(question, "UTF-8");

            String response = restTemplate.getForObject(flaskUrl, String.class);
            return response;
        } catch (Exception e) {
            e.printStackTrace();
            return "Error: " + e.getMessage();
        }
    }
}

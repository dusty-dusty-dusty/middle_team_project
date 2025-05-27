package com.mid.chatbot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController//restAPI에 최적화
@RequestMapping("/api/chat") //챗봇 API경로
public class ChatbotController {
	
	@Autowired
	private AIService aiService;
	
	
}

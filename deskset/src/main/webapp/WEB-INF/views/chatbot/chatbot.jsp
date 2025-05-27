
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Java 11 호환 방식으로 JSON 문자열 생성 (수정된 버전)
    String faqsJsonData = "["
        + "  {"
        + "    \"id\": 1,"
        + "    \"category\": \"배송\","
        + "    \"question\": \"배송은 보통 얼마나 걸리나요?\","
        // 아래 answer와 같이 긴 문자열은 내용상 줄바꿈이 필요하면 \\n을 사용하고,
        // Java 코드 가독성을 위해 여러 줄로 나눌 때는 각 줄을 따옴표로 감싸고 +로 연결합니다.
        + "    \"answer\": \"일반적으로 주문 후 평균 2~3일(영업일 기준) 이내에 배송됩니다. "
        + "다만, 지역 및 택배사 사정에 따라 조금 더 소요될 수 있습니다. "
        + "제주도 및 도서산간 지역은 1~2일 추가될 수 있습니다.\","
        + "    \"keywords\": [\"배송\", \"기간\", \"얼마나\", \"걸리나요\", \"언제와요\", \"도착\"]"
        + "  },"
        + "  {"
        + "    \"id\": 2,"
        + "    \"category\": \"배송\","
        + "    \"question\": \"배송비는 얼마인가요?\","
        + "    \"answer\": \"기본 배송비는 3,000원입니다. 5만원 이상 구매 시 무료 배송해 드립니다. "
        + "제주도 및 도서산간 지역은 추가 배송비가 발생할 수 있습니다.\","
        + "    \"keywords\": [\"배송비\", \"얼마\", \"무료배송\", \"가격\", \"요금\"]"
        + "  },"
        + "  {"
        + "    \"id\": 3,"
        + "    \"category\": \"결제\","
        + "    \"question\": \"어떤 결제 수단을 사용할 수 있나요?\","
        + "    \"answer\": \"신용카드, 무통장 입금, 계좌 이체, 휴대폰 소액결제 등 다양한 결제 수단을 지원합니다. "
        + "자세한 내용은 결제 페이지를 참고해주세요.\","
        + "    \"keywords\": [\"결제\", \"수단\", \"방법\", \"카드\", \"무통장\", \"계좌이체\", \"휴대폰\"]"
        + "  },"
        + "  {"
        + "    \"id\": 4,"
        + "    \"category\": \"반품/교환\","
        + "    \"question\": \"상품 반품이나 교환은 어떻게 하나요?\","
        + "    \"answer\": \"상품 수령 후 7일 이내에 고객센터나 마이페이지를 통해 반품 또는 교환 신청을 하실 수 있습니다. "
        + "단순 변심의 경우 왕복 배송비가 부과될 수 있으며, 상품 하자 시에는 저희가 부담합니다.\","
        + "    \"keywords\": [\"반품\", \"교환\", \"환불\", \"방법\", \"신청\", \"절차\"]"
        + "  },"
        + "  {"
        + "    \"id\": 5,"
        + "    \"category\": \"상품\","
        + "    \"question\": \"상품 사이즈는 어떻게 확인하나요?\","
        + "    \"answer\": \"각 상품 상세 페이지 하단에 사이즈 표가 제공됩니다. "
        + "가지고 계신 옷과 실측 사이즈를 비교해보시는 것이 가장 정확합니다. "
        + "궁금한 점은 언제든 문의주세요.\","
        + "    \"keywords\": [\"상품\", \"사이즈\", \"크기\", \"어떻게\", \"확인\", \"측정\"]"
        + "  },"
        + "  {"
        + "    \"id\": 6,"
        + "    \"category\": \"계정\","
        + "    \"question\": \"회원가입은 어떻게 하나요?\","
        + "    \"answer\": \"홈페이지 상단의 '회원가입' 메뉴를 통해 간단한 정보 입력 후 가입하실 수 있습니다. "
        + "다양한 혜택이 준비되어 있으니 많은 이용 바랍니다.\","
        + "    \"keywords\": [\"회원가입\", \"가입\", \"아이디\", \"계정\", \"만들기\"]"
        + "  },"
        + "  {"
        + "    \"id\": 7,"
        + "    \"category\": \"기타\","
        + "    \"question\": \"고객센터 운영시간은 어떻게 되나요?\","
        + "    \"answer\": \"고객센터는 평일 오전 9시부터 오후 6시까지 운영됩니다. (점심시간: 12시~1시) "
        + "주말 및 공휴일은 휴무입니다.\","
        + "    \"keywords\": [\"고객센터\", \"운영시간\", \"문의\", \"상담\", \"전화번호\", \"언제\"]"
        + "  }"
        + "]";
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>챗봇 테스트</title>
<style>
        body {
            font-family: sans-serif;
            margin: 0; /* body 마진 제거 */
            padding-bottom: 100px; /* 챗봇 버튼과 겹치지 않도록 하단 여백 */
        }
        .main-page-content {
            padding: 20px;
            min-height: 150vh; /* 페이지 스크롤 테스트용 */
        }
        .main-page-content h1 {
            color: #333;
        }
        .main-page-content p {
            line-height: 1.6;
            color: #555;
        }

        /* 챗봇 토글 버튼 */
        #chatbotToggleButton {
            position: fixed;
            bottom: 30px;
            right: 30px;
            width: 60px;
            height: 60px;
            background-color: #007bff;
            color: white;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 28px; /* 아이콘 크기 */
            cursor: pointer;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
            z-index: 999;
            transition: background-color 0.3s ease;
        }
        #chatbotToggleButton:hover {
            background-color: #0056b3;
        }

        /* 플로팅 챗봇 컨테이너 */
        .chat-container {
            position: fixed;
            bottom: 100px; /* 토글 버튼 위로 위치 조정 */
            right: 30px;
            width: 360px;   /* 너비 조정 */
            max-height: 70vh; /* 화면 높이에 따라 최대 높이 조정 */
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
            z-index: 1000;
            display: none; /* 초기에는 숨김 */
            flex-direction: column; /* 내부 요소 세로 정렬 */
            overflow: hidden; /* 내부 스크롤 관리 용이 */
        }

        /* 챗봇 헤더 */
        .chat-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 15px;
            background-color: #f0f2f5; /* 헤더 배경색 변경 */
            border-bottom: 1px solid #ddd;
            border-top-left-radius: 10px; /* 컨테이너와 일치 */
            border-top-right-radius: 10px; /* 컨테이너와 일치 */
        }
        .chat-header h2 {
            margin: 0;
            font-size: 16px;
            font-weight: 600;
            color: #333;
        }
        .chat-header #closeChatButton {
            background: none;
            border: none;
            font-size: 24px; /* 닫기 버튼 크기 조정 */
            font-weight: bold;
            color: #777;
            cursor: pointer;
            padding: 0;
            line-height: 1;
        }
        .chat-header #closeChatButton:hover {
            color: #333;
        }

        /* 챗봇 메시지 출력 영역 */
        .chat-output {
            flex-grow: 1; /* 남은 공간 모두 차지 */
            overflow-y: auto;
            padding: 15px;
            background-color: #ffffff;
            min-height: 200px; /* 최소 높이 확보 */
        }
        .chat-output div { /* 각 메시지 버블 */
            margin-bottom: 12px;
            padding: 10px 14px;
            border-radius: 18px; /* 좀 더 둥글게 */
            max-width: 85%; /* 메시지 최대 너비 */
            word-wrap: break-word; /* 긴 단어 자동 줄바꿈 */
            line-height: 1.5;
        }
        .user-message {
            background-color: #007bff; /* 사용자 메시지 색상 변경 */
            color: white;
            margin-left: auto; /* 오른쪽 정렬 */
            border-bottom-right-radius: 5px; /* 한쪽 모서리 각지게 */
        }
        .bot-message {
            background-color: #f0f2f5; /* 봇 메시지 색상 변경 */
            color: #333;
            margin-right: auto; /* 왼쪽 정렬 */
            border-bottom-left-radius: 5px; /* 한쪽 모서리 각지게 */
        }
        .bot-message strong { /* FAQ 질문 부분 강조 */
            color: #0056b3; /* 좀 더 진한 파란색 */
            font-weight: 600;
            display: block; /* 블록 요소로 만들어 줄바꿈 유도 */
            margin-bottom: 4px;
        }

        /* 입력 영역 */
        .input-area {
            display: flex;
            padding: 12px;
            border-top: 1px solid #ddd;
            background-color: #f8f9fa;
        }
        .input-area input {
            flex-grow: 1;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 20px; /* 둥근 입력창 */
            margin-right: 8px;
            font-size: 14px;
        }
        .input-area input:focus {
            outline: none;
            border-color: #007bff;
            box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
        }
        .input-area button {
            padding: 10px 15px;
            border: none;
            background-color: #007bff;
            color: white;
            border-radius: 20px; /* 둥근 버튼 */
            cursor: pointer;
            font-size: 14px;
            font-weight: 500;
            transition: background-color 0.2s ease;
        }
        .input-area button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="chat-container">
	<h1>예시 메인페이지 입니다~</h1>
	<p>페이지 하단 콘텐츠</p>
</div>

<div id ="chatbottoggleButton" title="FAQ 챗봇열기">
<span>💬</span></div>

<div class="chat-output" id ="chatQutput">
	<div class="bot-message">안녕하세요! 궁금한 점을 물어보세요</div>
</div>

<div class="input-area">
	<input type="text" id ="userInput" placeholder="질문을 입력하세요..." onkeypress="handleKeyPress(event)">
	<!-- 이 HTML 요소에서 사용자가 키보드의 (문자) 키를 누를 때마다, handleKeyPress라는 JavaScript 함수를 호출하고, 그때 발생한 이벤트에 대한 정보를 event라는 이름의 인자로 그 함수에 넘겨줘라." -->
	<button onclick ="askQuestion()">전송</button>
	
	</div>
</div>
<script>
// JSP로부터 FAQ 데이터를 JavaScript 변수에 할당
const faqsJsonString = `<%= faqsJsonData %>`; //js환경에서 서버측의 java변수값을 클라이언트측의 javascript 변수로 전달
const allFaqs = JSON.parse(faqsJsonString); //allFaqs라는 상수에 저장 FAQ데이터에 접근 

const chatContainer =document.getElementById('chatContainer'); //챗봇 UI를 감싸는 컨테이너
const chatbotToggleButton = document.getElementById('chatbotToggleButton');
const closeChatButton =document,getElementById('closeChatButton');
const chatOutput = document.getElementById('chatOutput');
const userInput = document.getElementById('userInput');

//챗봇 창을 열고 닫는 토글 기능 구현

chatbotToggleButtom.onclick=function(){
	if(chatContainer.style.display ==='none' || chatContainer.style.display===''){
		chatContainer.style.display='flex'; 
		userInput.focus(); //챗봇 창 열릴때 입력창 포커스
	}else{
		chatContainer.style.display='none';
	}
	
}

closeChatButton.onlclick=function(){
	chatContainer.style.display='none';
};

//메시지 표시함수
function displayMessage(message,sender){
	const messageDiv =document.createElement('div'); //새로운 </div>요소를 생성하고 이 div는 메시지 버블(말 풍선안에 넣는것처럼 메시지가 담겨져있음)
	
	messageDiv.classList.add(sender==='user'? 'user-message' : 'bot-message'); 
	//메시지를 보낸 주체에 따라 css클래스를 추가하고 
	//이를 통해 사용자 메시지와 봇메시지를 시각적으로 다르게 스타일링
	
	messageDiv.innerHtml =message.replace(/\n/g, "<br>");
	
	chatOutput.appendchild(messageDiv);
	//준비된 메시지</div>를 채팅 출력 영역의 자식 요소로 추가하여 화면에 표시
	
	chatOutput.scrollTop =chatOutput.scrollHeight
	//메시지 추가후 채팅
}

	//Enter키 입력 처리 
	function handlekeyPress(event){
		if(event.key==="Enter"){
			askQuestion();
		}
	}
	
	//질문 전송 및 답변 처리 함수
	async function askQuestion(){
		const questionText =userInput.value.trim();//사용자가 입력한 질문텍스트를 가져오고,앞뒤 공백을 제거
		
		if(!questionText)return; //만약 입력된 텍스트가 없다면 함수를 종료
		
		displayMessage(questionText,'user'); //사용자가 입력한 질문을 채팅창에 'user'메시지로 표시
		
		userInput.value=''; //사용자 입력창을 비움
		
		try{
			
			const response =await fetch('/ask_gemini_faq',{
				method:'POST',
				headers:{
					'Content-Type':'application/json',//요청 본문의 데이터 타입이 json을 명시
					
				},
				body:json.stringfy({question:questionText}),//json.stringify()는  javascript값이나 객체를 json 문자열로 변환하는 역활
			});
			if(!response.ok){
				let errorMessage='서버 통신중 오류가 발생했습니다.';
			try{
				const errorData = await response.json(); //오류 응답 본문이 json형태일경우 파싱
				errorMessage =errorData.error ||errorMessage;
				
			}
			}
		}
	}
	
	
	
</script>



</body>
</html>
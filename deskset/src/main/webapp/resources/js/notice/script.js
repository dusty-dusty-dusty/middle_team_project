document.addEventListener('DOMContentLoaded', () => { //html문서가 완전히 
    // HTML 요소 가져오기 (chatbot.jsp에 정의된 ID 사용)
    const chatbotButton = document.getElementById('chatbot-button');//챗봇 아이콘(플로팅 버튼)
    const chatbotWindow = document.getElementById('chatbot-window');//챗봇 대화창 전체
    const closeChatbotButton = document.getElementById('close-chatbot'); // 챗봇창 닫기 버튼
    const chatbotMessagesContainer = document.getElementById('chatbot-message'); // 메시지들이 표시될 컨테이너 영역
    const chatbotInput = document.getElementById('chatbot-input'); //사용자 메시지 입력 필드
    const chatbotSendButton = document.getElementById('chatbot-send'); // 메시지 전송 버튼

    // 필수 요소들이 존재하는지 확인
    if (!chatbotButton || !chatbotWindow || !closeChatbotButton || !chatbotMessagesContainer || !chatbotInput || !chatbotSendButton) { //만약하나라도 null이라면 에러를 콘소에 출력하고 스크립트의 추가 실행을 중단
        console.error("Chatbot UI 일부 요소를 찾을 수 없습니다. JSP 파일의 ID와 JavaScript의 getElementById() 호출을 확인해주세요.");
        return; // 필수 요소가 없으면 스크립트 중단
    }

    // 챗봇 아이콘(버튼) 클릭 이벤트
    chatbotButton.addEventListener('click', () => {
        toggleChatbotWindow();
    });

    // 챗봇 창 닫기 버튼 클릭 이벤트
    closeChatbotButton.addEventListener('click', () => {
        toggleChatbotWindow(false); // 강제로 닫도록 false 전달
    });

    // 챗봇 창을 토글하는 함수
    function toggleChatbotWindow(forceOpen) {
        const isOpen = chatbotWindow.classList.contains('open');

        if (typeof forceOpen === 'boolean') { // 열기/닫기 상태를 명시적으로 제어할 경우
            if (forceOpen && !isOpen) { // 강제로 열기
                chatbotWindow.classList.add('open');
                displayInitialMessageIfNeeded(); // 창이 열릴 때 초기 메시지 표시 시도
            } else if (!forceOpen && isOpen) { // 강제로 닫기
                chatbotWindow.classList.remove('open');
            }
        } else { // 일반 토글 (아이콘 클릭 시)
            chatbotWindow.classList.toggle('open'); // 'open' 클래스 추가 또는 제거
            if (chatbotWindow.classList.contains('open')) {
                displayInitialMessageIfNeeded(); // 창이 열릴 때 초기 메시지 표시 시도
            }
        }
    }

    // 초기 메시지를 표시하는 함수 (필요한 경우에만)
    function displayInitialMessageIfNeeded() {
        // 메시지 컨테이너에 메시지가 하나도 없을 때만 초기 메시지 표시
        if (chatbotMessagesContainer.children.length === 0) {
            // serverSideInitialMessage는 chatbot.jsp 내 <script> 태그에서 정의됨
            // 만약 해당 변수가 정의되지 않은 경우를 대비해 기본 메시지 사용
            const message = typeof serverSideInitialMessage !== 'undefined' ? serverSideInitialMessage : "무엇을 도와드릴까요?";
            addMessageToChat(message, "bot");
        }
    }

    // 메시지 전송 처리 함수
    function handleSendMessage() {
        const messageText = chatbotInput.value.trim();
        if (messageText === "") return; // 빈 메시지는 전송하지 않음

        addMessageToChat(messageText, "user"); // 사용자 메시지를 채팅창에 표시
        chatbotInput.value = ""; // 입력창 비우기
        chatbotInput.focus(); // 입력창에 다시 포커스

        // TODO: 여기에 실제 Gemini API 연동 로직을 추가
        // 임시 봇 응답 (시뮬레이션)
        setTimeout(() => {
            const botResponse = `\"${messageText}\" 라고 질문하셨네요! 현재는 답변을 준비 중입니다. 곧 실제 AI 답변 기능으로 찾아뵙겠습니다.`;
            addMessageToChat(botResponse, "bot");
        }, 1000); // 1초 후 가상 응답
    }

    // 전송 버튼 클릭 이벤트
    chatbotSendButton.addEventListener('click', handleSendMessage);

    // Enter 키로 메시지 전송 (입력창에서)
    chatbotInput.addEventListener('keypress', (event) => {
        if (event.key === 'Enter') {
            event.preventDefault(); // 기본 Enter 동작(예: 폼 제출) 방지
            handleSendMessage();
        }
    });

    // 채팅창에 메시지를 추가하는 함수
    function addMessageToChat(text, senderType) { // senderType은 'user' 또는 'bot'
        const messageElement = document.createElement('div');
        messageElement.classList.add('message', senderType);
        messageElement.textContent = text; 
        chatbotMessagesContainer.appendChild(messageElement);

        // 새 메시지가 추가되면 스크롤을 맨 아래로 이동
        chatbotMessagesContainer.scrollTop = chatbotMessagesContainer.scrollHeight;
    }
});
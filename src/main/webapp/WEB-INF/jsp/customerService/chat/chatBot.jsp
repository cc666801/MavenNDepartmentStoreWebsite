<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>智能客服</title>
<style>
/* 聊天視窗容器 */
.chat-container {
  position: fixed;
  bottom: 20px;
  right: 20px;
  width: 400px;
  height: 600px;
  border: 1px solid #ccc;
  display: flex;
  flex-direction: column;
  font-family: Arial, Helvetica, sans-serif;
  box-shadow: 0px 2px 5px rgba(0,0,0,0.1);
}

/* 聊天視窗標題 */
.chat-header {
  padding: 10px;
  background-color: #f0f0f0;
  border-bottom: 1px solid #ccc;
  display: flex;
  align-items: center;
}

/* 聊天視窗標題文字 */
.chat-header h2 {
  margin: 0;
  font-size: 16px;
  color: #333;
}

/* 聊天訊息框 */
.chat-messages {
  flex: 1;
  overflow-y: scroll;
  display: flex;
  flex-direction: column;
  padding: 10px;
  background-color: #f9f9f9;
}

/* 聊天訊息 */
.chat-message {
  margin-bottom: 10px;
  display: flex;
  flex-direction: column;
}

/* 接收的訊息 */
.chat-message-received {
  align-items: flex-start;
}

/* 發送的訊息 */
.chat-message-sent {
  align-items: flex-end;
}

/* 訊息框文字 */
.chat-message-text {
  background-color: #fff;
  border-radius: 5px;
  padding: 10px;
  max-width: 70%;
  word-wrap: break-word;
  box-shadow: 0px 2px 5px rgba(0,0,0,0.1);
}

/* 聊天輸入框 */
.chat-input {
  padding: 10px;
  border-top: 1px solid #ccc;
  display: flex;
  flex-direction: row;
  background-color: #fff;
}

/* 輸入框 */
.chat-input textarea {
  flex: 1;
  border-radius: 5px;
  padding: 10px;
  margin-right: 10px;
  border: none;
  resize: none;
  font-size: 14px;
  box-shadow: 0px 2px 5px rgba(0,0,0,0.1);
}

/* 送出按鈕 */
.chat-input button {
  border-radius: 5px;
  padding: 10px;
  border: none;
  background-color: #4CAF50;
  color: #fff;
  cursor: pointer;
  font-size: 14px;
  font-weight: bold;
  box-shadow: 0px 2px 5px rgba(0,0,0,0.1);
}

/* 送出按鈕:hover */
.chat-input button:hover {
  background-color: #3e8e41;
}

/* 滾動條美化 */
.chat-messages::-webkit-scrollbar {
  width: 6px;
  background-color: #f0f0f0;
}

/* 滾動條 */
.chat-messages::-webkit-scrollbar-thumb {
  background-color: #ccc;
}
</style>


</head>
<body>
<div class="chat-container">
  <div class="chat-header">
    <h2>客服聊天室</h2>
  </div>
  <div class="chat-messages">
    <div class="chat-message chat-message-received">
      <div class="chat-message-text">
        <p>您好，有什麼需要幫忙的嗎？</p>
      </div>
    </div>
    <div class="chat-message chat-message-sent">
      <div class="chat-message-text">
        <p>您好，請問關於產品的問題能幫忙解答嗎？</p>
      </div>
    </div>
    <!-- 在這裡插入更多訊息 -->
  </div>
  <div class="chat-input">
    <textarea placeholder="輸入訊息"></textarea>
    <button>送出</button>
  </div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer>
  <div class="footer-container">
    <div class="footer-info">
      <p>상호 : (주)데스크셋</p>
      <p>주소 : 서울특별시 마포구 백범로 23, 3층 (신수동, 케이터틀)</p>
      <p>사업자등록번호 : 123-45-67890</p>
      <p>대표전화 : 02-1234-5678 | 이메일 : support@deskset.com</p>
      <p>Help Center (운영시간: 09시~18시 / 점심시간: 12~13시)</p>
    </div>
    <div class="footer-icons">
      <a href="#"><img src="${pageContext.request.contextPath}/resources/images/common/sns1.png" alt="SNS1" /></a>
      <a href="#"><img src="${pageContext.request.contextPath}/resources/images/common/sns2.png" alt="SNS2" /></a>
      <a href="#"><img src="${pageContext.request.contextPath}/resources/images/common/sns3.png" alt="SNS3" /></a>
    </div>
  </div>
  <div class="footer-copy">
    <p>&copy; DeskSet. All Rights Reserved.</p>
  </div>
</footer>

<style>
  footer {
    background-color: #f0f0f0;
    padding: 30px 20px 10px;
    font-size: 14px;
    color: #333;
    margin-top: 100px;
  }

  .footer-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    max-width: 1200px;
    margin: auto;
  }

  .footer-info p {
    margin: 4px 0;
  }

  .footer-icons {
    margin-top: 15px;
    display: flex;
    justify-content: center;
    gap: 10px;
  }

  .footer-icons img {
    width: 32px;
    height: 32px;
    vertical-align: middle;
  }

  .footer-copy {
    text-align: center;
    margin-top: 25px;
    font-size: 12px;
    color: #999;
  }
</style>

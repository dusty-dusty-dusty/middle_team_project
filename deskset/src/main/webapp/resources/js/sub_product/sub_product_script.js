document.addEventListener("DOMContentLoaded", () => {

  // 수량 조절
  const qtyInput = document.getElementById("quantity");
  const plusBtn = document.querySelector(".qty-btn.plus");
  const minusBtn = document.querySelector(".qty-btn.minus");

  if (qtyInput && plusBtn && minusBtn) {
    plusBtn.addEventListener("click", () => {
      const current = parseInt(qtyInput.value) || 1;
      qtyInput.value = current + 1;
    });

    minusBtn.addEventListener("click", () => {
      const current = parseInt(qtyInput.value) || 1;
      if (current > 1) qtyInput.value = current - 1;
    });
  }

   // 탭 메뉴
  const tabLinks = document.querySelectorAll(".tab-link");
  const detailSection = document.getElementById("detail-section");
  const reviewSection = document.getElementById("review-section");

  tabLinks.forEach(link => {
    link.addEventListener("click", (e) => {
      e.preventDefault();
      tabLinks.forEach(tab => tab.classList.remove("active"));
      link.classList.add("active");

      const targetId = link.getAttribute("href")?.substring(1);

      if (targetId === "detail-section") {
        detailSection.style.display = "block";
        reviewSection.style.display = "none";
      } else if (targetId === "review-section") {
        detailSection.style.display = "none";
        reviewSection.style.display = "block";
      }

      // 부드럽게 스크롤
      const target = document.getElementById(targetId);
      if (target) {
        target.scrollIntoView({ behavior: "smooth" });
      }
    });
  });

  // 페이지 로드시 기본 상태 (상세정보 보이기, 리뷰 숨기기)
  detailSection.style.display = "block";
  reviewSection.style.display = "none";
});

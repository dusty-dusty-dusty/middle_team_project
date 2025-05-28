document.addEventListener('DOMContentLoaded', function () {
  const banners = document.querySelectorAll('.banner-slider img');
  const prevBtn = document.querySelector('.banner-btn.prev');
  const nextBtn = document.querySelector('.banner-btn.next');

  let current = 0;

  function showBanner(index) {
    banners.forEach((img, i) => {
      img.classList.toggle('active', i === index);
    });
  }

  prevBtn.addEventListener('click', () => {
    current = (current - 1 + banners.length) % banners.length;
    showBanner(current);
  });

  nextBtn.addEventListener('click', () => {
    current = (current + 1) % banners.length;
    showBanner(current);
  });
});

// JS cho chức năng "Mua hàng"
document.querySelectorAll(".product button").forEach((button) => {
  button.addEventListener("click", () => {
    alert("Sản phẩm đã được thêm vào giỏ hàng!");
  });
});

const titles = document.querySelectorAll(".menu-title");

titles.forEach((title) => {
  title.addEventListener("click", () => {
    const submenu = title.nextElementSibling;
    const isActive = title.classList.contains("active");

    // Đóng tất cả
    document
      .querySelectorAll(".submenu")
      .forEach((ul) => (ul.style.display = "none"));
    document
      .querySelectorAll(".menu-title")
      .forEach((t) => t.classList.remove("active"));

    // Mở nếu chưa mở
    if (!isActive) {
      submenu.style.display = "block";
      title.classList.add("active");
    }
  });
});
const swiper = new Swiper(".mySwiper", {
  loop: true,
  autoplay: {
    delay: 3000,
    disableOnInteraction: false,
  },
});

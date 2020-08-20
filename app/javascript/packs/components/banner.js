const initBanner = () => {
  let showIndex = 1;
  const bannerContents = document.querySelectorAll(".banner-content");
  const changeContent = () => {
    bannerContents.forEach((bannerContent) => {
      bannerContent.classList.remove("banner-show");
    });
    bannerContents[showIndex].classList.add("banner-show");
    showIndex = (showIndex + 1) % 3;
    console.log(showIndex);
  };
  setInterval(changeContent, 5000);
};

export { initBanner };

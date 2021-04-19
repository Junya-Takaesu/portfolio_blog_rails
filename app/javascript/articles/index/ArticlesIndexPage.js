export default class ArticlesIndexPage {
  initialize() {
    this.burger();
  }

  burger() {
    const burgerIconId = "burger";
    const filterMenuId = "filter";
    const burgerIcon = document.querySelector(`#${burgerIconId}`);
    const filterMenu = document.querySelector(`#${filterMenuId}`);
    const filterItems = document.querySelectorAll(".filter-item");
    const filterHeaders = document.querySelectorAll(".filter-header");

    document.addEventListener("click", event => {
      const eventTargetId = event.target.id;
      const eventTargetParentId = event.target.parentElement.id;

      if (eventTargetId == burgerIconId || eventTargetParentId == burgerIconId) {
        filterMenu.classList.toggle("active");
        this.toggleCascadingAnimation(filterItems, 8)
        this.toggleCascadingAnimation(filterHeaders, 2);
      } else if(eventTargetId != filterMenuId) {
        filterMenu.classList.remove("active");
        filterItems.forEach(filterItem => this.resetAnimation(filterItem));
        filterHeaders.forEach(filterHeader => this.resetAnimation(filterHeader));
      }
    });
  }

  toggleCascadingAnimation(targets, delayDivider) {
    targets.forEach((target, index) => {
      if (target.style.animation) {
        target.style.animation = "";
      } else {
        target.style.animation = `navLinkFade 0.5s ease forwards ${index / delayDivider}s`;
      }
    });
  }

  resetAnimation(target) {
    if (target.style.animation) {
      target.style.animation = "";
    }
  }
}
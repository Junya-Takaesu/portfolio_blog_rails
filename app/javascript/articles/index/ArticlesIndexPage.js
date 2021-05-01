export default class ArticlesIndexPage {
  constructor() {
    this.filterMenuId = "filter";
    this.filterHeaders = document.querySelectorAll(".filter-header");
    this.filterMenu = document.querySelector(`#${this.filterMenuId}`);
    this.filterItems = document.querySelectorAll(".filter-item");
    this.burgerIconId = "burger";
    this.burgerIcon = document.querySelector(`#${this.burgerIconId}`);
    this.eventTarget = null;
  }

  initialize() {
    this.burger();
  }

  burger() {
    const body = document.querySelector("body");

    body.addEventListener("click", event => {
      this.eventTarget = event.target;

      if (this.isBurgerClicked()) {
        this.burgerIcon.classList.toggle("active");
        this.toggleFilterMenu();
      } else if (this.isOutsideOfMenuClicked()) {
        this.burgerIcon.classList.remove("active");
        this.hideFilterMenu();
      }
    });
  }

  isBurgerClicked() {
    return this.eventTarget.id == this.burgerIconId || this.eventTarget.parentElement.id == this.burgerIconId
  }

  isOutsideOfMenuClicked() {
    return this.eventTarget.id != this.filterMenuId && this.eventTarget.parentElement.id != this.filterMenuId && this.eventTarget.tagName.toLowerCase() != "i"
  }

  toggleFilterMenu() {
    this.filterHeaders.forEach(subHeader => {
      this.filterMenu.append(this.createTopLevelMenuHeader(subHeader));
    });

    this.filterMenu.classList.toggle("active");
    if (!this.filterMenu.classList.contains("active")) {
      this.resetFilterMenu();
    }
  }

  hideFilterMenu() {
    this.filterMenu.classList.remove("active");
    this.filterItems.forEach(filterItem => filterItem.style.animation = "");
    this.filterHeaders.forEach(subHeader => {
      subHeader.style.animation = "";
      subHeader.parentElement.classList.remove("active");
    });

    this.resetFilterMenu();
  }

  resetFilterMenu() {
    this.removeTopLevelMenuHeaders();
    this.filterHeaders.forEach(subHeader => {
      subHeader.parentElement.classList.remove("active");
    });

    this.filterHeaders.forEach(filterHeader => filterHeader.style.animation = "");
    this.filterItems.forEach(filterItem => filterItem.style.animation = "");
  }

  removeTopLevelMenuHeaders() {
    document.querySelectorAll(".top-level-menu-item").forEach(dom => {
      dom.remove();
    });
  }

  createTopLevelMenuHeader(subHeader) {
    const topLevelMenuParagraph = document.createElement("p");
    topLevelMenuParagraph.innerHTML = `${subHeader.innerText} <i class="bi bi-chevron-compact-right"></i>`;
    topLevelMenuParagraph.classList.add("top-level-menu-item");

    topLevelMenuParagraph.addEventListener("click", () => {
      const filterHeader = subHeader.parentElement.querySelector(".filter-header") ;
      const filterItems = subHeader.parentElement.querySelectorAll(".filter-item");
      let delayGranularityForHeader = 1;
      let delayGranularityForItems = 40;

      subHeader.parentElement.classList.toggle("active");

      this.toggleCascadingAnimation([filterHeader], delayGranularityForHeader);
      this.toggleCascadingAnimation(filterItems, delayGranularityForItems);
    });

    return topLevelMenuParagraph;
  }

  toggleCascadingAnimation(targets, delayGranularity) {
    targets.forEach((target, index) => {
      if (target.style.animation) {
        target.style.animation = "";
      } else {
        target.style.animation = `navLinkFade 0.5s ease forwards ${index / delayGranularity}s`;
      }
    });
  }
}
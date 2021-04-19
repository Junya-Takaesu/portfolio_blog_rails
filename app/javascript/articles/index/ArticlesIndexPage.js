export default class ArticlesIndexPage {
  initialize() {
    this.burger();
  }

  burger() {
    const burgerIconId = "burger";
    const filterMenuId = "filter";
    const burgerIcon = document.querySelector(`#${burgerIconId}`);
    const filterMenu = document.querySelector(`#${filterMenuId}`);

    document.addEventListener("click", event => {
      const eventTargetId = event.target.id;
      const eventTargetParentId = event.target.parentElement.id;

      if (eventTargetId == burgerIconId || eventTargetParentId == burgerIconId) {
        filterMenu.classList.toggle("active");
      } else if(eventTargetId != filterMenuId) {
        filterMenu.classList.remove("active");
      }
    });
  }
}
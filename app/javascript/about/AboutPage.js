import bootstrap from "../bootstrap/bootstrap.bundle.min.js"

export default class AboutPage {

  initialize() {
    this.toggleDvider();

    window.addEventListener("resize", () => {
      this.toggleDvider();
    });
  }

  initilizeCollapseList() {
    const collapseElementList = [].slice.call(document.querySelectorAll('.collapse'));
    return collapseElementList.map((collapseEl) => {
      return new bootstrap.Collapse(collapseEl, {toggle: false});
    });
  }

  toggleDvider() {
    const breakPoint = 768;
    const collapseList = this.initilizeCollapseList();

    collapseList.forEach((collapseElement) => {
      if(window.innerWidth <= breakPoint) {
        collapseElement.show();
      } else if(breakPoint < window.innerWidth) {
        collapseElement.hide();
      }
    });
  }
}
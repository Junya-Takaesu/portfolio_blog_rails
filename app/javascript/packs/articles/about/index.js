require("../../prism/prism")
import bootstrap from "../../bootstrap/bootstrap.bundle.min.js"
  (() => {
  const initialize = () => {
    const initilizeCollapseList = () => {
      const collapseElementList = [].slice.call(document.querySelectorAll('.collapse'));
      return collapseElementList.map((collapseEl) => {
        return new bootstrap.Collapse(collapseEl, {toggle: false});
      });
    }

    const toggleDvider = () => {
      const breakPoint = 768;
      const collapseList = initilizeCollapseList();

      collapseList.forEach((collapseElement) => {
        if(window.innerWidth <= breakPoint) {
          collapseElement.show();
        } else if(breakPoint < window.innerWidth) {
          collapseElement.hide();
        }
      });
    }

    const initializePrism = () => {
      window.Prism = window.Prism || {};
      Prism.highlightAll();
    }

    toggleDvider();
    initializePrism();

    window.addEventListener("resize", () => {
      toggleDvider();
    });
  }

  window.addEventListener('load', () => {
    initialize();
  });

  window.addEventListener('turbolinks:load', () => {
    initialize();
  });
})();
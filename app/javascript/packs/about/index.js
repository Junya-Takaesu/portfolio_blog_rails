(() => {
  function initilizeCollapseList() {
    const collapseElementList = [].slice.call(document.querySelectorAll('.collapse'));
    return collapseElementList.map((collapseEl) => {
      return new bootstrap.Collapse(collapseEl, {toggle: false});
    });
  }

  function toggleDvider() {
    const breakPoint = 576;
    const collapseList = initilizeCollapseList();

    collapseList.forEach((collapseElement) => {
      if(window.innerWidth <= breakPoint) {
        collapseElement.show();
      } else if(breakPoint < window.innerWidth) {
        collapseElement.hide();
      }
    });
  };

  window.addEventListener("resize", () => {
    toggleDvider();
  });

  window.addEventListener('turbolinks:load', () => {
    toggleDvider();
  });
})();
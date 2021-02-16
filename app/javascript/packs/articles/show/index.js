(() => {

  const initialize = () => {
    const tables = document.querySelectorAll('table');
    tables.forEach((table) => {
      table.setAttribute("class", "table table-dark table-striped");
    });
  }

  window.addEventListener('turbolinks:load', () => {
    initialize();
  });
})()
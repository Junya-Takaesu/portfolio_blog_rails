export default class ShowPage {
  initialize() {
    const tables = document.querySelectorAll('table');
    tables.forEach((table) => {
      table.setAttribute("class", "table table-dark table-striped");
    });
  }
}
require("./prism.js");

export default class PrismInitializer {
  initialize() {
    window.Prism = window.Prism || {};
    Prism.highlightAll();
  }
}
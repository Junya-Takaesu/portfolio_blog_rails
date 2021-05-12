// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
// ActiveStorage is not being used because this blog does not have a db
// import * as ActiveStorage from "@rails/activestorage"
import "channels"

// 自前の js を import していく
import AboutPage from "../about/AboutPage";
import ArticlesIndexPage from "../articles/index/ArticlesIndexPage";
import ArticlesShowPage from "../articles/show/ArticlesShowPage";
import PrismInitializer from "../prism/PrismInitializer";

Rails.start()
Turbolinks.start()
// ActiveStorage is not being used because this blog does not have a db
// ActiveStorage.start()

const initializers = () => {
  const urlPath = window.location.pathname;
  
  if (/^\/about$/.test(urlPath)) {
    const aboutPage = new AboutPage();
    aboutPage.initialize();
  } else if (/^\/articles$/.test(urlPath) || /^\/$/.test(urlPath)) {
    const articlesIndexPage = new ArticlesIndexPage();
    articlesIndexPage.initialize();
  } else if (/^\/articles\/\d+$/.test(urlPath)) {
    const prismInitializer = new PrismInitializer();
    const articlesShowPage = new ArticlesShowPage();
    prismInitializer.initialize();
    articlesShowPage.initialize();
  }
}

document.addEventListener("load", () => {
  initializers();
});

document.addEventListener("turbolinks:load", () => {
  initializers();
});

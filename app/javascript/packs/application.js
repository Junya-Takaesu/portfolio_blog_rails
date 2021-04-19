// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

// 自前の js を import していく
import AboutPage from "../about/AboutPage";
import ShowPage from "../articles/show/ShowPage";
import PrismInitializer from "../prism/PrismInitializer";

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// js を初期化していく
const aboutPage =  new AboutPage();
const showPage = new ShowPage();
const prismInitializer = new PrismInitializer();

const events = ["load", "turbolinks:load"];

events.forEach(event => {
  window.addEventListener(event, () => {
    aboutPage.initialize();
    prismInitializer.initialize();
    showPage.initialize();
  })
});
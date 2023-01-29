import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "pageList" ]

  toggle_page_list() {
      var page_list = this.pageListTarget;
      page_list.classList.toggle("flex");
      page_list.classList.toggle("hidden");
  }
  //get slideOut() {
  //    return this.nameTarget.value
  // }
}

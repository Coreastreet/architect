import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  //static targets = [ "name" ]

  // close the sidenav
  close() {
    const sidebar = document.querySelector("#sidenav");
    sidebar.classList.replace("w-40", "w-0");
    //sidebar.classList.replace("left-40", "left-0");
  }
  
  //get slideOut() {
  //    return this.nameTarget.value
  // }
}

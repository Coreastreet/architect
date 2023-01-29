import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  //static targets = [ "name" ]

  // open the sidenav
  open_sidenav() {
    const sidenav = document.querySelector("#sidenav");
    sidenav.classList.replace("w-0", "w-40");
    //sidebar.classList.replace("left-0", "left-40");
  }

  select_link(event) {
    var link = event.target;
    var children = link.parentElement.children
    for (var element of children) {
        element.classList.remove("text-emerald-200");
    };
    
    link.classList.add("text-emerald-200");
  }
  //get slideOut() {
  //    return this.nameTarget.value
  // }
}

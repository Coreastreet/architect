import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  //static targets = [ "name" ]
  connect() {
      var acc = document.getElementsByClassName("accordion");
      var i;

      for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function() {
          this.classList.toggle("active");
          var panel = this.nextElementSibling;
          if (panel.style.maxHeight) {
            panel.style.maxHeight = null;
          } else {
            panel.style.maxHeight = panel.scrollHeight + "px";
          }
        });
      }
  }
  // open the sidenav
  //slide_down() {
    //sidebar.classList.replace("left-0", "left-40");
  //}

  //get slideOut() {
  //    return this.nameTarget.value
  // }
}

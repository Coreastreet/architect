import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  //static targets = [ "name" ]
  static targets = [ "imageBox", "imageInput", "selectedLesson", "objectivesBox" ]

  connect() {
      // js code for displaying a new image that has just been uploaded.
      var image_file_inputs = document.getElementsByClassName("image_file"); // file input
      for (var i = 0; i < image_file_inputs.length; i++) {
            image_file_inputs[i].addEventListener('change', function(event) {
                var image_frame = this.parentElement.querySelector('.image_display');
                console.log(image_frame);
                image_frame.src = URL.createObjectURL(event.target.files[0]);
            }, false);
      }
  }

  toggle() {
      var creator_card = document.querySelector(".creator_card");
      creator_card.classList.toggle("hidden");  
  }

    display_image() {
        var image_holder = this.imageBoxTarget;
        var image_input = this.imageInputTarget;

        image_holder.src = URL.createObjectURL(image_input.files[0]);
    }

    add_lesson_objective() {
        var objective_box = this.objectivesBoxTarget;
        var input = objective_box.querySelector("input#lesson_objectives");
        var ignored_input = objective_box.querySelector("input#lesson_objective");

        let bullet_point = document.createElement("li")
        bullet_point.classList.add("mb-2");
        bullet_point.innerHTML = ignored_input.value;

        ignored_input.before(bullet_point);
        
        var current_arr = JSON.parse(input.value);
        current_arr.push(ignored_input.value);
        input.value = JSON.stringify(current_arr);

        ignored_input.value = "";
    }

}

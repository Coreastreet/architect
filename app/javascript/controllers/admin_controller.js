import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  //static targets = [ "name" ]
  static targets = [ "imageBox", "imageInput", "imageBox2", "imageInput2", "selectedLesson", "objectivesBox",
                     "editLessonProblemForm", "editLessonSummaryForm", "editLessonPageForm", "editLessonForm",
                     "pageUpdateButtons", "pageEditButtons", "summaryKeyPointsInput", 
                     "newSummaryKeyPoint", "summarySourcesInput", "newSummarySource" ]

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

    display_image(event) {
        var image_input = event.target;
        var image_holder = image_input.parentElement.querySelector("img");

        image_holder.src = URL.createObjectURL(image_input.files[0]);
    }

    display_image2() {
        var image_holder = this.imageBox2Target;
        var image_input = this.imageInput2Target;

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

    // submit the form of lesson page after editing.

    show_page_update_buttons() {
        var update_buttons = this.pageUpdateButtonsTarget;
        var edit_buttons = this.pageEditButtonsTarget;

        edit_buttons.classList.replace("flex", "hidden");
        update_buttons.classList.replace("hidden", "flex");
    }

    show_page_edit_buttons() {
        var update_buttons = this.pageUpdateButtonsTarget;
        var edit_buttons = this.pageEditButtonsTarget;

        update_buttons.classList.add("hidden");
        edit_buttons.classList.remove("hidden");
    }
    
    // updating lessons for instant title reload; skipping turbo.

    updateLesson() {
        var lesson_form = this.editLessonFormTarget;
        lesson_form.submit();
    }

    // updating lesson pages

    updateLessonPage() {
        var page_form = this.editLessonPageFormTarget;
        page_form.submit();
    }

    updateProblemPage() {
        var page_form = this.editLessonProblemFormTarget;
        page_form.submit();
    }

    updateSummaryPage() {
        var page_form = this.editLessonSummaryFormTarget;
        page_form.submit();
    }

    // this for adding a summary point to a lessons_page

    add_bullet_point(event) {
        var list_holder = event.target.closest(".list-holder");
        var summary_key_points_list = list_holder.querySelector("ol");
        var hidden_input = summary_key_points_list.firstElementChild;
        var new_summary_key_point = list_holder.querySelector("textarea");

        let copy = summary_key_points_list.lastElementChild.cloneNode(true); 
        copy.firstElementChild.value = new_summary_key_point.value
        summary_key_points_list.appendChild(copy);

        console.log(copy.firstElementChild);

        var current_arr = JSON.parse(hidden_input.value);
        current_arr.push(new_summary_key_point.value);
        hidden_input.value = JSON.stringify(current_arr);

        new_summary_key_point.value = "";
    }

    update_bullet_points(event) {
        var summary_key_points_list = event.target.closest(".list-holder").querySelector("ol");
        var hidden_input = summary_key_points_list.firstElementChild;

        var li_list = summary_key_points_list.children;

        var new_array = [];
        for (let i = 0, len = li_list.length; i < len; i++) {
            if (i == 0) {
                continue;
            }
            new_array.push(li_list[i].firstElementChild.value);
        }

        hidden_input.value = JSON.stringify(new_array);
    }

    add_summary_key_point() {
        var summary_key_points_list = this.summaryKeyPointsInputTarget;
        var hidden_input = summary_key_points_list.firstElementChild;
        var new_summary_key_point = this.newSummaryKeyPointTarget;

        let copy = summary_key_points_list.lastElementChild.cloneNode(true); 
        copy.querySelector("input").value = new_summary_key_point.value
        summary_key_points_list.appendChild(copy);

        var current_arr = JSON.parse(hidden_input.value);
        current_arr.push(new_summary_key_point.value);
        hidden_input.value = JSON.stringify(current_arr);

        new_summary_key_point.value = "";
    }

    update_summary_key_points() {
        var summary_key_points_list = this.summaryKeyPointsInputTarget;
        var hidden_input = summary_key_points_list.firstElementChild;

        var li_list = Array.from(summary_key_points_list.children);
        li_list.shift();
        var input_values = li_list.map(function(li) {
            return li.querySelector("input").value;
        });

        hidden_input.value = JSON.stringify(input_values);
    }

     // this for adding a summary source to a lessons_page
     add_summary_source() {
        var summary_sources_list = this.summarySourcesInputTarget;
        var hidden_input = summary_sources_list.firstElementChild;
        var new_summary_source = this.newSummarySourceTarget;

        let copy = summary_sources_list.lastElementChild.cloneNode(true); 
        copy.querySelector("input").value = new_summary_source.value
        summary_sources_list.appendChild(copy);

        var current_arr = JSON.parse(hidden_input.value);
        current_arr.push(new_summary_source.value);
        hidden_input.value = JSON.stringify(current_arr);

        new_summary_source.value = "";
    }

    update_summary_sources() {
        var summary_sources_list = this.summarySourcesInputTarget;
        var hidden_input = summary_sources_list.firstElementChild;

        var li_list = Array.from(summary_sources_list.children);
        li_list.shift();
        var new_array = li_list.map(function(li) {
            return li.querySelector("input").value;
        });

        hidden_input.value = JSON.stringify(new_array);
    }

    // deleting string from array.
    remove_bullet(event) {
        //summary_key_points_list.querySelector("input.hidden").value;
        var li = event.target.parentElement;
        var summary_key_points_list = li.closest("ol");
        if (summary_key_points_list == null) {
            summary_key_points_list = li.closest("ul");
        }

        var arr = Array.from(summary_key_points_list.querySelectorAll("li"));
        var index = arr.indexOf(li);    
        var input_values = arr.map(function(li) {
            return li.querySelector("input").value;
        })

        input_values.splice(index, 1);

        summary_key_points_list.firstElementChild.value = JSON.stringify(input_values);

        li.remove();
    }

    move_page_down(event) {
        var index_input = event.target.parentElement.querySelector("input");
        var value = parseInt(index_input.value);
        var number_of_pages = parseInt(index_input.dataset["maxIndex"]);

        var current_page = document.querySelector("#lesson_pages_list > a.selected");
        var next_page = current_page.nextElementSibling;

        if (value < (number_of_pages - 1)) {
            index_input.value = parseInt(index_input.value) + 1;
            current_page.remove();
            next_page.after(current_page);
        }
    }

    move_page_up(event) { // increasing index
        var index_input = event.target.parentElement.querySelector("input");
        var value = parseInt(index_input.value);
        var current_page = document.querySelector("#lesson_pages_list > a.selected");
        var prev_page = current_page.previousElementSibling;

        if (value > 0) {
            index_input.value = parseInt(index_input.value) - 1;
            current_page.remove();
            prev_page.before(current_page);
        }
    }

    select_button(event) {
        var lesson_button = event.target.closest("a");
        console.log(lesson_button);

        if (lesson_button.classList.contains("unselected")) {
            lesson_button.classList.remove("unselected");
            for (var element of (lesson_button.parentElement.children)) {
                element.classList.replace("selected", "unselected");
            }
            lesson_button.classList.add("selected");
        }       
    }
}

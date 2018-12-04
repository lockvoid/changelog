import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["post"]

  cancelEditing(event) {
    event.preventDefault();

    this.postTarget.innerHTML =  this.postTarget.getAttribute('data-post');
  }
}

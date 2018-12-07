import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["content"]

  cancelEditing(event) {
    event.preventDefault();

    this.contentTarget.innerHTML =  this.contentTarget.getAttribute('data-content-was');
  }
}

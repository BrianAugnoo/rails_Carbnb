import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="create-notification"
export default class extends Controller {
  connect() {
    console.log("CreateNotificationController connected")
  }
}

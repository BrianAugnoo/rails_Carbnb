import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="create-notification"
export default class extends Controller {
  static targets = ["userDelete"]
  userCancel(event) {
    event.preventDefault()
    if (confirm("Are you sure you want to cancel?")) {
      const bookingId = this.userDeleteTarget.getAttribute("booking-id")
      this.delete_request(`/bookings/${bookingId}`, JSON.stringify({ id: bookingId }))
    }
  }

  csrf_token() {
    const token = document.querySelector('meta[name="csrf-token"]').getAttribute("content")
    return token
  }

  delete_request(action, body){
    fetch(action, {
      method: "DELETE",
      headers: {
        "X-CSRF-Token": this.csrf_token(),
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: body
    })
    .then(response => {
      if (response.ok) {
        return response.json()
      } else {
        throw new Error("Network response was not ok")
      }
    })
    .then(data => data)
  }
}

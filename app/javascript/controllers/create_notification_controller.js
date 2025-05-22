import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="create-notification"
export default class extends Controller {
  static targets = ["userDelete"]
  async destroy(event) {
    event.preventDefault()
    const type = this.userDeleteTarget.dataset.type
    const bookingId = this.userDeleteTarget.getAttribute("booking-id")
    if (confirm("Are you sure you want to cancel?")) {
      const response = await this.delete_request(`/bookings/${bookingId}`, JSON.stringify({ id: bookingId }))
      console.log(response.message)
      if (response.message === "succes") {
        console.log("Booking deleted successfully")
      }
    }
  }

  csrf_token() {
    const token = document.querySelector('meta[name="csrf-token"]').getAttribute("content")
    return token
  }

  async delete_request(action, body) {
  const response = await fetch(action, {
    method: "DELETE",
    headers: {
      "X-CSRF-Token": this.csrf_token(),
      "Accept": "application/json",
      "Content-Type": "application/json"
    },
    body: body
  });

  const data = await response.json();
  console.log(data);
  return data;
  }
}

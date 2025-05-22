import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="create-notification"
export default class extends Controller {
  static targets = ["userDelete"]
  async destroy(event) {
    event.preventDefault()
    const date = this.userDeleteTarget.dataset.date
    const bookingId = this.userDeleteTarget.getAttribute("booking-id")
    if (confirm("Are you sure you want to cancel?")) {
      await this.create_notification(bookingId, date)
      const response = await this.delete_request(`/bookings/${bookingId}`, JSON.stringify({ id: bookingId }))
      console.log(response.message)
      if (response.message === "succes") {
        console.log("Booking deleted successfully")
        document.getElementById(`${bookingId}`).remove()
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

  async create_notification(bookingId, date) {
    const response = await fetch(`/bookings/${bookingId}/notifications`, {
      method: "POST",
      headers: {
        "X-CSRF-Token": this.csrf_token(),
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ booking_id: bookingId, notification: { message: `your booking for ${date} has been deleted`} })
    });

    const data = await response.json();
    console.log(data);
  }
}

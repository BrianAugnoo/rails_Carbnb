import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="create-notification"
export default class extends Controller {
  static targets = ["userDelete", "userAccept", "userCreate"]
  async destroy(event) {
    event.preventDefault()
    const date = this.userDeleteTarget.dataset.date
    const bookingId = this.userDeleteTarget.getAttribute("booking-id")
    if (confirm("Are you sure you want to cancel?")) {
      await this.create_notification(bookingId, date, `your booking for ${date} has been deleted`)
      const response = await this.delete_request(`/bookings/${bookingId}`, JSON.stringify({ id: bookingId }))
      console.log(response.message)
      if (response.message === "succes") {
        console.log("Booking deleted successfully")
        document.getElementById(`${bookingId}`).remove()
      }
    }
  }

  async accept(event) {
    const bookingId = this.userAcceptTarget.getAttribute("booking-id")
    const date = this.userAcceptTarget.dataset.date
    await this.create_notification(bookingId, date, `your booking for ${date} has been accepted`)
  }

  async create(event) {
    event.preventDefault()
    const response = await this.create_request()
    if (response.success) {
      this.create_notification(response.id, `your booking for ${response.date} has been created`)
      window.location.href = "/";
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

  async create_request(){
    const response = await fetch(this.userCreateTarget.action,
      {
        method: "POST",
        headers: {"Accept": "application/json"},
        body: new FormData(this.userCreateTarget)
      }
    )

    const data = await response.json();
    console.log(data);
    return data;
  }

  async create_notification(bookingId, message) {
    const response = await fetch(`/bookings/${bookingId}/notifications`, {
      method: "POST",
      headers: {
        "X-CSRF-Token": this.csrf_token(),
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ booking_id: bookingId, notification: { message: message} })
    });

    const data = await response.json();
    console.log(data);
  }
}

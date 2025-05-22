// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "bootstrap"
import "@popperjs/core"
import "@hotwired/turbo-rails"
import Rails from "@rails/ujs"
console.log("test")
import { Application } from "@hotwired/stimulus"
window.Stimulus = Application.start()
// import "./controllers"
// import "./controllers/create_notification_controller"
import CreateNotificationController from "./controllers/create_notification_controller"
Stimulus.register("create-notification", CreateNotificationController)

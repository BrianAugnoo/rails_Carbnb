# Pin npm packages by running ./bin/importmap
pin "application", preload: true
pin "bootstrap" # @5.3.6
pin "@popperjs/core", to: "https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/esm/index.js"
pin "bootstrap",         to: "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.esm.js"
pin "@rails/ujs", to: "@rails--ujs.js" # @7.1.3
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js" # @1.1.0
pin_all_from "app/javascript/controllers", under: "controllers"
pin "controllers" # @0.0.2
pin "fs" # @2.1.0
pin "path" # @2.1.0
pin "process" # @2.1.0
pin "@hotwired/turbo-rails", to: "@hotwired--turbo-rails.js" # @2.1.0

# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "bootstrap" # @5.3.6
pin "@popperjs/core", to: "https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/esm/index.js"
pin "bootstrap",         to: "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.esm.js"
pin "@rails/ujs", to: "@rails--ujs.js" # @7.1.3

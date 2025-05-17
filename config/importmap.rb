# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "bootstrap" # @5.3.6
pin "bootstrap", to: "bootstrap/dist/js/bootstrap.bundle.min.js"
pin "@popperjs/core", to: "@popperjs--core.js" # @2.11.8

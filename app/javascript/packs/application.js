import UIkit from "uikit"
import Icons from "uikit/dist/js/uikit-icons"
import http from "http"

document.addEventListener("DOMContentLoaded", () => {
  // loads the Icon plugin
  UIkit.use(Icons)

  setInterval(function() {
    http.get("http://bernardo-potluck.herokuapp.com/")
  }, 30000)
})

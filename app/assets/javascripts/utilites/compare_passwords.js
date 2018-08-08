document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.pass-conf')
  if (control) {
    var password = control.querySelector('.pass1').value
    var confirmation_elem = control.querySelector('.pass2')

    if(confirmation_elem.value) {
      confirmation_elem.addEventListener('input', validate())
    }
  }
})

function validate() {
  var confirmation = confirmation_elem.value
  var len = confirmation.length
  if(password[len-1] === confirmation[len-1]) {
    this.querySelector('.octicon-check').classList.remove('hide')
    this.querySelector('.octicon-circle-slash').classList.add('hide')
  } else {
    this.querySelector('.octicon-circle-slash').classList.remove('hide')
    this.querySelector('.octicon-check').classList.add('hide')
  }
}

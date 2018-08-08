document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.pass-conf')
  if (control) {
    var password = control.querySelector('.pass1').value
    var confirmation_elem = control.querySelector('.pass2')
    confirmation_elem.addEventListener('input', validate(control, password))
    // confirmation_elem.oninput = validate(control)
  }
})

function validate(form, password) {
  var confirmation = form.querySelector('.pass2').value
  var len = confirmation.length
  if(!len) { return }
  if(password[len-1] === confirmation[len-1]) {
    form.querySelector('.octicon-check').classList.remove('hide')
    form.querySelector('.octicon-circle-slash').classList.add('hide')
  } else {
    form.querySelector('.octicon-check').classList.add('hide')
    form.querySelector('.octicon-circle-slash').classList.remove('hide')
  }
}

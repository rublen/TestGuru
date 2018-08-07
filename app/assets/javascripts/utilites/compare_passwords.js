document.addEventListener('turbolinks:load', function() {
  var form = document.querySelector('.new_user')
  var password_confirmation = form.querySelector('#user_password_confirmation').value
  
  if(form && password_confirmation) { 
    form.addEventListener('onsubmit', validate(form))
  }
})

function validate(form) {
  var elem1 = form.querySelector('#user_password')
  var elem2 = form.querySelector('#user_password_confirmation')
  
  if(elem1.value === elem2.value) {
    elem2.querySelector('.octicon-check').classList.remove('hide')
    elem2.querySelector('.octicon-circle-slash').classList.add('hide')
  } else {
    elem2.querySelector('.octicon-circle-slash').classList.remove('hide')
    elem2.querySelector('.octicon-check').classList.add('hide')
  }
}
 
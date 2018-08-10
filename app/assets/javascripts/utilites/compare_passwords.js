document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.new_user');

  if (control) {
    var confirmationElem = control.querySelector('#user_password_confirmation');
    confirmationElem.addEventListener("input", validate);
  }
})

function validate() {
  var password = document.querySelector('#user_password').value;
  var confirmationElem = document.querySelector('#user_password_confirmation');
  var confirmation = confirmationElem.value;

  if(!confirmation) {
    document.querySelector('.octicon-check').classList.add('hide');
    document.querySelector('.octicon-circle-slash').classList.add('hide');
    return;
  }

  if(password == confirmation) {
    document.querySelector('.octicon-check').classList.remove('hide');
    document.querySelector('.octicon-circle-slash').classList.add('hide');
  } else {
    document.querySelector('.octicon-check').classList.add('hide');
    document.querySelector('.octicon-circle-slash').classList.remove('hide');
  }
}

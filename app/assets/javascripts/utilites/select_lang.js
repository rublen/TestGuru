document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.selectlang');

  if(control) {
    options = control.getElementsByTagName('option');

    for(var i = 0; i < options.length; i++) {
      options[i].addEventListener('click', switchLang)
    }
  };

  function switchLang() {
    url = window.location.href;
    if (url.includes('?')) {
      if (url.includes('lang=')) {
        var langParam = url.match(/lang=../)[0]
        window.location.href = url.replace(langParam, 'lang=' + control.value);
      } else {
        window.location.href = url + '&lang=' + control.value;
      }
    } else {
      window.location.href = url + '?lang=' + control.value;
    }
  }
});

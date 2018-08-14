document.addEventListener('turbolinks:load', function() {
  // var control = document.querySelector('.selectlang');

  // if(control) {
  //   var url = window.location.href;
  //   control.value = getLang();
  //   control.addEventListener('change', switchLang);
  // };

  // function getLang() {
  //   if (url.includes('lang=')) {
  //     var langParam = url.match(/lang=../)[0];
  //     return langParam.substr(langParam.length-2);
  //   } else {
  //     return 'en';
  //   }
  // }

  // function switchLang() {
  //   if (url.includes('?')) {
  //     if (url.includes('lang=')) {
  //       var langParam = url.match(/lang=../)[0];
  //       window.location.href = url.replace(langParam, 'lang=' + control.value);
  //     } else {
  //       window.location.href = url + '&lang=' + control.value;
  //     }
  //   } else {
  //     window.location.href = url + '?lang=' + control.value;
  //   }
  // }
});

document.addEventListener('turbolinks:load', function() {
  var timer = document.querySelector('#timer');

  if(timer) {
    var minutes = parseInt(timer.dataset.min)
    var seconds = parseInt(timer.dataset.sec)

    setInterval(displayTime, 1000);

    function displayTime() {
      timer.innerHTML = minutes + ':' + seconds
      if(seconds <= 0 && minutes <= 0) {
        finishTest()
        return
      } else { setData(minutes, seconds) }
    }

    function finishTest() {
      var url = window.location.href
      if(!url.includes('/result')) {
        url = url.split('?')
        window.location.href = url[0] + '/result' + ( url[1] ? '?' + url[1] : '')
      }
    }

    function setData() {
      if(seconds == 0) {
        minutes--
        seconds = 59
      } else { seconds-- }
    }
  }
})

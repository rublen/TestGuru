document.addEventListener('turbolinks:load', function() {
  var timer = document.querySelector('#timer');

  if(timer) {
    var endPointSec = parseInt(document.getElementById('time-end-point').textContent)
    var timeLeftSec = endPointSec - Date.now() / 1000;

    var minutes = Math.floor(timeLeftSec / 60)
    var seconds = Math.floor(timeLeftSec % 60)

    var timeEngine = setInterval(displayTime, 1000);

    window.addEventListener('hashchange', stopTimer)

    function stopTimer() { clearInterval(timeEngine) }

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

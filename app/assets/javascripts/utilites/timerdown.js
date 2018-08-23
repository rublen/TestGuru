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
      if(!window.location.href.includes('/result')) {
        window.location.href = window.location.href + '/result'
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

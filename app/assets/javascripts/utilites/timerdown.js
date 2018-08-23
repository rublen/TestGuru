document.addEventListener('turbolinks:load', function() {
  var timer = document.querySelector('#timer');
  if(timer) {
    var duration = document.querySelector('#duration');
    if(document.querySelector('#quest-counter').textContent.includes(' 1 /')) {
      // если мы на первом вопросе, то минуты=длительность теста
      var minutes = parseInt(duration.textContent)
      var seconds = '00'
    } else {
      // если не на первом, то хотельсь бы считать время из таймера,
      // но при переходе на новую страницу его уже нету
      time = timer.textContent.split(':')
      minutes = parseInt(time[0])
      seconds = parseInt(time[1])
    }

    setInterval(displayTime, 1000);

    function setCurrent(min, sec) {
      if(sec == 0) {
        if(min == 0) {
          window.location.href = window.location.href + '/result'
          return
        }
        minutes = min - 1
        seconds = 59
      } else {
        seconds = sec - 1
      }
    }

    function displayTime() {
      timer.innerHTML = minutes + ':' + seconds
      setCurrent(minutes, seconds)
    }
  }
})

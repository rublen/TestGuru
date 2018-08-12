document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.progress');
  
  if(control) {
    var progress = culculateProgress();
    var progressBar = document.querySelector('.progress-bar');
    progressBar.style.width = progress + '%';
  }
  
  function culculateProgress() {
    var questionNumber = control.dataset.questionCounter;
    var questionsAmount = control.dataset.questionsAmount;
    
    return (questionNumber - 1) / questionsAmount * 100;
  }
})

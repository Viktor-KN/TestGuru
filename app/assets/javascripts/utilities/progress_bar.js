document.addEventListener('turbolinks:load', function () {
    var progressContainer = document.querySelector('.progress-container');
    var progressFiller = document.querySelector('.progress-filler');

    if (progressContainer && progressFiller) {
        var currentQuestionIndex = progressContainer.dataset.currentQuestionIndex;
        var questionsCount = progressContainer.dataset.questionsCount;

        progressFiller.style.width = currentQuestionIndex / questionsCount * 100 + '%';
    }
});

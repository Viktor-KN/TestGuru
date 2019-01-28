document.addEventListener('turbolinks:load', function () {
    let progressContainer = document.querySelector('.progress-container');
    let progressFiller = document.querySelector('.progress-filler');

    if (progressContainer && progressFiller) {
        let currentQuestionIndex = progressContainer.dataset.currentQuestionIndex;
        let questionsCount = progressContainer.dataset.questionsCount;

        progressFiller.style.width = currentQuestionIndex / questionsCount * 100 + '%';
    }
});

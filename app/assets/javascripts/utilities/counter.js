var counterDiv;
var total_seconds;
var timer;

document.addEventListener('turbolinks:load', function () {
    counterDiv = document.querySelector('.counter');

    if (counterDiv) {
        total_seconds = counterDiv.dataset.secondsLeft;
        timer = setInterval(timerTick, 1000);
    }
});

function timerTick() {
    total_seconds--;

    if (total_seconds < 0) {
        clearInterval(timer);
        document.querySelector('form').submit();
        return;
    }

    var seconds = Math.floor(total_seconds % 60);
    var minutes = Math.floor((total_seconds / 60) % 60);
    var hours = Math.floor(total_seconds / (60 * 60));

    counterDiv.innerHTML = pad(hours, 2) + ':' + pad(minutes, 2) + ':' + pad(seconds, 2);
}

function pad (str, max) {
    str = str.toString();
    return str.length < max ? pad("0" + str, max) : str;
}

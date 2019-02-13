document.addEventListener('turbolinks:load', function () {
    var counterDiv = document.querySelector('.counter');

    if (counterDiv) {
        var totalSeconds = counterDiv.dataset.secondsLeft;

        setInterval(function () {
            totalSeconds--;

            if (totalSeconds < 0) {
                clearInterval(this);
                document.getElementById('test-passage-form').submit();
                return;
            }

            var seconds = Math.floor(totalSeconds % 60);
            var minutes = Math.floor((totalSeconds / 60) % 60);
            var hours = Math.floor(totalSeconds / (60 * 60));

            counterDiv.innerHTML = pad(hours, 2) + ':' + pad(minutes, 2) + ':' + pad(seconds, 2);
        }, 1000);
    }
});

function pad(str, max) {
    str = str.toString();
    return str.length < max ? pad("0" + str, max) : str;
}

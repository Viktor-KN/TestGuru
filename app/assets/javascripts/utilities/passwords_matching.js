var passwordControl;
var passwordConfirmControl;

document.addEventListener('turbolinks:load', function () {
    passwordControl = document.getElementById('user_password');
    passwordConfirmControl = document.getElementById('user_password_confirmation');

    if (passwordControl && passwordConfirmControl ) {
        passwordControl.addEventListener('input', checkPasswordsMatch);
        passwordConfirmControl.addEventListener('input', checkPasswordsMatch);
    }
});

function checkPasswordsMatch() {
    if (passwordConfirmControl.value.length === 0) {
        disableAllIcons();
        return;
    }

    if (passwordControl.value === passwordConfirmControl.value) {
        enableCheckIcons();
        return;
    }

    enableAlertIcon();
}

function disableIcons(icons) {
    for (var i = 0; i < icons.length; i++) {
        icons[i].classList.add('hide');
    }
}

function disableAllIcons() {
    disableIcons(passwordControl.parentNode.querySelectorAll('.octicon'));
    disableIcons(passwordConfirmControl.parentNode.querySelectorAll('.octicon'));
}

function enableAlertIcon() {
    disableAllIcons();
    passwordConfirmControl.parentNode.querySelector('.octicon-alert').classList.remove('hide');
}

function enableCheckIcons() {
    disableAllIcons();
    passwordControl.parentNode.querySelector('.octicon-check').classList.remove('hide');
    passwordConfirmControl.parentNode.querySelector('.octicon-check').classList.remove('hide');
}

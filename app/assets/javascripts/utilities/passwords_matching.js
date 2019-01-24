let password_control
let password_confirm_control

document.addEventListener('turbolinks:load', function () {
    password_control = document.getElementById('user_password')
    password_confirm_control = document.getElementById('user_password_confirmation')

    if (password_control && password_confirm_control ) {
        password_control.addEventListener('input', checkPasswordsMatch)
        password_confirm_control.addEventListener('input', checkPasswordsMatch)
    }
})

function checkPasswordsMatch() {
    if (password_confirm_control.value.length === 0) {
        disableAllIcons()
        return
    }

    if (password_control.value === password_confirm_control.value) {
        enableCheckIcons()
        return
    }

    enableAlertIcon()
}

function disableIcons(icons) {
    for (let i = 0; i < icons.length; i++) {
        icons[i].classList.add('hide')
    }
}

function disableAllIcons() {
    disableIcons(password_control.parentNode.querySelectorAll('.octicon'))
    disableIcons(password_confirm_control.parentNode.querySelectorAll('.octicon'))
}

function enableAlertIcon() {
    disableAllIcons()
    password_confirm_control.parentNode.querySelector('.octicon-alert').classList.remove('hide')
}

function enableCheckIcons() {
    disableAllIcons()
    password_control.parentNode.querySelector('.octicon-check').classList.remove('hide')
    password_confirm_control.parentNode.querySelector('.octicon-check').classList.remove('hide')
}

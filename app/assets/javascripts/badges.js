var badgePartialElement;
var inputValue;

document.addEventListener('turbolinks:load', function () {
    var badgeSelector = document.getElementById('badge_check_type');
    badgePartialElement = document.querySelector('.partial');

    if (badgeSelector && badgePartialElement) {
        badgeSelector.addEventListener('change', badgeSelectorChange);

        $.ajaxSetup({
            headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') }
        });

        var evt = document.createEvent("HTMLEvents");
        evt.initEvent("change", false, true);
        badgeSelector.dispatchEvent(evt);
    }
});

function badgeSelectorChange() {
    var formControl = badgePartialElement.querySelector('.hide');

    if (formControl) {
        inputValue = formControl.value;
    } else {
        inputValue = null;
    }

    if (this.value === '') {
        badgePartialElement.innerHTML = '';
        return;
    }

    $.ajax({
        url: '/admin/badges/new/render_form_control',
        type: 'POST',
        dataType: 'html',
        data: buildRequestParams(this.value),
        success: changePartialInput
    });
}

function changePartialInput(data) {
    badgePartialElement.innerHTML = data;

    if (inputValue) {
        var formControl = badgePartialElement.querySelector('.form-control');

        if(formControl) {
            formControl.value = inputValue;
        }
    }
}

function GetURLParameter(param) {
    var pageURL = window.location.search.substring(1);
    var urlVariables = pageURL.split('&');

    for (var i = 0; i < urlVariables.length; i++) {
        var parameterName = urlVariables[i].split('=');

        if (parameterName[0] === param) {
            return parameterName[1];
        }
    }
}

function buildRequestParams(check_type) {
    var params = 'check_type=' + check_type;
    var lang = GetURLParameter('lang');

    if (lang) {
        params = params + '&lang=' + lang;
    }

    return params;
}

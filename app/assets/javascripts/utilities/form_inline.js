document.addEventListener('turbolinks:load', function () {
    var $formInlineLink = $('.form-inline-link');

    $formInlineLink.on('click', formInlineLinkHandler);

    var errors = document.querySelector('.resource-errors');

    if (errors && $formInlineLink.length > 0) {
        var resourceId = errors.dataset.resourceId;
        formInlineHandler(resourceId);
    }
});

function formInlineLinkHandler(event) {
    event.preventDefault();

    var testId = this.dataset.testId;
    formInlineHandler(testId);
}

function formInlineHandler(testId) {
    var link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]');
    var editText = link.dataset.editText;
    var cancelText = link.dataset.cancelText;

    var $testTitle = $('.test-title[data-test-id="' + testId + '"]');
    var $formInline = $('.form-inline[data-test-id="' + testId + '"]');

    $testTitle.toggle();
    $formInline.toggle();

    if ($formInline.is(':visible')) {
        link.textContent = cancelText;
    } else {
        link.textContent = editText;
    }
}

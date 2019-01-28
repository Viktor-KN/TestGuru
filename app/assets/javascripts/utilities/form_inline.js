document.addEventListener('turbolinks:load', function () {
    let $formInlineLink = $('.form-inline-link');

    $formInlineLink.on('click', formInlineLinkHandler);

    let errors = document.querySelector('.resource-errors');

    if (errors && $formInlineLink.length > 0) {
        let resourceId = errors.dataset.resourceId;
        formInlineHandler(resourceId);
    }
});

function formInlineLinkHandler(event) {
    event.preventDefault();

    let testId = this.dataset.testId;
    formInlineHandler(testId);
}

function formInlineHandler(testId) {
    let link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]');
    let editText = link.dataset.editText;
    let cancelText = link.dataset.cancelText;

    let $testTitle = $('.test-title[data-test-id="' + testId + '"]');
    let $formInline = $('.form-inline[data-test-id="' + testId + '"]');

    $testTitle.toggle();
    $formInline.toggle();

    if ($formInline.is(':visible')) {
        link.textContent = cancelText;
    } else {
        link.textContent = editText;
    }
}

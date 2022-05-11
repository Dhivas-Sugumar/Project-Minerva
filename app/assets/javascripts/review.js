$(function() {
    $('a#show-review-form').click(function(event){
        event.preventDefault();
        $('div#review-form').toggle();
    });
});
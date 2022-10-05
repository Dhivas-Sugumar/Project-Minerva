$(document).ready(function(){
    $('a#show-review-form').click(function(eve){
        eve.preventDefault();
        $('#review-form').toggle();
    });
});
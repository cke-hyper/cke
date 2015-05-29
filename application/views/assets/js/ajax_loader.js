function getContent(page_name) {
    alert('hello world');
    $('#page_content').load('http://google.com');
}

/**
 * 1 -> ourgym
 * 2 -> location
 * 3 -> testimonials
 * 4 -> overall schedule
 * 5 -> fees and registration
 * 6 ->
 */

$(document).ready(function () {
    $(".nav li").click(function() {
        $(".nav li").removeClass('active');
        index = $(".nav li").index($(this));
        if (index == 6 || index == 10) {
            return;
        }
        alert(index);
        if (index == 8 || index == 9) {
            $($(".nav li")[7]).addClass('active');
        }
        else if (index == 11 || index == 12) {
            $($(".nav li")[10]).addClass('active');
        }
    });
});
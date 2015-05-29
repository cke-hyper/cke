function getContent(page_name) {
    $('#page_content').load('http://localhost/cke/index.php/page/get_page/' + page_name);
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
        index = $(".nav li").index($(this));
        if (index == 6 || index == 10) {
            return;
        }
        $(".nav li").removeClass('active');

        if (index == 7 || index == 9) {
            $(".nav li:nth-child(7)").addClass('active');
        }
        else if (index == 11 || index == 13) {
            $(".nav li:nth-child(8)").addClass('active');
        }
        $(this).addClass('active');
    });
});
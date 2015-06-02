var $base_url = "http://localhost/cke/index.php/";
function getContent(page_name) {
    $('#page_content').load($base_url + 'Page/get_page/' + page_name);
}

function get_instructor($instructor_id) {
    var $url = $base_url + 'instructor/get_instructor/' + $instructor_id;
    $.ajax({
        url: $url,
        data: {
            format: 'json'
        },
        error: function (xhr, err) {
            $('#page_content').append("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
            $('#page_content').append("responseText: " + xhr.responseText)
        },
        dataType: 'json',
        success: function (data) {
            $('#page_content').html("");
            var $temp = '<img src="Pictures/ins-img/' + data.rows[0].instructor_id + '.jpg">';
            $img = $($temp);
            $onecolumn = $('<div class="col-md-1">').text(" ");
            $first = $('<div class="col-md-5 img-align">').append($img);
            $full_name = $('<h1>').text(data.rows[0].full_name);
            //here using substring cut the long bio to small one to fit the front page
            $temp = '<a onClick="get_instructor(' + data.rows[0].instructor_id + ')" href="#">';
            $BIOGRAPHY = $('<h4>').text("BIOGRAPHY");
            $bio = $('<p>').text(data.rows[0].bio);
            $TEACHING = $('<h4>').text("TEACHING");
            $COURSESC = $('<b>').text("COURSE CATEGORIES: ");
            $COURSES = $('<b>').text("COURSE: ");
            var $course_categories = $('<div class="link-separator">').append($COURSESC);
            //course categories cardination
            for (i = 0; i < data.course_categories_cardinality.length; i++) {
                var $category_id = $('<h1>').text(data.course_categories_cardinality[i].category_id);
                var $temp = '<a onClick="get_course_category(' + $category_id + ')">';
                var $category_name = $($temp).text(data.course_categories_cardinality[i].category_name);
                $course_categories.append($category_name);
            }

            var $courses = $('<div class="link-separator">');
            $courses.append($COURSES);
            //course cardinality
            for (i = 0; i < data.course_cardinality.length; i++) {
                var $course_id = $('<h1>').text(data.course_cardinality[i].course_id);
                var $temp = '<a onClick="get_course(' + $course_id + ')">';
                var $course_name = $($temp).text(data.course_cardinality[i].course_name);
                //alert($category_name);
                $courses.append($course_name);
            }

            $second = $('<div class="col-md-5">').append($full_name).append($BIOGRAPHY).append($bio).append($TEACHING).append($course_categories).append($courses);
            $divs = $('<div class="row">').append($onecolumn).append($first).append($second);
            $('#page_content').append($divs);
// 				var $room_id = $('<h1>').text(data.rows[0].room_id);
// 				var $room_name = $('<h1>').text(data.rows[0].room_name);
// 				$('#page_content').append($room_id).append($room_name);
// 				for (i = 0; i < data.course_cardinality.length; i++){
// 					var $course_id = $('<h1>').text(data.course_cardinality[i].course_id);
// 					var $course_name = $('<h1>').text(data.course_cardinality[i].course_name);
// 					$('#page_content').append($course_id).append($course_name);
// 				}
        },
        type: 'GET'
    });
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
    $(".nav li").click(function () {
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
        if (index < 6) {
            getContent(index + 1);
        }
    });
});


$(document).ready(function () {
    $("#instructors").click(function () {
        $.ajax({
            url: $base_url + 'instructor/get_instructors',
            data: {
                format: 'json'
            },
            error: function (xhr, err) {
                $('#page_content').append("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
                $('#page_content').append("responseText: " + xhr.responseText)
            },
            dataType: 'json',
            success: function (data) {
                //clear the html code
                $('#page_content').html("");
                var $full_name;
                var $bio;
                for (i = 0; i < data.rows.length; i++) {
                    var $temp = '<img src="Pictures/ins-img/' + data.rows[i].instructor_id + '.jpg">';
                    $img = $($temp);
                    $onecolumn = $('<div class="col-md-1">').text(" ");
                    $first = $('<div class="col-md-5">').append($img);
                    $full_name = $('<h1>').text(data.rows[i].full_name);
                    //here using substring cut the long bio to small one to fit the front page
                    $temp = '<a onClick="get_instructor(' + data.rows[i].instructor_id + ')" href="#">';
                    $link = $($temp).text("More");
                    $BIOGRAPHY = $('<h4>').text("BIOGRAPHY");
                    $bio = $('<p>').text(data.rows[i].bio.substring(0, 800) + "... ").append($link);

                    $second = $('<div class="col-md-5">').append($full_name).append($BIOGRAPHY).append($bio);
                    //$divs = null;
                    if (i % 2 == 0)
                        $divs = $('<div class="row">').append($onecolumn).append($first).append($second);
                    else $divs = $('<div class="row backgroundgrey">').append($onecolumn).append($first).append($second);
                    $('#page_content').append($divs);
                }
            },
            type: 'GET'
        });
    });

    $("#instructors_month").click(function () {
        $.ajax({
            url: $base_url + 'instructor/get_instructors_month',
            data: {
                format: 'json'
            },
            error: function (xhr, err) {
                $('#page_content').append("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
                $('#page_content').append("responseText: " + xhr.responseText)
            },
            dataType: 'json',
            success: function (data) {
                //clear the html code
                $('#page_content').html("");
                var $full_name;
                var $bio;
                for (i = 0; i < data.rows.length; i++) {
                    var $temp = '<img src="Pictures/ins-img/' + data.rows[i].instructor_id + '.jpg">';
                    $img = $($temp);
                    $onecolumn = $('<div class="col-md-1">').text(" ");
                    $first = $('<div class="col-md-5">').append($img);
                    $full_name = $('<h1>').text(data.rows[i].full_name);
                    //here using substring cut the long bio to small one to fit the front page
                    $temp = '<a onClick="get_instructor(' + data.rows[i].instructor_id + ')" href="#">';
                    $link = $($temp).text("More");
                    $BIOGRAPHY = $('<h4>').text("BIOGRAPHY");
                    $bio = $('<p>').text(data.rows[i].bio.substring(0, 800) + "... ").append($link);

                    $second = $('<div class="col-md-5">').append($full_name).append($BIOGRAPHY).append($bio);
                    $divs = $('<div class="row">').append($onecolumn).append($first).append($second);
                    $('#page_content').append($divs);
                }
            },
            type: 'GET'
        });
    });
});


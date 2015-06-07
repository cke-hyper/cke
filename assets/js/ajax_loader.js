var $base_url = "http://localhost/cke/index.php/";
function getContent(page_name) {
    $('#page_content').load($base_url + 'Page/get_page/' + page_name);
}

var back_flag = false;
var ignore = false;
var forward_flag = false;
var stack = ["get_our_gym()"];
var forward_stack = [];

function setVisibility() {
    if (back_flag)
        $("#back_button").removeClass("disabled");
    else
        $("#back_button").addClass("disabled");
    if (forward_flag)
        $("#forward_button").removeClass("disabled");
    else
        $("#forward_button").addClass("disabled");
}

function push_stack($theStack, $ele) {
    if ($theStack[$theStack.length - 1] != $ele) {
        $theStack.push($ele);
    }
    forward_flag = forward_stack.length > 0;
    back_flag = stack.length > 1;
}

function get_instructor($instructor_id) {
    $(".nav li").removeClass('active');
    push_stack(stack,"get_instructor(" + $instructor_id + ")");
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
//          <ol class="breadcrumb">
//          <li><a href="#">Home</a></li>
//          <li><a href="#">Library</a></li>
//          <li class="active">Data</li>
//        	</ol>
            //TODO link does not work
            var $breadcrumb = $('<ol class="breadcrumb">');
            $breadcrumb.append($('<li>').append('<a href="#" onclick="get_our_gym()">').append("Home"));
            $breadcrumb.append($('<li>').append('<a href="#" onclick="get_instructors()">').append("Instrcutors"));
            $breadcrumb.append($('<li>').append('<a href="#\" class="active">').append(data.rows[0].full_name));
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

            $second = $('<div class="col-md-5">').append($full_name).append($BIOGRAPHY).append($breadcrumb).append($bio).append($TEACHING).append($course_categories).append($courses);
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
function get_course($course_id){
    $(".nav li").removeClass('active');
    push_stack(stack,"get_course(" + $course_id + ")");
    var $url = $base_url + 'course/get_course/'+$course_id;
    $.ajax({
        url : $url,
        data : {
            format : 'json'
        },
        error: function(xhr,err) {
            $('#page_content').append("readyState: "+xhr.readyState+"\nstatus: "+xhr.status);
            $('#page_content').append("responseText: "+xhr.responseText)
        },
        dataType : 'json',
        success : function(data) {
            console.log(data);
            $('#page_content').html("");
            var $course_name = $('<h2>').text(data.rows[0].course_name);
            //TODO link does not work
            var $breadcrumb = $('<ol class="breadcrumb">');
            $breadcrumb.append($('<li>').append('<a href="#" onclick="get_our_gym()">').append("Home"));
            $breadcrumb.append($('<li>').append('<a href="#" onclick="get_instructors()">').append("Courses"));
            $breadcrumb.append($('<li>').append('<a href="#\" class="active">').append(data.rows[0].course_name));
            var $description = ($('<div class="row">').append($('<div class="col-md-1">'))).append(
                ($('<div class="col-md-10">').append($course_name).append($breadcrumb)).append('<p>' + data.rows[0].description));
            //instrcutor cardinality
            var $INSTRUCTOR = $('<b>').text("INSTRUCTOR: ");
            var $instructor=$('<div class="link-separator col-md-5">').append($INSTRUCTOR);
            for (i = 0; i < data.instructor_cardinality.length; i++)
            {
                //alert(data.instructor_cardinality[i].full_name);
                var $temp = '<a onclick="get_instructor('+ data.instructor_cardinality[i].instructor_id +')" href="#">';
                $instructor.append($($temp).text(data.instructor_cardinality[i].full_name));
            }
            //course category cardinality
            var $COURSEC = $('<b>').text("COURSE CATEGORY: ");
            var $coursec=$('<div class="link-separator col-md-5">').append($COURSEC);
            var $temp = '<a onclick="get_category('+ data.course_category_cardinality[0].category_id +')" href="#">';
            $coursec.append($($temp).text(data.course_category_cardinality[0].category_name));
            var $cardinality = $('<div class="row">').append($("<div class='col-md-1'>")).append($instructor).append($coursec);
            var $firstrow = $('<div class="row">').append($description).append($cardinality);

            var $TARGET = $('<h2>').text("Target: ");
            var $target_content = $('<div class="col-md-5">').append($TARGET).append("<p>" + data.course_category_cardinality[0].good_for);
            var $target = ($('<div class="row">').append($('<div class="col-md-1">'))).append($target_content);
            var $secondrow = $('<div class="row">').append($target);

            //room cardinality
            var $ROOM = $('<b>').text("ROOM: ");
            var $room = $('<div class="link-separator col-md-5">').append($ROOM);
            var $temp = '<a onclick="get_room('+ data.rows[0].room_id +')" href="#">';
            $room.append($($temp).text(data.rows[0].room_name));

            //schedule
            var $SCHEDULE = $('<b>').text("SCHEDULE: ");
            var $schedule = $('<div class="col-md-5">').append($SCHEDULE);
            $schedule.append(data.rows[0].schedule);

            var $cardinality = $('<div class="row">').append($('<div class="col-md-1">')).append($room).append($schedule);
            var $thirdrow = $('<div class="row">').append($cardinality);

            // pics
            var $temp1 ='<img src="Pictures/course/' + data.rows[0].course_id + '-1.jpg">';
            var $temp2 ='<img src="Pictures/course/' + data.rows[0].course_id + '-2.jpg">';
            var $img1 = $($temp1);
            var $img2 = $($temp2);
            var $fourthrow = $('<div class="row">').append($('<div class="col-md-1">'));
            $fourthrow.append($('<div class="col-md-5">').append($img1)).append($('<div class="col-md-5">').append($img2));

            $('#page_content').append($firstrow).append($secondrow).append($thirdrow).append($fourthrow);
        },
        type : 'GET'
    });
}
function get_category($category_id){
    $(".nav li").removeClass('active');
    push_stack(stack,"get_category(" + $category_id + ")");
    var $url = $base_url + 'course_category/get_course_category/'+$category_id;
    $.ajax({
        url : $url,
        data : {
            format : 'json'
        },
        error: function(xhr,err) {
            $('#page_content').append("readyState: "+xhr.readyState+"\nstatus: "+xhr.status);
            $('#page_content').append("responseText: "+xhr.responseText)
        },
        dataType : 'json',
        success : function(data) {
            $('#page_content').html("");
            var $temp ='<img src="Pictures/course_category/' + data.rows[0].category_id+ '.jpg">';
            var $img = $($temp);
            var $onecolumn = $('<div class="col-md-1">').text(" ");
            var $firstcolumn = $('<div class="col-md-5">').append($img);
            var $category_name = $('<h2>').text(data.rows[0].category_name);
            //TODO link does not work
            var $breadcrumb = $('<ol class="breadcrumb">');
            $breadcrumb.append($('<li>').append('<a href="#" onclick="get_our_gym()">').append("Home"));
            $breadcrumb.append($('<li>').append('<a href="#" onclick="get_instructors()">').append("Course Categories"));
            $breadcrumb.append($('<li>').append('<a href="#\" class="active">').append(data.rows[0].category_name));
            var $DESCRIPTION = $('<h4>').text("DESCRIPTION");
            var $about = $("<p>").text(data.rows[0].about);
            //instructor cardinality
            var $INSTRUCTOR = $('<b>').text("INSTRUCTOR: ");
            var $instructor=$('<div class="link-separator">').append($INSTRUCTOR);
            for (i = 0; i < data.instructor_cardinality.length; i++)
            {
                //alert(data.instructor_cardinality[i].full_name);
                var $temp = '<a onclick="get_instructor('+ data.instructor_cardinality[i].instructor_id +')" href="#">';
                $instructor.append($($temp).text(data.instructor_cardinality[i].full_name));
            }

            //course cardinality
            $COURSE = $('<b>').text("COURSE: ");
            var $courses = $('<div class="link-separator">').append($COURSE);
            for (i = 0; i < data.course_cardinality.length; i++){
                var $temp = '<a onClick="get_course('+ data.course_cardinality[i].course_id +')">';
                $courses.append($($temp).text(data.course_cardinality[i].course_name));
            }

            var $secondcolumn = $('<div class="col-md-5">').append($category_name).append($breadcrumb).append($DESCRIPTION).append($about).append($instructor).append($courses);
            var $firstrow = ($('<div class="row">').append($('<div class="col-md-1">'))).append($firstcolumn).append($secondcolumn);

            var $secondrow = $('<div calss="row">').append($('<h2 style="text-align: center">').text("VIDEO of origin"));

            var $GOOD_FOR = $('<h2>').text('WHY IS GOOD?');
            var $good_for = $('<p>').text(data.rows[0].good_for);
            var $firstcolumn = $('<div class="col-md-5">').append($GOOD_FOR).append($good_for);
            var $PRACTICE = $('<h2>').text('WHO IS GOOD TO PRACTICE?');
            var $practices = $('<div class="row">').text(data.rows[0].practices);
            var $secondcolumn = $('<div class="col-md-5">').append($PRACTICE).append($practices);
            var $thirdrow = $('<div class="row">').append($onecolumn).append($firstcolumn).append($secondcolumn);
            $('#page_content').append($firstrow).append($secondrow).append($thirdrow);//.append($fourthrow);

        },
        type : 'GET'
    });
}
function get_room($room_id){
    $(".nav li").removeClass('active');
    push_stack(stack,"get_room(" + $room_id + ")");
    var $url = $base_url + 'room/get_room/'+$room_id;
    $.ajax({
        url : $url,
        data : {
            format : 'json'
        },
        error: function(xhr,err) {
            $('#page_content').append("readyState: "+xhr.readyState+"\nstatus: "+xhr.status);
            $('#page_content').append("responseText: "+xhr.responseText)
        },
        dataType : 'json',
        success : function(data) {
            var $room_id = $('<h1>').text(data.rows[0].room_id);
            var $room_name = $('<h1>').text(data.rows[0].room_name);
            //TODO link does not work
            var $breadcrumb = $('<ol class="breadcrumb">');
            $breadcrumb.append($('<li>').append('<a href="#" onclick="get_our_gym()">').append("Home"));
            $breadcrumb.append($('<li>').append('<a href="#" onclick="get_instructors()">').append("Rooms"));
            $breadcrumb.append($('<li>').append('<a href="#\" class="active">').append(data.rows[0].room_name));
            $('#page_content').html("");
            var $temp ='<img src="Pictures/room/' + data.rows[0].room_id+ '-1.jpg">';
            var $img = $($temp);
            var $onecolumn = $('<div class="col-md-1">').text(" ");
            var $secondcolumn = $('<div class="col-md-5">').append($img);
            var $room_name = $('<h1>').text(data.rows[0].room_name);

            //course cardinality
            var $COURSE = $('<b>').text("COURSE: ");
            var $courses = $('<div class="link-separator row">').append($COURSE);
            for (i = 0; i < data.course_cardinality.length; i++){
                var $temp = '<a onClick="get_course('+ data.course_cardinality[i].course_id +')">';
                $courses.append($($temp).text(data.course_cardinality[i].course_name));
            }
            var $firstcolumn = $('<div class="col-md-5">').append($room_name).append($breadcrumb).append($courses);
            var $firstrow = $('<div class="row">').append($onecolumn).append($firstcolumn).append($secondcolumn);

            // pics
            var $temp1 ='<img src="Pictures/room/' + data.rows[0].room_id + '-2.jpg">';
            var $temp2 ='<img src="Pictures/room/' + data.rows[0].room_id + '-3.jpg">';
            var $img1 = $($temp1);
            var $img2 = $($temp2);
            var $secondrow = $('<div class="row">').append($('<div class="col-md-1">'));
            $secondrow.append($('<div class="col-md-5">').append($img1)).append($('<div class="col-md-5">').append($img2));
            
            var $thirdrow =$('<div class="row">').append($('<h1>').text("GMAP")).append(data.rows[0].coord_x).append(' ').append(data.rows[0].coord_y);

            $('#page_content').append($firstrow).append($secondrow).append($thirdrow);
        },
        type : 'GET'
    });
}
function get_our_gym() {$("#our_gym").click();};
function get_location() {$("#location").click();};
function get_testimonials() {$("#testimonials").click();};
function get_overall_schedule() {$("#overall_schedule").click();};
function get_fees_and_registration() {$("#fees_and_registration").click();};
function get_our_equipment() {$("#our_equipment").click();};
function get_instructors() {$("#instructors").click();};
function get_instructors_month() {$("#instructors_month").click();};
function get_courses_alphabet() {$("#courses_alphabet").click();};
function get_courses_level() {$("#courses_level").click();};
function get_course_categories() {$("#course_categories").click();};
function get_rooms() {$("#rooms").click();};
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
    setVisibility();
    $("#back_button").click(function() {
        if (!back_flag) return;
        ele = stack.pop();
        if (stack.length == 1) {
            back_flag = false;
        }
        forward_stack.push(ele);
        forward_flag = true;
        setVisibility();
        ignore = true;
        eval(stack[stack.length-1]);
    });
    $("#forward_button").click(function() {
        if (!forward_flag) return;
        ele = forward_stack.pop();
        if (forward_stack.length == 0) {
            forward_flag = false;
        }
        stack.push(ele);
        back_flag = true;
        setVisibility();
        ignore = true;
        eval(ele);
    });
    $(".navigator").click(function(event) {
        if (ignore) {ignore=false; return;}
        $(".nav li").removeClass('active');
        str = "get_" + event.target.id + "()";;
        push_stack(stack, str);
        forward_stack = [];
        forward_flag = false;
        back_flag = stack.length > 1;
        setVisibility();
    });
    $("#overall_schedule").click(function() {
        $.ajax({
            url: $base_url + 'schedule/get_all',
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
                var $HEADING = $('<h1>').text('OVERALL SCHEDULE');
                $('#page_content').append($HEADING);
                schedule = $('<div class="col-md-10">');
                table = $('<table class="schedule">');
                row = $('<tr>');
                days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
                row.append($('<th>').text(""));
                for (i = 0; i<7; i++) {
                    row.append($('<th>').text(days[i]));
                }
                table.append(row);
                for (i = 0; i < data.rows.length; i++) {
                    row = $('<tr>');
                    hour = data.rows[i].Hour;
                    row.append($('<th>').text(hour + ":00"));
                    for (j = 0; j<7; j++) {
                        id = eval('data.rows[i].' + days[j]);
                        if (id != null) {
                            txt = data.cardinality[parseInt(id) - 1].course_name;
                            tmp ='<td onclick="' + 'get_course(' + id + ')'  + '">'
                            row.append($(tmp).text(txt));
                        }
                        else {
                            row.append($('<td>').text(""));
                        }
                    }
                    table.append(row);
                }
                all = $('<div class="row">').append($('<div class="col-md-1">'));
                all.append(schedule.append(table));
                $('#page_content').append(all);
            },
            type: 'GET'
        });
    });
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
                var $HEADING = $('<h1>').text('ALL INSTRUCTORS');
                $('#page_content').append($HEADING);
                var $full_name;
                var $bio;
                for (i = 0; i < data.rows.length; i++) {
                    var $temp = '<img src="Pictures/ins-img/' + data.rows[i].instructor_id + '.jpg">';
                    $img = $($temp);
                    $onecolumn = $('<div class="col-md-1">').text(" ");
                    $first = $('<div class="col-md-5">').append($img);
                    $full_name = $('<h1>').text(data.rows[i].full_name);
                    $temp = '<a onClick="get_instructor(' + data.rows[i].instructor_id + ')" href="#">';
                    $link = $($temp).text("More");
                    $BIOGRAPHY = $('<h4>').text("BIOGRAPHY");
                    $bio = $('<p>').text(data.rows[i].bio.substring(0, 800) + "... ").append($link);

                    $second = $('<div class="col-md-5">').append($full_name).append($BIOGRAPHY).append($bio);
                    //$divs = null;
                    if (i % 2 == 1)
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
                var $HEADING = $('<h1>').text('INSTRUCTORS OF MONTH');
                $('#page_content').append($HEADING)
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
                    $BIOGRAPHY = $('<h5>').text("BIOGRAPHY");
                    $bio = $('<p>').text(data.rows[i].bio.substring(0, 800) + "... ").append($link);

                    $second = $('<div class="col-md-5">').append($full_name).append($BIOGRAPHY).append($bio);
                    if (i%2 == 0)
                        $divs = $('<div class="row backgroundgrey">').append($onecolumn).append($first).append($second);
                    else $divs = $('<div class="row">').append($onecolumn).append($first).append($second);
                    $('#page_content').append($divs);
                }
            },
            type: 'GET'
        });
    });
    $("#courses_alphabet").click(function() {
        $.ajax({
            url : $base_url + 'course/get_courses_alphabet',
            data : {
                format : 'json'
            },
            error: function(xhr,err) {
                $('#page_content').append("readyState: "+xhr.readyState+"\nstatus: "+xhr.status);
                $('#page_content').append("responseText: "+xhr.responseText)
            },
            dataType : 'json',
            success : function(data) {
                //clear the html code
                $('#page_content').html("");
                var $HEADING = $('<h1>').text('ALL COURSES IN ALPHABETIC ORDER');
                $('#page_content').append($HEADING);
                var $full_name;
                var $bio;
                for (i = 0; i < data.rows.length; i++){
                    var $temp ='<img src="Pictures/course/' + data.rows[i].course_id+ '-1.jpg">';
                    $img = $($temp);
                    $onecolumn = $('<div class="col-md-1">').text(" ");
                    $first = $('<div class="col-md-5">').append($img);
                    $course_name = $('<h2>').text(data.rows[i].course_name);
                    //here using substring cut the long bio to small one to fit the front page
                    $temp = '<a onClick="get_course('+ data.rows[i].course_id +')" href="#">';
                    $link = $($temp).text("More");
                    $DESCRIPTION = $('<h5>').text("DESCRIPTION");
                    $description = $('<p>').text(data.rows[i].description.substring(0,550) + "... ").append($link);
                    $COURSESC = $('<b>').text("COURSE CATEGORY: ");
                    var $course_categories;
                    $course_categories = $('<div class="link-separator">').append($COURSESC);
                    var $temp = '<a onClick="get_category('+ data.rows[i].category_id +')" href="#">';
                    $category_link = $($temp).text(data.rows[i].category_name);
                    $course_categories.append($category_link);
                    $COURSEL = $('<b>').text("COURSE LEVEL: ");
                    $course_level = data.rows[i].level;
                    $COURSEL.append($course_level);
                    $second = $('<div class="col-md-5">').append($course_name).append($DESCRIPTION).append($description).append($course_categories).append($COURSEL);
                    $divs = $('<div class="row">').append($onecolumn).append($first).append($second);
                    if (i%2 == 0)
                        $divs = $('<div class="row backgroundgrey">').append($onecolumn).append($first).append($second);
                    else $divs = $('<div class="row">').append($onecolumn).append($first).append($second);
                    $('#page_content').append($divs);
                }
            },
            type : 'GET'
        });
    });
    $("#courses_level").click(function() {
        $.ajax({
            url : $base_url + 'course/get_courses_level',
            data : {
                format : 'json'
            },
            error: function(xhr,err) {
                $('#page_content').append("readyState: "+xhr.readyState+"\nstatus: "+xhr.status);
                $('#page_content').append("responseText: "+xhr.responseText)
            },
            dataType : 'json',
            success : function(data) {
                //clear the html code
                $('#page_content').html("");
                var $HEADING = $('<h1>').text('ALL COURSES IN LEVEL ORDER');
                $('#page_content').append($HEADING);
                var $full_name;
                var $bio;
                var $level="";
                var $SEPARATOR = $('<div class="divider_jackie">')
                //alert(!$level == data.rows[0].level);
                for (i = 0; i < data.rows.length; i++){
                    var $temp ='<img src="Pictures/course/' + data.rows[i].course_id+ '-1.jpg">';
                    $img = $($temp);
                    $onecolumn = $('<div class="col-md-1">').text(" ");
                    $first = $('<div class="col-md-5">').append($img);
                    $course_name = $('<h2>').text(data.rows[i].course_name);
                    //here using substring cut the long bio to small one to fit the front page
                    $temp = '<a onClick="get_course('+ data.rows[i].course_id +')" href="#">';
                    $link = $($temp).text("More");
                    $DESCRIPTION = $('<h5>').text("DESCRIPTION");
                    $description = $('<p>').text(data.rows[i].description.substring(0,550) + "... ").append($link);
                    $COURSESC = $('<b>').text("COURSE CATEGORY: ");
                    var $course_categories;
                    $course_categories = $('<div class="link-separator">').append($COURSESC);
                    var $temp = '<a onClick="get_category('+ data.rows[i].category_id +')" href="#">';
                    $category_link = $($temp).text(data.rows[i].category_name);
                    $course_categories.append($category_link);
                    $COURSEL = $('<b>').text("COURSE LEVEL: ");
                    $course_level = data.rows[i].level;
                    $COURSEL.append($course_level);
                    $second = $('<div class="col-md-5">').append($course_name).append($DESCRIPTION).append($description).append($course_categories).append($COURSEL);
                    if (i%2 == 0)
                        $divs = $('<div class="row backgroundgrey">').append($onecolumn).append($first).append($second);
                    else $divs = $('<div class="row">').append($onecolumn).append($first).append($second);
                    //separator
                    var $temp_level = data.rows[i].level.toString()
                    if($level != $temp_level)
                    {
//							corresponding code for separator, icon need awesome font support!!css for class="divider_jackie" is on the top of this page!!
//					 		<div class="divider_jackie">
//					 		<i class="fa fa-heart-o fa-lg"></i>
//							basic
//					 		</div>
                        $level = data.rows[i].level;
                        $SEPARATOR.append($level);
                        $('#page_content').append('<i class="fa fa-heart-o fa-lg">').append($SEPARATOR);
                        $SEPARATOR = $('<div class="divider_jackie">');
                    }
                    $('#page_content').append($divs);
                }
            },
            type : 'GET'
        });
    });
    $("#course_categories").click(function() {
        $.ajax({
            url : $base_url + 'course_category/get_course_categories',
            data : {
                format : 'json'
            },
            error: function(xhr,err) {
                $('#page_content').append("readyState: "+xhr.readyState+"\nstatus: "+xhr.status);
                $('#page_content').append("responseText: "+xhr.responseText)
            },
            dataType : 'json',
            success : function(data) {
                //clear the html code
                $('#page_content').html("");
                var $HEADING = $('<h1>').text('ALL COURSE CATEGORIES');
                $('#page_content').append($HEADING);
                var $category_name;
                var $about;
                for (i = 0; i < data.rows.length; i++){
                    var $temp ='<img src="Pictures/course_category/' + data.rows[i].category_id+ '.jpg">';
                    $img = $($temp);
                    $onecolumn = $('<div class="col-md-1">').text(" ");
                    $first = $('<div class="col-md-5">').append($img);
                    $category_name = $('<h1>').text(data.rows[i].category_name);
                    //here using substring cut the long bio to small one to fit the front page
                    $temp = '<a onClick="get_category('+ data.rows[i].category_id +')" href="#">';
                    $link = $($temp).text("More");
                    $DESCRIPTION = $('<h5>').text("DESCRIPTION");
                    $about = $('<p>').text(data.rows[i].about.substring(0,550) + "... ").append($link);

                    $second = $('<div class="col-md-5">').append($category_name).append($DESCRIPTION).append($about);
                    if (i%2 == 0)
                        $divs = $('<div class="row backgroundgrey">').append($onecolumn).append($first).append($second);
                    else $divs = $('<div class="row">').append($onecolumn).append($first).append($second);
                    $('#page_content').append($divs);
                }
            },
            type : 'GET'
        });
    });
    $("#rooms").click(function() {
        $.ajax({
            url : $base_url + 'room/get_rooms',
            data : {
                format : 'json'
            },
            error: function(xhr,err) {
                $('#page_content').append("readyState: "+xhr.readyState+"\nstatus: "+xhr.status);
                $('#page_content').append("responseText: "+xhr.responseText)
            },
            dataType : 'json',
            success : function(data) {
                for (i = 0; i < data.rows.length; i++){
                    var $room_id = $('<h1>').text(data.rows[i].room_id);
                    var $room_name = $('<h1>').text(data.rows[i].room_name);
                    $('#page_content').append($room_id).append($room_name);
                }
                //clear the html code
                $('#page_content').html("");
                var $HEADING = $('<h1>').text('ALL ROOMS');
                $('#page_content').append($HEADING);
                var $category_name;
                var $about;
                var $divs;
                for (i = 0; i < data.rows.length; i++){
                    var $temp ='<img src="Pictures/room/' + data.rows[i].room_id+ '-1.jpg">';
                    $img = $($temp);
                    $onecolumn = $('<div class="col-md-1">').text(" ");
                    $second = $('<div class="row">').append($img);
                    $room_name = $('<h1>').text(data.rows[i].room_name);
                    $temp = '<a onClick="get_room('+ data.rows[i].room_id +')" href="#">';
                    $first = $('<div class="row">').append($room_name);
                    $div = $('<div class="col-md-5">').append($onecolumn).append($first).append($second);
                    $link = $($temp).append($div);
                    //alternative color
                    if(i%4==0 || i%4==1)
                    {
                    	if(i%4==0)
                    		$divs=$('<div class="row backgroundgrey">').append($link);
                    	else{
                    		$divs.append($link);
                    		$('#page_content').append($onecolumn).append($divs);
                    	}
                    }
                    else
                    {
                    	if(i%4==2)
                    		$divs=$('<div class="row">').append($link);
                    	else{
                    		$divs.append($link);
                    		$('#page_content').append($onecolumn).append($divs);
                    	}
                    }
                    // backgroundgrey
                }
            },
            type : 'GET'
        });
    });
});


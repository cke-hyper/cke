/**
 * Created by Mert on 6/4/2015.
 */

var back_flag = false;
var forward_flag = false;
var stack = [];

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

$(document).ready(function() {
    setVisibility();
    $("#back_button").click(function() {
        if (!back_flag) return;

    });
    $("#forward_button").click(function() {
        if (!forward_flag) return;
    });
});
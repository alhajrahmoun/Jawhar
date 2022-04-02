// Entry point for the build script in your package.json
import "./jquery"
import Rails from '@rails/ujs';

Rails.start();

import "jquery-ui-dist/jquery-ui.min"
import "overhang/dist/overhang.min"
import '@client-side-validations/client-side-validations/src'
import 'materialize-css/dist/js/materialize.min'

import "trix"
import "@rails/actiontext"
import "./controllers"

$(document).ready(function() {
    $("#owner a.add_fields").
    data('association-insertion-method', 'after').
    data('association-insertion-node', 'this');
});

$( document ).ready(function(){
    $(".button-collapse").sidenav();
    // Open Search Modal On Click
    $(".search").click(function (){
        $(".box-search").fadeIn(500);
        $("body").css("overflow","hidden");
    });
    // Open Search Modal On Click
    $(".close").click(function () {
        $(".box-search").fadeOut(500);
        $("body").css("overflow","scroll");
    });
});
$( document ).ready(function(){
    $(".button-collapse").sideNav();
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


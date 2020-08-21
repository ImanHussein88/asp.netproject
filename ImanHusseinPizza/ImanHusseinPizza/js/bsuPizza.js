$('#drawerMenu').drawer({ toggle: false });

$('#en').click(function () {
    var opts = { language: "en", pathPrefix: "/lang" };
    $("[data-localize]").localize("homepage", opts);
});
$('#ch').click(function () {
    var opts = { language: "ch", pathPrefix: "/lang" };
    $("[data-localize]").localize("homepage", opts);
});

$('#ar').click(function () {
    var opts = { language: "ar", pathPrefix: "/lang" };
    $("[data-localize]").localize("homepage", opts);
});
// to make picctures move
$('#main-slider').liquidSlider({
    autoSlide: true
});
//

function startIntro() {
    var intro = introJs();
    intro.setOptions({
        steps: [
          {
              intro: "Welcome to BSUPizza!"
          },
          {
              intro: "You can get <b>THE BEST PIZZA</b> here."
          },
          {
              element: document.querySelector('#navBar'),
              intro: "This is a navigation bar."
          },
          {
              element: document.querySelector('#main-slider'),
              intro: "View our products here."
          }
             //add two more steps for Home page
        ]
    });
    intro.start();
}



import Typed from 'typed.js';

// const input = document.querySelector("#banner-typed-text");
const input = document.querySelector('input[type=text]')
const loadDynamicBannerText = () => {
  if (input) {
    console.log("hello there, aren't you sneaky?");
    new Typed(input, {
      strings: ["Looking for something in particular?", "Looking for Godzilla?", "Looking for a sexy witch?", "Looking for Pikachu?", "Looking for Goku?", "Looking for Abraham Lincoln?", "Looking for Naruto?"],
      typeSpeed: 40,
      loop: true,
      startDelay: 30,
      backSpeed: 30,
      smartBackspace: true,
      showCursor: true,
      cursorChar: '|',
      autoInsertCss: true,
      attr: "placeholder"
    });
  }
}

export { loadDynamicBannerText };

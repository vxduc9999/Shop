<<<<<<< HEAD
const imgs = document.querySelectorAll('.img-select a');
const imgBtns = [...imgs];
let imgId = 1;

imgBtns.forEach((imgItem) => {
    imgItem.addEventListener('click', (event) => {
        event.preventDefault();
        imgId = imgItem.dataset.id;
        slideImage();
    });
=======
function mydate() {
    //alert("");
    document.getElementById("dt").hidden = false;
    document.getElementById("ndt").hidden = true;
}
function mydate1() {
    d = new Date(document.getElementById("dt").value);
    dt = d.getDate();
    mn = d.getMonth();
    mn++;
    yy = d.getFullYear();
    document.getElementById("ndt").value = dt + "/" + mn + "/" + yy
    document.getElementById("ndt").hidden = false;
    document.getElementById("dt").hidden = true;
}

// Navigate product images
const BigImage = document.getElementById('big-image');
const imgSlider = document.getElementById('img-slider');

imgSlider.addEventListener('click', event => {

    if (event.target === Nomos1) {
        BigImage.setAttribute("src", "/client/images/product/1.jpg");
    }

    else if (event.target === Nomos2) {
        BigImage.setAttribute("src", "/client/images/product/1.jpg");
    }

    else {
        BigImage.setAttribute("src", "/client/images/product/1.jpg");
    }

>>>>>>> 154745039d97a87581aaf5b007a12253c4cf10fd
});

function slideImage() {
    const displayWidth = document.querySelector('.img-showcase img:first-child').clientWidth;

    document.querySelector('.img-showcase').style.transform = `translateX(${- (imgId - 1) * displayWidth}px)`;
}

window.addEventListener('resize', slideImage);

<<<<<<< HEAD

=======
// Navigate information
>>>>>>> 154745039d97a87581aaf5b007a12253c4cf10fd
const chooseInfo = document.getElementById('more-infos');
const choose = document.getElementsByClassName('choose');
const paragraph = document.getElementsByClassName('paragraph');


<<<<<<< HEAD
function styleItem(a, b) {
=======
function styleItem(a, b, c) {
>>>>>>> 154745039d97a87581aaf5b007a12253c4cf10fd
    a.style.cssText = 'color:black ; border-bottom: 2px solid black ; padding-bottom: 6px';
    b.style.cssText = 'color:gray ; border-bottom: none';
}

<<<<<<< HEAD
function displayPrph(e, f) {
    e.style.display = 'block';
    f.style.display = 'none';
=======
function displayPrph(e, f, g) {
    e.style.display = 'block';
    f.style.display = 'none';
    g.style.display = 'none';
>>>>>>> 154745039d97a87581aaf5b007a12253c4cf10fd
}

chooseInfo.addEventListener('click', event => {

    if (event.target === choose[0]) {

<<<<<<< HEAD
        styleItem(choose[0], choose[1])
        displayPrph(paragraph[0], paragraph[1])
    }

    else {

        styleItem(choose[1], choose[0])
        displayPrph(paragraph[1], paragraph[0])
=======
        styleItem(choose[0], choose[1], choose[2])
        displayPrph(paragraph[0], paragraph[2], paragraph[1])
    }

    else if (event.target === choose[1]) {

        styleItem(choose[1], choose[0], choose[2])
        displayPrph(paragraph[1], paragraph[0], paragraph[2])
    }

    else {
        styleItem(choose[2], choose[0], choose[1])
        displayPrph(paragraph[2], paragraph[0], paragraph[1])
>>>>>>> 154745039d97a87581aaf5b007a12253c4cf10fd
    }
});

// add items to the cart
const addToCart = document.getElementById('add-to-cart');
const itemsAdded = document.getElementById('items-added');
const counter = document.getElementById('counter');

<<<<<<< HEAD
addToCart.addEventListener('click', ev => itemsAdded.textContent = (counter.value));
=======
addToCart.addEventListener('click', ev => itemsAdded.textContent = (counter.value));
>>>>>>> 154745039d97a87581aaf5b007a12253c4cf10fd

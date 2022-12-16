var cart = new Array();
var wishList = new Array();
document.getElementById('showCart').style.display = "none";
document.getElementById('triangle').style.display = "none";
document.getElementById('showWL').style.display = "none";
document.getElementById('triangleWL').style.display = "none";

function addToCart(x) {
    var previousParent = x.parentElement;
    var prodImg = previousParent.previousElementSibling.parentElement.children;
    var urlImage = new URL(prodImg[0].children[0].src);
    var probText = x.parentElement.children;
    var name = probText[0].innerText;
    var price = probText[3].children[0].innerText;
    var quantity = 1;
    var prob = new Array(urlImage, name, price, quantity);

    cart.push(prob);
    showCounterProb();

    //save on session storage
    sessionStorage.setItem('cart', JSON.stringify(cart));
}

function addToWishList(x) {
    var pNode = x.parentElement.parentElement.parentElement.parentElement;
    var prodImg = pNode.parentElement.children
    var urlImage = new URL(prodImg[0].children[0].src);
    var nextParent = pNode.parentElement.parentElement;
    var probText = nextParent.nextElementSibling.children;
    var val = probText[0].innerText;
    var arr = val.split('\n')
    var price2 = arr[2].split(' ');
    var name = arr[0];
    var price = price2[1];
    var prob = new Array(urlImage, name, price);

    wishList.push(prob);
    showCounterProbWL();

}

function arraysIdentical(arr1, arr2) {
    var i = arr1.length;
    if (i !== arr2.length) {
        return false;
    }
    while (i--) {
        if (arr1[i] !== arr2[i]) {
            if (i == 0) {
                return true
            }
            return false;
        }
    }
    return true;
}

function removeToWishList(x) {
    var pNode = x.parentElement.parentElement.parentElement.parentElement;
    var prodImg = pNode.parentElement.children
    var urlImage = new URL(prodImg[0].children[0].src);
    var nextParent = pNode.parentElement.parentElement;
    var probText = nextParent.nextElementSibling.children;
    var val = probText[0].innerText;
    var arr = val.split('\n')
    var price2 = arr[2].split(' ');
    var name = arr[0];
    var price = price2[1];
    var prob = new Array(urlImage, name, price);

    wishList.forEach(element => {
        var bool = arraysIdentical(element, prob)
        if (bool == true) {
            wishList.splice(element, 1)
        }
    });

    showCounterProbWL();
}

function showCounterProb() {
    document.getElementById('numProd').innerText = cart.length + '';
}

function showCounterProbWL() {
    document.getElementById('numProdWL').innerText = wishList.length + '';
}

function showMyCart() {
    var info = "";
    for (let i = 0; i < cart.length; i++) {
        info +=
            '<tr>' +
            '<td> <img src = "' + cart[i][0] + '"alt = ""> < /td>' +
            '<td>' + cart[i][1] + ' </td> ' +
            '<td> ' + cart[i][2] + ' <sup> đ </sup> </td>' +
            '</tr>';
    }
    document.getElementById("myCart").innerHTML = info;
}

function showMyWishList() {
    var info = "";
    for (let i = 0; i < wishList.length; i++) {
        info +=
            '<tr>' +
            '<td> <img src = "' + wishList[i][0] + '"alt = ""> < /td>' +
            '<td>' + wishList[i][1] + ' </td> ' +
            '<td> ' + wishList[i][2] + ' <sup> đ </sup> </td>' +
            '</tr>';
    }
    document.getElementById("myWL").innerHTML = info;
}


function showCart() {

    var x = document.getElementById("showCart");
    var y = document.getElementById("triangle");
    if (x.style.display == "block" && y.style.display == "block") {
        x.style.display = "none";
        y.style.display = "none";
    } else {
        x.style.display = "block";
        y.style.display = "block";
    }
    showMyCart();
}

function showWishList() {

    var x = document.getElementById("showWL");
    var y = document.getElementById("triangleWL");
    if (x.style.display == "block" && y.style.display == "block") {
        x.style.display = "none";
        y.style.display = "none";
    } else {
        x.style.display = "block";
        y.style.display = "block";
    }
    showMyWishList();
}

function hideCart() {
    document.getElementById('showCart').style.display = "none";
    document.getElementById('triangle').style.display = "none";
}

function hideWishList() {
    document.getElementById('showWL').style.display = "none";
    document.getElementById('triangleWL').style.display = "none";
}

function showShoppingCart() {
    var cr = sessionStorage.getItem('cart');
    var myCart = JSON.parse(cr);
    var info = "";
    var total = 0;
    for (let i = 0; i < cart.length; i++) {
        total = cart[i][2] * cart[i][3];
        info += '<tr>' +
            '<td class = "product__cart__item">' +
            '<div class = "product__cart__item__pic">' +
            '<img src = "' + cart[i][0] + '"alt = "">' +
            '</div> <div class = "product__cart__item__text">' +
            '<h6> ' + cart[i][1] + ' </h6> <h5 > $' + cart[i][2] + ' </h5></div></td> ' +
            '<td class = "quantity__item">' +
            '<div class = "quantity">' +
            '<div class = "pro-qty-2">' +
            '<input type = "text" value = "' + cart[i][3] + '">' +
            '</div> </div> </td> ' +
            '<td class = "cart__price"> $ ' + total + ' < /td>' +
            '<td class = "cart__close"> <i class = "fa fa-close"> </i></td>' +
            '</tr>';
    }
    document.getElementById("shoppingCart").innerHTML = info;
}

// show navigation 
$(function() {
    //caches a jQuery object containing the header element
    var header = $(".header");
    $(window).scroll(function() {
        var scroll = $(window).scrollTop();
        var windowSide = $(window);

        var windowSize = $(window).width();
        if (windowSize > 780) {
            if (scroll >= 100) {
                header.addClass("scrolled");
            } else {
                header.removeClass("scrolled");
            }
        } else {
            if (scroll >= 80) {
                header.addClass("scrolled");
            } else {
                header.removeClass("scrolled");
            }
        }


    });
});

function changeImage() {
    if (document.getElementsByClassName("wishList").src == "img/icon/heart.png") {
        document.getElementById("wishList").src = "img/icon/heart-solid.png";
    } else {
        document.getElementById("wishList").src = "img/icon/heart.png";
    }
}

let changeIcon = function(icon) {
    if (icon.classList.contains('fa-regular')) {
        icon.classList.remove('fa-regular');
        icon.classList.add('fa-solid');
        addToWishList(icon);
    } else {
        removeToWishList(icon);
        icon.classList.remove('fa-solid');
        icon.classList.add('fa-regular');
    }

};
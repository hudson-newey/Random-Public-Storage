// ==UserScript==
// @name         Anti Virus
// @version      0.1
// @description  Stuff
// @author       Grathium Industries
// @include      *://*
// @grant        none
// ==/UserScript==

(function() {
    'use strict';

    var images = document.getElementsByTagName('img');
    for(var i = 0; i < images.length; i++) {
        images[i].src = 'https://upload.wikimedia.org/wikipedia/commons/a/a1/Mallard2.jpg';
    }
})();

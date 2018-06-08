// ==UserScript==
// @name         Volume Slider for Overcast.fm
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  Adds a volume slider to the Overcast.fm podcast player.
// @author       Árni Dagur
// @match        *://overcast.fm/+*
// @grant        none
// ==/UserScript==

(function() {
    'use strict';
    var vs_div = document.querySelector("html body div.content.pure-u-1 div.pure-g div.pure-u-1.pure-u-sm-3-5 .fullart_container");
    if (vs_div) {
        vs_div.innerHTML += '<div><div class="smallcaps centertext">Volume: <span id="volumenr">1</span></div><input id="volumecontrol" type="range" min="0" max="1" step="0.01" value="1"></input></div>';
        var vs_player = document.getElementById('audioplayer');
        var vs_volcontrol = document.getElementById('volumecontrol');
        var vs_volnr = document.getElementById('volumenr');
        vs_volcontrol.style.cssText = 'width: 100%;';
        vs_volcontrol.addEventListener("change", vs_changeVolume);
        vs_volcontrol.addEventListener("input", vs_changeVolume);
        var vs_sheet = window.document.styleSheets[0];
        vs_sheet.insertRule('#volumecontrol::-webkit-slider-runnable-track{width:100%;height:20px;background-color:#ffdbc1;border-radius:9px}', vs_sheet.cssRules.length);
        vs_sheet.insertRule('#volumecontrol::-webkit-slider-thumb{-webkit-appearance:none;height:20px;width:20px;border-radius:50%;background:#fc7e0f}', vs_sheet.cssRules.length);
        vs_sheet.insertRule('#volumecontrol{width:100%;-webkit-appearance:none;background-color:transparent;outline:0}', vs_sheet.cssRules.length);
    }
    function vs_changeVolume(){
            var vs_value = vs_volcontrol.value;
            vs_player.volume = vs_value;
            vs_volnr.innerHTML = vs_value;
    }
})();


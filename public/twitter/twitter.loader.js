// New code modified to work with locally saved widgets.js (necessary for the extension)
window.twttr = {
  _e: [],
  ready: function(a) {
    this._e.push(a)
  }
};

window.__twttr = {
  verifyCSP: function() {return true;}
};

$(document.head).append('<meta name="twitter:widgets:csp" content="on">');


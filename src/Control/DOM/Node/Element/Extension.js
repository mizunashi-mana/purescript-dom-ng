"use strict";

var getEffProp = function (name) {
  return function (obj) {
    return function () {
      return obj[name];
    };
  };
};

exports._innerHTML = getEffProp("innerHTML");
exports._outerHTML = getEffProp("outerHTML");

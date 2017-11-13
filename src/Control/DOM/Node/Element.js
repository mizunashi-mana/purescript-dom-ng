"use strict";

var getEffProp = function (name) {
  return function (obj) {
    return function () {
      return obj[name];
    };
  };
};

var setEffProp = function (name) {
  return function (value) {
    return function (obj) {
      return function () {
        obj[name] = value;
      };
    };
  };
};


exports._className = getEffProp("className");
exports._setClassName = setEffProp("className");

exports._classList = getEffProp("classList");

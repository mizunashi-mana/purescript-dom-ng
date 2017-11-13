# purescript-dom-ng

**This project is working in progress.**

## Main idea

Inspired by [purescript-dom-classy](https://github.com/garyb/purescript-dom-classy), but more generic.

### Generic APIs Based Type Classes

DOM APIs have many interfaces (e.g. `HTMLDocument` is a instance of `Document`).  However, [purescript-dom](https://github.com/purescript-web/purescript-dom) do not support interfaces.

### Refactor API Trees

* Control.DOM: interface members and methods
* Data.DOM: interfaces and newtypes
    - Effect: DOM Effects
	- Event: event interfaces
	- Node: node interfaces
	- HTML: HTML partial interfaces by HTML Spec

### Add Useful APIs

### Support Extension APIs

## Problems

### Subtypings are complex.

## Main References

* WhatWG Specifications
   - HTML Standard: https://html.spec.whatwg.org/ 
   - DOM Standard: https://dom.spec.whatwg.org/

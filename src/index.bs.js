// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as Counter from "./Counter.bs.js";
import * as ReactDom from "react-dom";

function s(str) {
  return str;
}

var root = document.querySelector("#root");

if (root == null) {
  console.log("Error");
} else {
  ReactDom.render(React.createElement(Counter.make, {
            initialCount: 0
          }), root);
}

export {
  s ,
  
}
/* root Not a pure module */
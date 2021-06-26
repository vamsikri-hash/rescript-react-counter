let s = str => React.string(str)

@react.component
let make = (~text, ~className, ~handleClick) => {
  <button className onClick={handleClick}> {s(text)} </button>
}

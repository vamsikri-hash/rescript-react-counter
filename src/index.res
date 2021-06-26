let s = React.string

switch ReactDOM.querySelector("#root") {
| Some(root) => ReactDOM.render(<Counter initialCount={0} />, root)
| None => Js.log("Error")
}

open LogEntry

let s = str => React.string(str)

module LogItem = {
  @react.component
  let make = (~text) => <p> {s(text)} </p>
}

@react.component
let make = (~logs) => {
  let logItems =
    logs->Belt.Array.map(log =>
      <LogItem key={log->LogEntry.id->Belt.Int.toString} text={log->LogEntry.text} />
    )

  <div className="h-36 overflow-y-scroll border bg-gray-200 text-sm py-2 px-4">
    {logItems->React.array}
  </div>
}

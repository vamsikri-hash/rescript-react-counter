open LogEntry

let s = React.string

type action = Increment | Decrement | Reset(int)

let reducer = (state, action) => {
  switch action {
  | Increment => state + 1
  | Decrement => state - 1
  | Reset(initialCount) => initialCount
  }
}

@react.component
let make = (~initialCount) => {
  let (count, dispatch) = React.useReducer(reducer, initialCount)
  let (history, setHistory) = React.useState((): array<LogEntry.t> => [])

  let countColor = if count > 0 {
    "bg-green-400"
  } else if count < 0 {
    "bg-red-400"
  } else {
    "bg-yellow-400"
  }

  <div className="mt-24 max-w-4xl mx-auto">
    <p className={`${countColor} mb-8 py-4 text-4xl text-center`}>
      {s(`Count is  ${count->Belt.Int.toString}`)}
    </p>
    <div className="flex justify-center mb-16">
      <Button
        text="Increment"
        className="border py-2 px-3 bg-gray-200 hover:bg-green-500 mr-2"
        handleClick={_mouseEvt => {
          dispatch(Increment)
          setHistory(xs =>
            Js.Array2.concat([`Increment ${count->Belt.Int.toString}`->LogEntry.make], xs)
          )
        }}
      />
      <Button
        text="Decrement"
        className="border py-2 px-3 bg-gray-200 hover:bg-red-500 mr-2"
        handleClick={_mouseEvt => {
          dispatch(Decrement)
          setHistory(xs =>
            Js.Array2.concat([`Decrement ${count->Belt.Int.toString}`->LogEntry.make], xs)
          )
        }}
      />
      <Button
        text="Reset"
        className="border py-2 px-3 bg-gray-200 hover:bg-yellow-500 mr-2"
        handleClick={_mouseEvt => {
          dispatch(initialCount->Reset)
          setHistory(xs =>
            Js.Array2.concat([`Reset @ ${count->Belt.Int.toString}`->LogEntry.make], xs)
          )
        }}
      />
    </div>
    <LogsViewer logs=history />
  </div>
}

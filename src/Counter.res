let s = React.string

@react.component
let make = (~initialCount) => {
  let (count, setCount) = React.useState(() => initialCount)

  let countColor = if count > 0 {
    "bg-green-400"
  } else if count < 0 {
    "bg-red-400"
  } else {
    "bg-yellow-400"
  }

  <div className="text-center mt-24 max-w-4xl mx-auto">
    <p className={`${countColor} mb-8 py-4 text-4xl text-center`}>
      {s(`Count is  ${count->Belt.Int.toString}`)}
    </p>
    <div className="flex justify-center">
      <Button
        text="Increment"
        className="border py-2 px-3 bg-gray-200 hover:bg-green-500 mr-2"
        handleClick={_mouseEvt => setCount(x => x + 1)}
      />
      <Button
        text="Decrement"
        className="border py-2 px-3 bg-gray-200 hover:bg-red-500 mr-2"
        handleClick={_mouseEvt => setCount(x => x - 1)}
      />
      <Button
        text="Reset"
        className="border py-2 px-3 bg-gray-200 hover:bg-yellow-500 mr-2"
        handleClick={_mouseEvt => setCount(_x => initialCount)}
      />
    </div>
  </div>
}

module LogEntry: {
  type t
  let make: string => t
  let id: t => int
  let text: t => string
} = {
  type t = {
    id: int,
    text: string,
  }

  type date

  @new external makeDate: date = "Date"
  @send external getTimstamp: date => int = "getTime"

  let make = text => {id: makeDate->getTimstamp, text: text}

  let id = t => t.id
  let text = t => t.text
}

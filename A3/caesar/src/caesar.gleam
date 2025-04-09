import gleam/int
import gleam/io
import gleam/string
import gleam/list
import gleam/result

pub fn shift_char(shift: Int, c: String) -> UtfCodepoint {
  let default_codepoint = 65  // ASCII 'A'
  
  let code = c
    |> string.to_utf_codepoints
    |> list.first
    |> case _ {
         Ok(codepoint) -> codepoint
         Error(_) -> default_codepoint // this should never hit, but Gleam needs it to compile
      }
  
  let shifted = 65 + int.remainder(int.to_string(code) |> string.to_int |> result.unwrap(0) - 65 + shift + 26, 26)
  
  // convert back to a UtfCodepoint
  shifted
}

pub fn encrypt(shift: Int, str: String) -> String {
  let codepoints = str
    |> string.to_graphemes
    |> list.map(fn(char) {
      let upper = string.uppercase(char)
      shift_char(shift, upper)
    })
  
  string.from_utf_codepoints(codepoints)
}

pub fn decrypt(shift: Int, str: String) -> String {
  encrypt(-shift, str)
}

pub fn solve(text: String) -> Nil {
  list.range(0, 25)
  |> list.each(fn(shift) {
    let decrypted = decrypt(shift, text)
    io.println("Shift " <> int.to_string(shift) <> ": " <> decrypted)
  })
}

pub fn main() {
  let input = "Operation Daybreak"
  io.println(encrypt(2, input))
}
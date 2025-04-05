let shiftChar shift (c: char) =
    if int c >= 65 && int c <= 90 then
        char (65 + ((int c - 65 + shift + 26) % 26))
    else
        c


let encrypt shift (text: string) =
    text.ToUpper().ToCharArray()
    |> Array.map(fun c -> shiftChar shift c)
    |> System.String


let decrypt shift (text: string) =
    encrypt -shift text


let solve (text: string) =
    // print all 26 possible shifts
    for shift in 0..26 do
        printfn "Shift %2d: %s" shift (encrypt shift text)

[<EntryPoint>]
let main args =
    let input = "Operation Daybreak"
    printfn "Original: %s" input
    printfn "Encrypted: %s" (encrypt 2 input)
    printfn "Decrypted: %s" (decrypt 2 (encrypt 2 input))
    solve "HAL"
    0 // terminate main
object Caesar {

  @main def run(): Unit = {
    var code = "Operation Daybreak"
    var shift = 2

    println(" --- Caesar Cipher ---")

    code = Encrypt(code, shift)
    println("Encrypted: " + code)

    code = Decrypt(code, shift)
    println("Decrypted: " + code)
    
    code = "HAL"
    Solve(code)
  }

  def Encrypt(str: String, shift: Int): String = {
    var output = "";
    
    // Convert string's chars to ASCII for shifting one at a time
    for (i <- 0 until str.length) {
      var charASCII = str(i).toInt

      // Lowercase -> UPPERCASE
      if (charASCII >= 97 && charASCII <= 122) {
        charASCII -= 32;  
      }

      // Perform the shift
      if (charASCII >= 65 && charASCII <= 90) {
        charASCII += shift;

        // Bounds wrapping
        while (charASCII > 90) do
          charASCII -= 26;
            
        while (charASCII < 65) do
          charASCII += 26;
        
        output += charASCII.toChar
      } else {
        // Preserve nonalphabetic chars
        output += str(i)
      }
    }
    output
  }

  def Decrypt(str: String, shift: Int): String = {
    // Decrypt can be done as a negative shift
    Encrypt(str, -shift)
  }

  def Solve(str: String): Unit = {
    // Shift 26 times to solve cipher
    println(" -- Solve Cipher --")
    for (shift <- 1 to 26) {
        println(s"Shift $shift: ${Decrypt(str, shift)}")
    }
  }

}
def shiftChar(shift: Int, c: Char): Char = {
  if (!c.isLetter) c
  else {
    val base = if (c.isUpper) 'A' else 'a'
    val position = (c - base + shift) % 26
    val wrappedPosition = if (position < 0) position + 26 else position
    (base + wrappedPosition).toChar
  }
}

def encrypt(shift: Int, str: String): String = {
  val upperStr = str.toUpperCase
  
  upperStr match {
    case "" => ""
    case s if s.length == 1 => shiftChar(shift, s.head).toString
    case s => shiftChar(shift, s.head).toString + encrypt(shift, s.tail)
  }
}



def decrypt(shift: Int, str: String): String = {
    encrypt(-shift, str)
}

def solve(str: String): Unit = {
  // helper function to recursively iterate the shift value upward
  def printShifts(shift: Int): Unit = {
    if (shift <= 26) {
      println(s"Caesar $shift: ${encrypt(shift, str)}")
      
      // recursive call with next shift
      if (shift < 27 ) printShifts(shift + 1)
    }
  }
  
  // kick off the recursion
  printShifts(0)
}

@main def run(): Unit = {
  val input = "Operation Daybreak"
  val shift = 2

  println(" --- Caesar Cipher ---")
  println("Original: " + input)

  val encrypted = encrypt(shift, input)
  println("Encrypted: " + encrypted)

  val decrypted = decrypt(shift, encrypted)
  println("Decrypted: " + decrypted)
  
  val code = "HAL"
  println("\nSolving Cipher:")
  solve(code)
}
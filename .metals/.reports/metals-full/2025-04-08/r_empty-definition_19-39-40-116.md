error id: java/lang/String#length().
file://<HOME>/Library/Mobile%20Documents/com~apple~CloudDocs/Marist%2024-25/Spring%2025/Theory%20of%20Programming%20Languages/Programming-In-The-Past-Collection/A3/caesarFunc.scala
empty definition using pc, found symbol in pc: java/lang/String#length().
empty definition using semanticdb
empty definition using fallback
non-local guesses:
	 -s/length.
	 -s/length#
	 -s/length().
	 -scala/Predef.s.length.
	 -scala/Predef.s.length#
	 -scala/Predef.s.length().
offset: 202
uri: file://<HOME>/Library/Mobile%20Documents/com~apple~CloudDocs/Marist%2024-25/Spring%2025/Theory%20of%20Programming%20Languages/Programming-In-The-Past-Collection/A3/caesarFunc.scala
text:
```scala
def shiftChar(shift: Int, c: Char): Char {

}

def encrypt(shift: Int, str: String): String = {
    var s = str.toUpperCase()
    
    if (s.length() == 0) {
        return ""
    }
    else if (s.lengt@@h() == 1) {
        return shiftChar(shift, s)
    }
    else {
        return (shiftChar(shift, s) + encrypt(shift, s.slice(1, s.length())))
    }
}



def decrypt(shift: Int, str: String): String = {
    
}

def solve(str: String) = {
    
}
```


#### Short summary: 

empty definition using pc, found symbol in pc: java/lang/String#length().
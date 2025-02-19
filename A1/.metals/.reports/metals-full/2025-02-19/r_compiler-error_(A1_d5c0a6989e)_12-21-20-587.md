file://<HOME>/Library/Mobile%20Documents/com~apple~CloudDocs/Marist%2024-25/Spring%20'25/Theory%20of%20Programming%20Languages/Programming-In-The-Past-Collection/A1/caesar.scala
### dotty.tools.dotc.ast.Trees$UnAssignedTypeException: type of Ident(code) is not assigned

occurred in the presentation compiler.

presentation compiler configuration:


action parameters:
offset: 129
uri: file://<HOME>/Library/Mobile%20Documents/com~apple~CloudDocs/Marist%2024-25/Spring%20'25/Theory%20of%20Programming%20Languages/Programming-In-The-Past-Collection/A1/caesar.scala
text:
```scala
object Caesar {

    def main(args: Array[String]): Unit = {
    val code = "Operation Daybreak"
    val shift = 2
    val code [@@]

    }

    def encrypt(str: String, shift: Int): String {

    }

    def decrypt(str: String, shift: Int): String {

    }

    def solve(str: String, maxShift: Int): Unit {

    }

}
```



#### Error stacktrace:

```
dotty.tools.dotc.ast.Trees$Tree.tpe(Trees.scala:74)
	dotty.tools.dotc.util.Signatures$.applyCallInfo(Signatures.scala:208)
	dotty.tools.dotc.util.Signatures$.computeSignatureHelp(Signatures.scala:104)
	dotty.tools.dotc.util.Signatures$.signatureHelp(Signatures.scala:88)
	dotty.tools.pc.SignatureHelpProvider$.signatureHelp(SignatureHelpProvider.scala:46)
	dotty.tools.pc.ScalaPresentationCompiler.signatureHelp$$anonfun$1(ScalaPresentationCompiler.scala:435)
```
#### Short summary: 

dotty.tools.dotc.ast.Trees$UnAssignedTypeException: type of Ident(code) is not assigned
import cpp
class WeakCryptoFunction extends FunctionCall {
  WeakCryptoFunction() {
    this.getTarget().hasName("MD5") or
    this.getTarget().hasName("SHA1") or
    this.getTarget().hasName("DES") or
    this.getTarget().hasName("RC4")
  }
}

// Alert on weak cryptographic function usage
from WeakCryptoFunction call
select call, "Weak cryptographic function detected: " + call.getTarget().getName()

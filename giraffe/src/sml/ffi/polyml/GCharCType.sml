structure GCharCType : C_TYPE =
  struct
    type t = char
    val size = 0w1
    fun get (p, n) =
      Byte.byteToChar (PolyMLFFI.Memory.getWord8 (p, Word.fromInt n))
    fun set (p, n, e) =
      PolyMLFFI.Memory.setWord8 (p, Word.fromInt n, Byte.charToByte e)
  end

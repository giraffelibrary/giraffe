structure GCharCType : C_TYPE =
  struct
    type t = char
    val size = 0w1
    val get = Byte.byteToChar o MLton.Pointer.getWord8
    fun set (p, i, c) = MLton.Pointer.setWord8 (p, i, Byte.charToByte c)
  end

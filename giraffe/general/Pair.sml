infixr &
infixr &&

datatype ('a, 'b) pair = op & of 'a * 'b

structure Pair =
  struct
    type ('a, 'b) t = ('a, 'b) pair
    fun fst (a & _) = a
    fun snd (_ & b) = b
    fun mapFst f (a & b) = f a & b
    fun mapSnd f (a & b) = a & f b
    fun (f && g) (a & b) = f a & g b
  end

val op && = op Pair.&&

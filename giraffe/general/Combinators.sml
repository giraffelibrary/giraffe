structure Combinators =
  struct
    fun I x = x
    fun K x _ = x
    fun S f g x = f x (g x)

    fun $ x f = f x
  end

open Combinators

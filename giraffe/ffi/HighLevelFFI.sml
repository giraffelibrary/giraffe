infixr 0 --->
infixr 1 &&&>

structure HighLevelFFI =
  struct

    (**
     * Composition of withX functions
     *)
    fun (f &&&> g) h (a & b) = f (fn a' => g (fn b' => h (a' & b')) b) a
    fun (f ---> g) x = g o (f x)

  end

open HighLevelFFI

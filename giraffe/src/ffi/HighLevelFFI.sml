(* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

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

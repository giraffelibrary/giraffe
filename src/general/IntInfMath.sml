(* Copyright (C) 2012, 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure IntInfMath :> INT_INF_MATH =
  struct
    fun log10 n =
      let
        fun step (a : int) (n : IntInf.int) : int =
          if n >= 10
          then step (a + 1) (n div 10)
          else if n >= 1
          then a
          else raise Domain
      in
        step 0 n
      end
  end

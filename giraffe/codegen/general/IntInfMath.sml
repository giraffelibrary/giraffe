(* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure IntInfMath :> INT_INF_MATH =
  struct
    type int = IntInf.int

    fun log10 n =
      if n >= 10
      then 1 + log10 (n div 10)
      else if n >= 1
      then 0
      else raise Domain
  end

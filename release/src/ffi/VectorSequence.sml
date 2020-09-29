(* Copyright (C) 2017-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure VectorSequence :> SEQUENCE where type 'a t = 'a vector =
  struct
    open Vector
    type 'a t = 'a vector
    fun get v i = sub (v, i)
    fun set v (i, e) = update (v, i, e)
    fun toList v = List.tabulate (length v, get v)
    fun toVector v = v
    fun fromVector v = v
  end

(* Copyright (C) 2017 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure ListSequence :> SEQUENCE where type 'a t = 'a list =
  struct
    open List
    type 'a t = 'a list
    val sub = nth
    fun appi f =
      let
        fun step n xs =
          case xs of
            [] => ()
          | x :: xs => (f (n, x); step (n + 1) xs)
      in
        step 0
      end
    val toVector = Vector.fromList
    fun fromVector v =
      List.tabulate (Vector.length v, fn i => Vector.sub (v, i))
  end

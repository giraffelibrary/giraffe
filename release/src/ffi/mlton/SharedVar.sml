(* Copyright (C) 2023 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure SharedVar :> SHARED_VAR =
  struct
    type 'a t = 'a ref
    fun new a = ref a
    fun get (ref a) = a

    fun map' r f = r := f (! r)

    fun foldmap' r f x =
      let
        val a = ! r
        val (y, a') = f (x, a)
        val () = r := a'
      in
        y
      end

    fun map r f = MLton.Thread.atomically (fn () => map' r f)
    fun foldmap r f x = MLton.Thread.atomically (fn () => foldmap' r f x)
  end

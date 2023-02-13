(* Copyright (C) 2023 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure SharedVar :> SHARED_VAR =
  struct
    type 'a t = 'a ref * Thread.Mutex.mutex
    fun new a = (ref a, Thread.Mutex.mutex ())
    fun get (ref a, _) = a

    fun map' r f = r := f (! r)

    fun foldmap' r f x =
      let
        val a = ! r
        val (y, a') = f (x, a)
        val () = r := a'
      in
        y
      end

    fun map (r, mutex) = ThreadLib.protect mutex (map' r)
    fun foldmap (r, mutex) f = ThreadLib.protect mutex (foldmap' r f)
  end

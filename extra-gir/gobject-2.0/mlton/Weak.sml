(* Copyright (C) 2023 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure Weak :>
  WEAK
    where type 'a object_class = 'a GObjectObjectClass.class =
  struct
    type 'a t = unit -> 'a option

    type 'a object_class = 'a GObjectObjectClass.class

    fun new object =
      let
        val weakRef = GObjectWeakRef.init object
      in
        fn () =>
          Option.map GObjectObjectClass.toDerivedUnchecked
            (GObjectWeakRef.get weakRef)
      end

    fun app f w = case w () of SOME x => f x | NONE => ()
    fun app1 f w a = case w () of SOME x => f x a | NONE => ()

    fun map f (w, default) = case w () of SOME x => f x | NONE => default
    fun map1 f (w, default) a = case w () of SOME x => f x a | NONE => default 
  end

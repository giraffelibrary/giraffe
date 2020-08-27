(* Copyright (C) 2013-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

(**
 * The functor Closure constructs a closure instance given the type of the
 * called function arguments and the return value.  The type `t` is abstract
 * due to opaque signature matching to ensure that values from different
 * instances cannot be mixed.  Internally the type `t` is representated using
 * a pointer (though the value held may not actually be a meaningful address)
 * to allow a closure value to be used with GLib as the 'user data' parameter
 * whose C type is gpointer.
 *)
functor Closure(
  val name : string
  type args
  type ret
  val exnRetVal : ret
  val callbackFunc : (args, ret) PolyMLFFI.func
) :>
  CLOSURE
    where type args = args
    where type ret = ret =
  struct
    type args = args
    type ret = ret
    type callback = args -> ret

    fun check f x =
      f x
        handle
          e =>
            (
              GiraffeLog.critical (
                concat ["unhandled exception in ", name, " callback"]
              );
              List.app print [exnMessage e, "\n"];
              exnRetVal
            )

    type t = (args -> ret) PolyMLFFI.closure
    val null = PolyMLFFI.nullClosure
    fun make f = PolyMLFFI.closure callbackFunc (check f)
    fun free _ = ()  (* memory leaked *)
    fun call _ = raise Fail "closure must be called from C"

    structure PolyML =
      struct
        val cFunction = PolyMLFFI.cFunction
      end
  end

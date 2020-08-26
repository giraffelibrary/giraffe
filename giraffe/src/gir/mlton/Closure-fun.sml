(* Copyright (C) 2013-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor Closure(
  val name : string
  type args
  type ret
  val exnRetVal : ret
  val noneRetVal : ret
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
              List.app (fn s => List.app print [s, "\n"]) (MLton.Exn.history e);
              exnRetVal
            )

    structure CallbackTable = CallbackTable(type callback = callback)

    type t = CallbackTable.id
    val null = CallbackTable.nullId
    val make = CallbackTable.add
    fun free closure =
      case CallbackTable.remove closure of
        SOME _ => ()
      | NONE   =>
          GiraffeLog.critical (
            concat [
              "cannot free non-existent ", name, " closure id ",
              CallbackTable.fmtId closure
            ]
          )
    fun call closure args =
      case CallbackTable.lookup closure of
        SOME f => check f args
      | NONE   => (
          GiraffeLog.critical (
            concat [
              "cannot call non-existent ", name, " closure id ",
              CallbackTable.fmtId closure
            ]
          );
          noneRetVal
        )
  end

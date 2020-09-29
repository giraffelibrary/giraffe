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
              exnRetVal
            )

    structure Table = WordTable(Word)

    val table = Table.new ()

    structure Memory = GMemory
    local
      open Memory.Pointer
    in
      val toPointer = fromSysWord o SysWord.fromLarge o Word.toLarge
      val fromPointer = Word.fromLarge o SysWord.toLarge o toSysWord
    end

    type t = Memory.Pointer.t
    val null = toPointer Table.nullKey
    val make = toPointer o Table.insert table
    fun free closure =
      case Table.delete table (fromPointer closure) of
        SOME _ => ()
      | NONE   =>
          GiraffeLog.critical (
            concat [
              "cannot free non-existent ", name, " closure id ",
              Table.fmtKey (fromPointer closure)
            ]
          )
    fun call closure args =
      case Table.lookup table (fromPointer closure) of
        SOME f => check f args
      | NONE   => (
          GiraffeLog.critical (
            concat [
              "cannot call non-existent ", name, " closure id ",
              Table.fmtKey (fromPointer closure)
            ]
          );
          noneRetVal
        )

    structure PolyML =
      struct
        val cVal = Memory.PolyML.cPointer
      end
  end

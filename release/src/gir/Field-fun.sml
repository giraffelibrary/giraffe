(* Copyright (C) 2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor Field(
  structure Container : (* implements RECORD and CLASS *)
    sig
      type t
      structure C :
        sig
          structure Pointer : C_POINTER
          type opt = Pointer.opt
          type non_opt = Pointer.non_opt
          type 'a p = 'a Pointer.p

          val withPtr : (non_opt p -> 'a) -> t -> 'a
          val touchPtr : t -> unit
        end
    end
  structure FieldType : FIELD_TYPE where type 'a from_p = 'a
  val offset : unit -> int
) :
  FIELD
    where type t = FieldType.t
    where type container_t = Container.t
    where type C.container_p = Container.C.non_opt Container.C.p =
  struct
    type t = FieldType.t
    type container_t = Container.t

    fun addOffset (p : Container.C.non_opt Container.C.p) : FieldType.p =
      let
        val offsetSysWord = SysWord.fromInt (offset ())
      in
        FieldType.Memory.Pointer.fromSysWord (
          Container.C.Pointer.Memory.Pointer.toSysWord p + offsetSysWord
        )
      end

    structure C =
      struct
        type container_p = Container.C.non_opt Container.C.p

        fun get pc = FieldType.get (addOffset pc)

        fun set t pc =
          let
            val pf = addOffset pc
            val () = FieldType.free pf
            val () = FieldType.set () pf t
          in
            ()
          end
      end

    fun get c =
      Container.C.withPtr C.get c
       before Container.C.touchPtr c

    fun set t c =
      Container.C.withPtr (C.set t) c
       before Container.C.touchPtr c
  end

(* Copyright (C) 2016-2017, 2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor Enum(
  eqtype enum
  val null : enum
  val toInt : enum -> GInt.t
  val fromInt : GInt.t -> enum
  exception Value of GInt.t
) :>
  ENUM
    where type t = enum
    where type FFI.val_ = GInt.FFI.val_ =
  struct
    type t = enum
    val null = null

    exception Value = Value

    structure C =
      struct
        type v = GIntType.v

        structure ValueType =
          struct
            val nullEnum = null  (* `null` becomes hidden by `GIntType.null` *)
            open GIntType

            type t = enum

            structure MLtonVector =
              struct
                val e = nullEnum
              end

            val toC = toC o toInt
            val updateC = Fn.const Fn.ignore
            val fromC = fromInt o fromC
          end
      end

    structure FFI =
      struct
        open GInt.FFI

        val withVal = fn f => withVal f o toInt
        val withRefVal = fn f => withRefVal f o toInt
        val fromVal = fromInt o fromVal
      end
  end

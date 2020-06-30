(* Copyright (C) 2016-2017 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor Flags(
  val allFlags : Word32.word list
) :>
  FLAGS
    where type t = Word32.word =
  struct
    type t = Word32.word
    structure BitFlags =
      Word32BitFlags(
        val allFlags = allFlags
      )
    open BitFlags

    val null = 0w0

    val toInt = Word32.toLargeInt
    val fromInt = Word32.fromLargeInt

    structure C =
      struct
        structure ValueType =
          struct
            open GUInt32Type

            type t = Word32.word

            structure MLtonVector =
              struct
                val e = fromInt MLtonVector.e
              end

            val toC = toC o toInt
            val updateC = Fn.const Fn.ignore
            val fromC = fromInt o fromC
          end
      end

    structure FFI =
      struct
        open GUInt32.FFI

        val withVal = fn f => withVal f o toInt
        val withRefVal = fn f => withRefVal f o toInt
        val fromVal = fromInt o fromVal
      end
  end

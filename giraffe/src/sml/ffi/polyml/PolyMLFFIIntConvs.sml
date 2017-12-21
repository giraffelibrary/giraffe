(* Copyright (C) 2017 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure PolyMLFFIIntConvs =
  struct
    fun makeLargeIntConv conv =
      let
        val {load, store, ctype} = Foreign.breakConversion conv
      in
        Foreign.makeConversion {
          load  = LargeInt.fromInt o load,
          store = fn (addr, x) => store (addr, LargeInt.toInt x),
          ctype = ctype
        }
      end

    val cBool = Foreign.cInt
    val cInt8 = makeLargeIntConv Foreign.cInt8
    val cUint8 = makeLargeIntConv Foreign.cUint8
    val cInt16 = makeLargeIntConv Foreign.cInt16
    val cUint16 = makeLargeIntConv Foreign.cUint16
    val cInt32 = Foreign.cInt32Large
    val cUint32 = Foreign.cUint32Large
    val cInt64 = Foreign.cInt64Large
    val cUint64 = Foreign.cUint64Large
    val cShort = makeLargeIntConv Foreign.cShort
    val cUshort = makeLargeIntConv Foreign.cUshort
    val cInt = Foreign.cIntLarge
    val cUint = Foreign.cUintLarge
    val cLong = Foreign.cLongLarge
    val cUlong = Foreign.cUlongLarge
  end

(* Copyright (C) 2017-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure PolyMLFFIIntConvs =
  struct
    val cBool = Foreign.cInt

    val cInt8 = Foreign.cInt8
    val cUint8 = Foreign.cUint8
    val cInt16 = Foreign.cInt16
    val cUint16 = Foreign.cUint16
    val cInt32 = Foreign.cInt32
    val cUint32 = Foreign.cUint32
    val cInt64 = Foreign.cInt64
    val cUint64 = Foreign.cUint64
    val cShort = Foreign.cShort
    val cUshort = Foreign.cUshort
    val cInt = Foreign.cInt
    val cUint = Foreign.cUint
    val cLong = Foreign.cLong
    val cUlong = Foreign.cUlong

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

    val cInt8Large = makeLargeIntConv Foreign.cInt8
    val cUint8Large = makeLargeIntConv Foreign.cUint8
    val cInt16Large = makeLargeIntConv Foreign.cInt16
    val cUint16Large = makeLargeIntConv Foreign.cUint16
    val cInt32Large = Foreign.cInt32Large
    val cUint32Large = Foreign.cUint32Large
    val cInt64Large = Foreign.cInt64Large
    val cUint64Large = Foreign.cUint64Large
    val cShortLarge = makeLargeIntConv Foreign.cShort
    val cUshortLarge = makeLargeIntConv Foreign.cUshort
    val cIntLarge = Foreign.cIntLarge
    val cUintLarge = Foreign.cUintLarge
    val cLongLarge = Foreign.cLongLarge
    val cUlongLarge = Foreign.cUlongLarge
  end

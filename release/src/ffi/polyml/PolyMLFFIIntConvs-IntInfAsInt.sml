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

    val cInt8Large = Foreign.cInt8
    val cUint8Large = Foreign.cUint8
    val cInt16Large = Foreign.cInt16
    val cUint16Large = Foreign.cUint16
    val cInt32Large = Foreign.cInt32
    val cUint32Large = Foreign.cUint32
    val cInt64Large = Foreign.cInt64
    val cUint64Large = Foreign.cUint64
    val cShortLarge = Foreign.cShort
    val cUshortLarge = Foreign.cUshort
    val cIntLarge = Foreign.cInt
    val cUintLarge = Foreign.cUint
    val cLongLarge = Foreign.cLong
    val cUlongLarge = Foreign.cUlong
  end

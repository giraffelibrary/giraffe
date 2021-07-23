(* Copyright (C) 2017-2021 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

(**
 * Poly/ML does not provide conversions for certain C size types so the
 * following are assumed:
 *   - ssize_t is the same as signed long int
 *   - size_t is the same as unsigned long int
 * This is consistent with the ILP32 and LP64 data models so is valid for
 * most Unix-like systems.  However, this is not consistent with LLP64 where
 * long integers are 4 bytes but size_t is 8 bytes bits so is not valid for
 * Windows 64 bit, neither Microsoft Visual C++ nor MinGW.
 *)

structure PolyMLFFIIntConvs =
  struct
    fun mapConversion {fromC, toC} conv =
      let
        val {load, store, ctype} = Foreign.breakConversion conv
      in
        Foreign.makeConversion {
          load  = fromC o load,
          store = fn (addr, x) => store (addr, toC x),
          ctype = ctype
        }
      end

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
    val cSsize =
      mapConversion
        {
          fromC = SysWord.toIntX o Foreign.Memory.voidStar2Sysword,
          toC   = Foreign.Memory.sysWord2VoidStar o SysWord.fromInt
        }
        Foreign.cPointer
    val cSize =
      (* If `Int.precision = SOME Word.wordSize` then these
       * conversion functions should be the identify function. *)
      mapConversion
        {
          fromC = Word.fromInt,
          toC   = Word.toIntX
        }
        cSsize

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
    val cSsizeLarge =
      mapConversion
        {
          fromC = SysWord.toLargeIntX o Foreign.Memory.voidStar2Sysword,
          toC   = Foreign.Memory.sysWord2VoidStar o SysWord.fromLargeInt
        }
        Foreign.cPointer
    val cSizeLarge =
      mapConversion
        {
          fromC = SysWord.toLargeInt o Foreign.Memory.voidStar2Sysword,
          toC   = Foreign.Memory.sysWord2VoidStar o SysWord.fromLargeInt
        }
        Foreign.cPointer
  end

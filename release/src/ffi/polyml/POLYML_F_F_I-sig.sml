(* Copyright (C) 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature POLYML_F_F_I =
  sig
    structure Memory :
      sig
        structure Pointer :
          sig
            eqtype t
            val size : word
            val toSysWord : t -> SysWord.word
            val fromSysWord : SysWord.word -> t
            val null : t
            val add : t * word -> t
            val sub : t * word -> t
          end

        val getWord8  : Pointer.t * int -> Word8.word
        val getWord16 : Pointer.t * int -> Word.word
        val getWord32 : Pointer.t * int -> Word32.word
        val getWord64 : Pointer.t * int -> SysWord.word
        val setWord8  : Pointer.t * int * Word8.word -> unit
        val setWord16 : Pointer.t * int * Word.word -> unit
        val setWord32 : Pointer.t * int * Word32.word -> unit
        val setWord64 : Pointer.t * int * SysWord.word -> unit

        val getFloat  : Pointer.t * int -> real
        val getDouble : Pointer.t * int -> real
        val setFloat  : Pointer.t * int * real -> unit
        val setDouble : Pointer.t * int * real -> unit

        val getPointer : Pointer.t * int -> Pointer.t
        val setPointer : Pointer.t * int * Pointer.t -> unit

        val malloc : word -> Pointer.t
        val copy : Pointer.t * Pointer.t * word -> unit
        val init : Pointer.t * Word8.word * word -> unit
        val free : Pointer.t -> unit
      end

    type library
    type symbol
    val loadLibrary : string -> library
    val loadExecutable : unit -> library
    val getSymbol : string -> symbol
    val getSymbolFromLib : library -> string -> symbol
    val symbolAsAddress : symbol -> Memory.Pointer.t

    structure LowLevel :
      sig
        type ctype = Foreign.LowLevel.ctype

        val cFunctionWithAbi :
          Foreign.LibFFI.abi ->
          ctype list ->
          ctype ->
          ((int -> Memory.Pointer.t) * Memory.Pointer.t -> unit) ->
          Memory.Pointer.t

        val cFunction :
          ctype list ->
          ctype ->
          ((int -> Memory.Pointer.t) * Memory.Pointer.t -> unit) ->
          Memory.Pointer.t

        val callWithAbi :
          Foreign.LibFFI.abi ->
          symbol ->
          ctype list ->
          ctype ->
          (Memory.Pointer.t -> unit -> unit) list ->
          (Memory.Pointer.t -> 'r) ->
          'r

        val call :
          symbol ->
          ctype list ->
          ctype ->
          (Memory.Pointer.t -> unit -> unit) list ->
          (Memory.Pointer.t -> 'r) ->
          'r
      end

    type 'a conversion
    type ('as, 'r) func
    val &&> : 'a conversion * ('as, 'r) func -> (('a, 'as) pair, 'r) func
    val --> : 'a conversion * 'r conversion -> ('a, 'r) func

    val makeConversion :
      {
        load  : Memory.Pointer.t -> 'a,
        store :  'a -> Memory.Pointer.t -> unit -> unit,
        ctype : LowLevel.ctype
      } -> 'a conversion

    val breakConversion :
      'a conversion ->
        {
          load  : Memory.Pointer.t -> 'a,
          store : 'a -> Memory.Pointer.t -> unit -> unit,
          ctype : LowLevel.ctype
        }

    val cVoid        : unit conversion
    val cPointer     : Memory.Pointer.t conversion
    val cBool        : int conversion
    val cChar        : char conversion
    val cUchar       : Word8.word conversion
    val cInt8        : int conversion
    val cInt8Large   : LargeInt.int conversion
    val cUint8       : int conversion
    val cUint8Large  : LargeInt.int conversion
    val cInt16       : int conversion
    val cInt16Large  : LargeInt.int conversion
    val cUint16      : int conversion
    val cUint16Large : LargeInt.int conversion
    val cInt32       : int conversion
    val cInt32Large  : LargeInt.int conversion
    val cUint32      : int conversion
    val cUint32Large : LargeInt.int conversion
    val cInt64       : int conversion
    val cInt64Large  : LargeInt.int conversion
    val cUint64      : int conversion
    val cUint64Large : LargeInt.int conversion
    val cShort       : int conversion
    val cShortLarge  : LargeInt.int conversion
    val cUshort      : int conversion
    val cUshortLarge : LargeInt.int conversion
    val cInt         : int conversion
    val cIntLarge    : LargeInt.int conversion
    val cUint        : int conversion
    val cUintLarge   : LargeInt.int conversion
    val cLong        : int conversion
    val cLongLarge   : LargeInt.int conversion
    val cUlong       : int conversion
    val cUlongLarge  : LargeInt.int conversion
    val cString      : string conversion
    val cByteArray   : Word8Vector.vector conversion
    val cFloat       : real conversion
    val cDouble      : real conversion
    val cConstStar   : 'a conversion -> 'a conversion
    val cStruct      : ('as, unit) func -> 'as conversion
    type 'a closure
    val cFunction    : ('a -> 'b) closure conversion

    val closureWithAbi :
      Foreign.LibFFI.abi -> ('as, 'r) func -> ('as -> 'r) -> ('as -> 'r) closure
    val closure : ('as, 'r) func -> ('as -> 'r) -> ('as -> 'r) closure
    val nullClosure : ('as -> 'r) closure

    val callWithAbi : Foreign.LibFFI.abi -> symbol -> ('as, 'r) func -> 'as -> 'r
    val call : symbol -> ('as, 'r) func -> 'as -> 'r
  end

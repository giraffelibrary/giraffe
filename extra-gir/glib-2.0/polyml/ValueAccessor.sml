(* Copyright (C) 2012-2013, 2015-2021 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure ValueAccessor :>
  VALUE_ACCESSOR
    where type type_t = GObjectType.t
    where type value_t = GObjectValueRecord.t
    where type C.value_v = GObjectValueRecord.C.v =
  struct
    local
      open PolyMLFFI
    in
      val init_ =
        call
          (externalFunctionSymbol "g_value_init")
          (GObjectValueRecord.PolyML.cPtr &&> GObjectType.PolyML.cVal --> GObjectValueRecord.PolyML.cPtr);

      val isValue_ =
        call
          (externalFunctionSymbol "giraffe_g_is_value")
          (GObjectValueRecord.PolyML.cPtr --> GBool.PolyML.cVal);
    end

    type type_t = GObjectType.t
    type value_t = GObjectValueRecord.t

    type ('a, 'b) t = {
      getType  : unit -> type_t,
      getValue : GObjectValueRecord.C.v -> 'a,
      setValue : (GObjectValueRecord.C.v, 'b) pair -> unit
    }

    structure C =
      struct
        type value_v = GObjectValueRecord.C.v

        fun createAccessor x = x

        fun gtype ({getType, ...} : ('a, 'b) t) = getType
        fun get ({getValue, ...} : ('a, 'b) t) v = getValue v
        fun set ({setValue, ...} : ('a, 'b) t) v x = setValue (v & x)
        fun init v gtype =
          (I &&&> GObjectType.FFI.withVal ---> I) (ignore o init_) (v & gtype)

        val isValue = (I ---> GBool.FFI.fromVal) isValue_
      end

    fun get {getValue, ...} value =
      (GObjectValueRecord.FFI.withPtr false ---> I) getValue value

    fun set {setValue, ...} value x =
      (GObjectValueRecord.FFI.withPtr false &&&> I ---> I) setValue (value & x)

    fun gtype {getType, ...} = getType ()

    fun new t x =
      let
        val value & () =
          (GObjectValueRecord.FFI.withNewPtr &&&> GObjectType.FFI.withVal
            ---> GObjectValueRecord.FFI.fromPtr true && I)
            (ignore o init_)
            (() & gtype t)
        val () = set t value x
      in
        value
      end

    fun map (getConv, setConv) {getType, getValue, setValue} =
      {
        getType  = getType,
        getValue = getConv o getValue,
        setValue = fn value & x => setValue (value & setConv x)
      }

    structure Types =
      struct
        local
          open PolyMLFFI
        in
          fun GET conv = GObjectValueRecord.PolyML.cPtr --> conv

          val get_boolean_ =
            call
              (externalFunctionSymbol "g_value_get_boolean")
              (GET GBool.PolyML.cVal);

          val get_int_ =
            call
              (externalFunctionSymbol "g_value_get_int")
              (GET GInt.PolyML.cVal);

          val get_uint_ =
            call
              (externalFunctionSymbol "g_value_get_uint")
              (GET GUInt.PolyML.cVal);

          val get_long_ =
            call
              (externalFunctionSymbol "g_value_get_long")
              (GET GLong.PolyML.cVal);

          val get_ulong_ =
            call
              (externalFunctionSymbol "g_value_get_ulong")
              (GET GULong.PolyML.cVal);

          val get_int64_ =
            call
              (externalFunctionSymbol "g_value_get_int64")
              (GET GInt64.PolyML.cVal);

          val get_uint64_ =
            call
              (externalFunctionSymbol "g_value_get_uint64")
              (GET GUInt64.PolyML.cVal);

          val get_float_ =
            call
              (externalFunctionSymbol "g_value_get_float")
              (GET GFloat.PolyML.cVal);

          val get_double_ =
            call
              (externalFunctionSymbol "g_value_get_double")
              (GET GDouble.PolyML.cVal);

          val get_char_ =
            call
              (externalFunctionSymbol "g_value_get_char")
              (GET GChar.PolyML.cVal);

          val get_string_ =
            call
              (externalFunctionSymbol "g_value_get_string")
              (GET Utf8.PolyML.cOutPtr);

          val get_string_opt_ =
            call
              (externalFunctionSymbol "g_value_get_string")
              (GET Utf8.PolyML.cOutOptPtr);


          fun SET conv = GObjectValueRecord.PolyML.cPtr &&> conv --> cVoid

          val set_boolean_ =
            call
              (externalFunctionSymbol "g_value_set_boolean")
              (SET GBool.PolyML.cVal);

          val set_int_ =
            call
              (externalFunctionSymbol "g_value_set_int")
              (SET GInt.PolyML.cVal);

          val set_uint_ =
            call
              (externalFunctionSymbol "g_value_set_uint")
              (SET GUInt.PolyML.cVal);

          val set_long_ =
            call
              (externalFunctionSymbol "g_value_set_long")
              (SET GLong.PolyML.cVal);

          val set_ulong_ =
            call
              (externalFunctionSymbol "g_value_set_ulong")
              (SET GULong.PolyML.cVal);

          val set_int64_ =
            call
              (externalFunctionSymbol "g_value_set_int64")
              (SET GInt64.PolyML.cVal);

          val set_uint64_ =
            call
              (externalFunctionSymbol "g_value_set_uint64")
              (SET GUInt64.PolyML.cVal);

          val set_float_ =
            call
              (externalFunctionSymbol "g_value_set_float")
              (SET GFloat.PolyML.cVal);

          val set_double_ =
            call
              (externalFunctionSymbol "g_value_set_double")
              (SET GDouble.PolyML.cVal);

          val set_char_ =
            call
              (externalFunctionSymbol "g_value_set_char")
              (SET GChar.PolyML.cVal);

          val set_string_ =
            call
              (externalFunctionSymbol "g_value_set_string")
              (SET Utf8.PolyML.cInPtr);

          val set_string_opt_ =
            call
              (externalFunctionSymbol "g_value_set_string")
              (SET Utf8.PolyML.cInOptPtr);
        end
  

        val boolean : (bool, bool) t =
          C.createAccessor {
            getType  = GObjectType.boolean,
            getValue = (I ---> GBool.FFI.fromVal) get_boolean_,
            setValue = (I &&&> GBool.FFI.withVal ---> I) set_boolean_
          }

        val int : (LargeInt.int, LargeInt.int) t =
          C.createAccessor {
            getType  = GObjectType.int,
            getValue = (I ---> GInt.FFI.fromVal) get_int_,
            setValue = (I &&&> GInt.FFI.withVal ---> I) set_int_
          }

        val uint : (LargeInt.int, LargeInt.int) t =
          C.createAccessor {
            getType  = GObjectType.uint,
            getValue = (I ---> GUInt.FFI.fromVal) get_uint_,
            setValue = (I &&&> GUInt.FFI.withVal ---> I) set_uint_
          }

        val long : (LargeInt.int, LargeInt.int) t =
          C.createAccessor {
            getType  = GObjectType.long,
            getValue = (I ---> GLong.FFI.fromVal) get_long_,
            setValue = (I &&&> GLong.FFI.withVal ---> I) set_long_
          }

        val ulong : (LargeInt.int, LargeInt.int) t =
          C.createAccessor {
            getType  = GObjectType.ulong,
            getValue = (I ---> GULong.FFI.fromVal) get_ulong_,
            setValue = (I &&&> GULong.FFI.withVal ---> I) set_ulong_
          }

        val int64 : (LargeInt.int, LargeInt.int) t =
          C.createAccessor {
            getType  = GObjectType.int64,
            getValue = (I ---> GInt64.FFI.fromVal) get_int64_,
            setValue = (I &&&> GInt64.FFI.withVal ---> I) set_int64_
          }

        val uint64 : (LargeInt.int, LargeInt.int) t =
          C.createAccessor {
            getType  = GObjectType.uint64,
            getValue = (I ---> GUInt64.FFI.fromVal) get_uint64_,
            setValue = (I &&&> GUInt64.FFI.withVal ---> I) set_uint64_
          }

        val float : (real, real) t =
          C.createAccessor {
            getType  = GObjectType.float,
            getValue = (I ---> GFloat.FFI.fromVal) get_float_,
            setValue = (I &&&> GFloat.FFI.withVal ---> I) set_float_
          }

        val double : (real, real) t =
          C.createAccessor {
            getType  = GObjectType.double,
            getValue = (I ---> GDouble.FFI.fromVal) get_double_,
            setValue = (I &&&> GDouble.FFI.withVal ---> I) set_double_
          }

        val char : (char, char) t =
          C.createAccessor {
            getType  = GObjectType.char,
            getValue = (I ---> GChar.FFI.fromVal) get_char_,
            setValue = (I &&&> GChar.FFI.withVal ---> I) set_char_
          }

        val string : (string, string) t =
          C.createAccessor {
            getType  = GObjectType.string,
            getValue = (I ---> Utf8.FFI.fromPtr 0) get_string_,
            setValue = (I &&&> Utf8.FFI.withPtr 0 ---> I) set_string_
          }

        val stringOpt : (string option, string option) t =
          C.createAccessor {
            getType  = GObjectType.string,
            getValue = (I ---> Utf8.FFI.fromOptPtr 0) get_string_opt_,
            setValue = (I &&&> Utf8.FFI.withOptPtr 0 ---> I) set_string_opt_
          }
      end
  end
open ValueAccessor.Types

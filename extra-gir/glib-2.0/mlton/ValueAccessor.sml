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
    val init_ =
      fn x1 & x2 =>
        (_import "g_value_init" :
           GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * GObjectType.FFI.val_
            -> GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p;)
        (x1, x2)

    val isValue_ =
      _import "giraffe_g_is_value" :
        GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> GBool.FFI.val_;

    type type_t = GObjectType.t
    type value_t = GObjectValueRecord.t

    type 'a t = {
      getType  : unit -> type_t,
      getValue : GObjectValueRecord.C.v -> 'a,
      setValue : (GObjectValueRecord.C.v, 'a) pair -> unit
    }

    structure C =
      struct
        type value_v = GObjectValueRecord.C.v

        fun createAccessor x = x

        fun gtype {getType, ...} = getType
        fun get {getValue, ...} v = getValue v
        fun set {setValue, ...} v x = setValue (v & x)
        fun init v gtype =
          (I &&&> GObjectType.FFI.withVal ---> ignore) init_ (v & gtype)

        val isValue = (I ---> GBool.FFI.fromVal) isValue_
      end

    fun get {getValue, ...} value =
      (GObjectValueRecord.FFI.withPtr false ---> I) getValue value

    fun set {setValue, ...} value x =
      (GObjectValueRecord.FFI.withPtr false &&&> I ---> I) setValue (value & x)

    fun gtype {getType, ...} = getType ()

    local
      val call =
        GObjectValueRecord.FFI.withNewPtr &&&> GObjectType.FFI.withVal
         ---> GObjectValueRecord.FFI.fromPtr true && ignore
    in
      fun new t x =
        let
          val value & () =
            call
              init_
              (() & gtype t)
          val () = set t value x
        in
          value
        end
    end

    fun map (getConv, setConv) {getType, getValue, setValue} =
      {
        getType  = getType,
        getValue = getConv o getValue,
        setValue = fn value & x => setValue (value & setConv x)
      }

    structure Types =
      struct
        type 'a get = GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> 'a

        val get_boolean_ = _import "g_value_get_boolean" : GBool.FFI.val_ get;

        val get_int_ = _import "g_value_get_int" : GInt.FFI.val_ get;

        val get_uint_ = _import "g_value_get_uint" : GUInt.FFI.val_ get;

        val get_long_ = _import "g_value_get_long" : GLong.FFI.val_ get;

        val get_ulong_ = _import "g_value_get_ulong" : GULong.FFI.val_ get;

        val get_int64_ = _import "g_value_get_int64" : GInt64.FFI.val_ get;

        val get_uint64_ = _import "g_value_get_uint64" : GUInt64.FFI.val_ get;

        val get_float_ = _import "g_value_get_float" : GFloat.FFI.val_ get;

        val get_double_ = _import "g_value_get_double" : GDouble.FFI.val_ get;

        val get_char_ = _import "g_value_get_char" : GChar.FFI.val_ get;

        val get_string_ = _import "g_value_get_string" : Utf8.FFI.non_opt Utf8.FFI.out_p get;

        val get_string_opt_ = _import "g_value_get_string" : Utf8.FFI.opt Utf8.FFI.out_p get;


        type 'a set = GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * 'a -> unit

        val set_boolean_ =
          fn x1 & x2 =>
            (_import "g_value_set_boolean" : GBool.FFI.val_ set;)
            (x1, x2)

        val set_int_ =
          fn x1 & x2 =>
            (_import "g_value_set_int" : GInt.FFI.val_ set;)
            (x1, x2)

        val set_uint_ =
          fn x1 & x2 =>
            (_import "g_value_set_uint" : GUInt.FFI.val_ set;)
            (x1, x2)

        val set_long_ =
          fn x1 & x2 =>
            (_import "g_value_set_long" : GLong.FFI.val_ set;)
            (x1, x2)

        val set_ulong_ =
          fn x1 & x2 =>
            (_import "g_value_set_ulong" : GULong.FFI.val_ set;)
            (x1, x2)

        val set_int64_ =
          fn x1 & x2 =>
            (_import "g_value_set_int64" : GInt64.FFI.val_ set;)
            (x1, x2)

        val set_uint64_ =
          fn x1 & x2 =>
            (_import "g_value_set_uint64" : GUInt64.FFI.val_ set;)
            (x1, x2)

        val set_float_ =
          fn x1 & x2 =>
            (_import "g_value_set_float" : GFloat.FFI.val_ set;)
            (x1, x2)

        val set_double_ =
          fn x1 & x2 =>
            (_import "g_value_set_double" : GDouble.FFI.val_ set;)
            (x1, x2)

        val set_char_ =
          fn x1 & x2 =>
            (_import "g_value_set_char" : GChar.FFI.val_ set;)
            (x1, x2)

        val set_string_ =
          fn x1 & (x2, x3) =>
            (_import "mlton_g_value_set_string" :
               GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> unit;)
            (x1, x2, x3)

        val set_string_opt_ =
          fn x1 & (x2, x3) =>
            (_import "mlton_g_value_set_string" :
               GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * Utf8.MLton.p1 * Utf8.FFI.opt Utf8.MLton.p2 -> unit;)
            (x1, x2, x3)


        val boolean : bool t =
          C.createAccessor {
            getType  = GObjectType.boolean,
            getValue = (I ---> GBool.FFI.fromVal) get_boolean_,
            setValue = (I &&&> GBool.FFI.withVal ---> I) set_boolean_
          }

        val int : LargeInt.int t =
          C.createAccessor {
            getType  = GObjectType.int,
            getValue = (I ---> GInt.FFI.fromVal) get_int_,
            setValue = (I &&&> GInt.FFI.withVal ---> I) set_int_
          }

        val uint : LargeInt.int t =
          C.createAccessor {
            getType  = GObjectType.uint,
            getValue = (I ---> GUInt.FFI.fromVal) get_uint_,
            setValue = (I &&&> GUInt.FFI.withVal ---> I) set_uint_
          }

        val long : LargeInt.int t =
          C.createAccessor {
            getType  = GObjectType.long,
            getValue = (I ---> GLong.FFI.fromVal) get_long_,
            setValue = (I &&&> GLong.FFI.withVal ---> I) set_long_
          }

        val ulong : LargeInt.int t =
          C.createAccessor {
            getType  = GObjectType.ulong,
            getValue = (I ---> GULong.FFI.fromVal) get_ulong_,
            setValue = (I &&&> GULong.FFI.withVal ---> I) set_ulong_
          }

        val int64 : LargeInt.int t =
          C.createAccessor {
            getType  = GObjectType.int64,
            getValue = (I ---> GInt64.FFI.fromVal) get_int64_,
            setValue = (I &&&> GInt64.FFI.withVal ---> I) set_int64_
          }

        val uint64 : LargeInt.int t =
          C.createAccessor {
            getType  = GObjectType.uint64,
            getValue = (I ---> GUInt64.FFI.fromVal) get_uint64_,
            setValue = (I &&&> GUInt64.FFI.withVal ---> I) set_uint64_
          }

        val float : real t =
          C.createAccessor {
            getType  = GObjectType.float,
            getValue = (I ---> GFloat.FFI.fromVal) get_float_,
            setValue = (I &&&> GFloat.FFI.withVal ---> I) set_float_
          }

        val double : real t =
          C.createAccessor {
            getType  = GObjectType.double,
            getValue = (I ---> GDouble.FFI.fromVal) get_double_,
            setValue = (I &&&> GDouble.FFI.withVal ---> I) set_double_
          }

        val char : char t =
          C.createAccessor {
            getType  = GObjectType.char,
            getValue = (I ---> GChar.FFI.fromVal) get_char_,
            setValue = (I &&&> GChar.FFI.withVal ---> I) set_char_
          }

        val string : string t =
          C.createAccessor {
            getType  = GObjectType.string,
            getValue = (I ---> Utf8.FFI.fromPtr 0) get_string_,
            setValue = (I &&&> Utf8.FFI.withPtr 0 ---> I) set_string_
          }

        val stringOpt : string option t =
          C.createAccessor {
            getType  = GObjectType.string,
            getValue = (I ---> Utf8.FFI.fromOptPtr 0) get_string_opt_,
            setValue = (I &&&> Utf8.FFI.withOptPtr 0 ---> I) set_string_opt_
          }
      end
  end
open ValueAccessor.Types

(* Copyright (C) 2012-2013, 2015-2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GObjectValue :>
  G_OBJECT_VALUE
    where type t = GObjectValueRecord.t
    where type type_t = GObjectType.t
    where type C.v = GObjectValueRecord.C.ValueType.v (*
    where type C.notnull = GObjectValueRecord.FFI.notnull
    where type 'a C.p = 'a GObjectValueRecord.FFI.p
    where type 'a C.Array.array_p = 'a GObjectValueRecord.C.Array.array_p *) =
  struct
    val init_ =
      fn x1 & x2 =>
        (_import "g_value_init" :
           GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * GObjectType.FFI.val_
            -> GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p;)
        (x1, x2)

    val reset_ =
      _import "g_value_reset" :
        GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p;

    val getType_ =
      _import "g_value_get_type" : unit -> GObjectType.FFI.val_;

    val holds_ =
      fn x1 & x2 =>
        (_import "giraffe_g_value_holds" :
           GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * GObjectType.FFI.val_ -> GBool.FFI.val_;)
        (x1, x2)

    val gtypeOf_ =
      _import "giraffe_g_value_type" :
        GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> GObjectType.FFI.val_;

    val isValue_ =
      _import "giraffe_g_is_value" :
        GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> GBool.FFI.val_;

    type t = GObjectValueRecord.t
    type type_t = GObjectType.t

    fun init gtype =
      let
        val value & () =
          (GObjectValueRecord.FFI.withNewPtr
            &&&> GObjectType.FFI.withVal
            ---> GObjectValueRecord.FFI.fromPtr true && I)
            (ignore o init_)
            (() & gtype)
      in
        value
      end

    fun reset value =
      (GObjectValueRecord.FFI.withPtr ---> I) (ignore o reset_) value

    fun getType () = (I ---> GObjectType.FFI.fromVal) getType_ ()

    fun holds gtype value =
      (GObjectValueRecord.FFI.withPtr &&&> GObjectType.FFI.withVal ---> GBool.FFI.fromVal)
        holds_
        (value & gtype)

    fun gTypeOf value =
      (GObjectValueRecord.FFI.withPtr ---> GObjectType.FFI.fromVal) gtypeOf_ value

    fun isValue value =
      (GObjectValueRecord.FFI.withPtr ---> GBool.FFI.fromVal) isValue_ value


    type ('a, 'b) accessor = {
      getType  : unit -> GObjectType.t,
      getValue : GObjectValueRecord.C.ValueType.v -> 'a,
      setValue : (GObjectValueRecord.C.ValueType.v, 'b) pair -> unit
    }
    structure C =
      struct
        type v = GObjectValueRecord.C.ValueType.v

        fun get ({getValue, ...} : ('a, 'b) accessor) ptr = getValue ptr
        fun set ({setValue, ...} : ('a, 'b) accessor) ptr x = setValue (ptr & x)

        val isValue = (I ---> GBool.FFI.fromVal) isValue_

        fun createAccessor x = x
      end


    fun get ({getValue, ...} : ('a, 'b) accessor) value =
      (GObjectValueRecord.FFI.withPtr ---> I) getValue value

    fun set ({setValue, ...} : ('a, 'b) accessor) value x =
      (GObjectValueRecord.FFI.withPtr &&&> I ---> I) setValue (value & x)

    fun baseType ({getType, ...} : ('a, 'b) accessor) = getType ()
  end

local
    type 'a get = GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> 'a

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

    val get_string_ = _import "g_value_get_string" : Utf8.FFI.notnull Utf8.FFI.out_p get;

    val get_string_opt_ = _import "g_value_get_string" : unit Utf8.FFI.out_p get;


    type 'a set = GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * 'a -> unit

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
           GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> unit;)
        (x1, x2, x3)

    val set_string_opt_ =
      fn x1 & (x2, x3) =>
        (_import "mlton_g_value_set_string" :
           GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * Utf8.MLton.p1 * unit Utf8.MLton.p2 -> unit;)
        (x1, x2, x3)
in
  val boolean : (bool, bool) GObjectValue.accessor =
    GObjectValue.C.createAccessor {
      getType  = GObjectType.boolean,
      getValue = (I ---> GBool.FFI.fromVal) get_boolean_,
      setValue = (I &&&> GBool.FFI.withVal ---> I) set_boolean_
    }

  val int : (LargeInt.int, LargeInt.int) GObjectValue.accessor =
    GObjectValue.C.createAccessor {
      getType  = GObjectType.int,
      getValue = (I ---> GInt.FFI.fromVal) get_int_,
      setValue = (I &&&> GInt.FFI.withVal ---> I) set_int_
    }

  val uint : (LargeInt.int, LargeInt.int) GObjectValue.accessor =
    GObjectValue.C.createAccessor {
      getType  = GObjectType.uint,
      getValue = (I ---> GUInt.FFI.fromVal) get_uint_,
      setValue = (I &&&> GUInt.FFI.withVal ---> I) set_uint_
    }

  (* temporary *)
  val int32 = int
  val uint32 = uint

  val long : (LargeInt.int, LargeInt.int) GObjectValue.accessor =
    GObjectValue.C.createAccessor {
      getType  = GObjectType.long,
      getValue = (I ---> GLong.FFI.fromVal) get_long_,
      setValue = (I &&&> GLong.FFI.withVal ---> I) set_long_
    }

  val ulong : (LargeInt.int, LargeInt.int) GObjectValue.accessor =
    GObjectValue.C.createAccessor {
      getType  = GObjectType.ulong,
      getValue = (I ---> GULong.FFI.fromVal) get_ulong_,
      setValue = (I &&&> GULong.FFI.withVal ---> I) set_ulong_
    }

  val int64 : (LargeInt.int, LargeInt.int) GObjectValue.accessor =
    GObjectValue.C.createAccessor {
      getType  = GObjectType.int64,
      getValue = (I ---> GInt64.FFI.fromVal) get_int64_,
      setValue = (I &&&> GInt64.FFI.withVal ---> I) set_int64_
    }

  val uint64 : (LargeInt.int, LargeInt.int) GObjectValue.accessor =
    GObjectValue.C.createAccessor {
      getType  = GObjectType.uint64,
      getValue = (I ---> GUInt64.FFI.fromVal) get_uint64_,
      setValue = (I &&&> GUInt64.FFI.withVal ---> I) set_uint64_
    }

  val float : (real, real) GObjectValue.accessor =
    GObjectValue.C.createAccessor {
      getType  = GObjectType.float,
      getValue = (I ---> GFloat.FFI.fromVal) get_float_,
      setValue = (I &&&> GFloat.FFI.withVal ---> I) set_float_
    }

  val double : (real, real) GObjectValue.accessor =
    GObjectValue.C.createAccessor {
      getType  = GObjectType.double,
      getValue = (I ---> GDouble.FFI.fromVal) get_double_,
      setValue = (I &&&> GDouble.FFI.withVal ---> I) set_double_
    }

  val char : (char, char) GObjectValue.accessor =
    GObjectValue.C.createAccessor {
      getType  = GObjectType.char,
      getValue = (I ---> GChar.FFI.fromVal) get_char_,
      setValue = (I &&&> GChar.FFI.withVal ---> I) set_char_
    }

  val string : (string, string) GObjectValue.accessor =
    GObjectValue.C.createAccessor {
      getType  = GObjectType.string,
      getValue = (I ---> Utf8.FFI.fromPtr 0) get_string_,
      setValue = (I &&&> Utf8.FFI.withPtr ---> I) set_string_
    }

  val stringOpt : (string option, string option) GObjectValue.accessor =
    GObjectValue.C.createAccessor {
      getType  = GObjectType.string,
      getValue = (I ---> Utf8.FFI.fromOptPtr 0) get_string_opt_,
      setValue = (I &&&> Utf8.FFI.withOptPtr ---> I) set_string_opt_
    }
end

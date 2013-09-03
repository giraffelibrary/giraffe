structure GObjectValue :>
  G_OBJECT_VALUE
    where type record_t = GObjectValueRecord.t
    where type type_t = GObjectType.t
    where type C.notnull = GObjectValueRecord.C.notnull
    where type 'a C.p = 'a GObjectValueRecord.C.p
    where type 'a C.Array.p = 'a GObjectValueRecord.C.Array.p =
  struct
    val init_ =
      fn x1 & x2 =>
        (_import "g_value_init" :
           GObjectValueRecord.C.notnull GObjectValueRecord.C.p * GObjectType.C.val_
            -> GObjectValueRecord.C.notnull GObjectValueRecord.C.p;)
        (x1, x2)

    val reset_ =
      _import "g_value_reset" :
        GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> GObjectValueRecord.C.notnull GObjectValueRecord.C.p;

    val getType_ =
      _import "g_value_get_type" : unit -> GObjectType.C.val_;

    val holds_ =
      fn x1 & x2 =>
        (_import "giraffe_g_value_holds" :
           GObjectValueRecord.C.notnull GObjectValueRecord.C.p * GObjectType.C.val_ -> FFI.Bool.val_;)
        (x1, x2)

    val gtypeOf_ =
      _import "giraffe_g_value_type" :
        GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> GObjectType.C.val_;

    val isValue_ =
      _import "giraffe_g_is_value" :
        GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> FFI.Bool.val_;

    type record_t = GObjectValueRecord.t
    type type_t = GObjectType.t

    fun init gtype =
      let
        val value & () =
          (GObjectValueRecord.C.withNewPtr
            &&&> GObjectType.C.withVal
            ---> GObjectValueRecord.C.fromPtr true && I)
            (ignore o init_)
            (() & gtype)
      in
        value
      end

    fun reset value =
      (GObjectValueRecord.C.withPtr ---> I) (ignore o reset_) value

    fun getType () = (I ---> GObjectType.C.fromVal) getType_ ()

    fun holds gtype value =
      (GObjectValueRecord.C.withPtr &&&> GObjectType.C.withVal ---> I) holds_ (value & gtype)

    fun gTypeOf value =
      (GObjectValueRecord.C.withPtr ---> GObjectType.C.fromVal) gtypeOf_ value

    fun isValue value =
      (GObjectValueRecord.C.withPtr ---> FFI.Bool.fromVal) isValue_ value


    val nth_ =
      fn x1 & x2 =>
        (_import "giraffe_g_value_nth" :
           GObjectValueRecord.C.notnull GObjectValueRecord.C.Array.p * Word32.word
            -> GObjectValueRecord.C.notnull GObjectValueRecord.C.p;)
        (x1, x2)

    val isValue_ =
      _import "giraffe_g_is_value" :
        GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> FFI.Bool.val_;


    type ('a, 'b) accessor = {
      getType  : unit -> GObjectType.t,
      getValue : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> 'a,
      setValue : (GObjectValueRecord.C.notnull GObjectValueRecord.C.p, 'b) pair -> unit
    }
    structure C =
      struct
        type notnull = GObjectValueRecord.C.notnull
        type 'a p = 'a GObjectValueRecord.C.p

        structure Array =
          struct
            type 'a p = 'a GObjectValueRecord.C.Array.p
            fun get ({getValue, ...} : ('a, 'b) accessor) ptr i =
              getValue (nth_ (ptr & i))
            fun set ({setValue, ...} : ('a, 'b) accessor) ptr i x =
              setValue (nth_ (ptr & i) & x)
          end

        fun set ({setValue, ...} : ('a, 'b) accessor) ptr x = setValue (ptr & x)

        val isValue = (I ---> FFI.Bool.fromVal) isValue_

        fun createAccessor x = x
      end


    fun get ({getValue, ...} : ('a, 'b) accessor) value =
      (GObjectValueRecord.C.withPtr ---> I) getValue value

    fun set ({setValue, ...} : ('a, 'b) accessor) value x =
      (GObjectValueRecord.C.withPtr &&&> I ---> I) setValue (value & x)

    fun baseType ({getType, ...} : ('a, 'b) accessor) = getType ()
  end

local
    type 'a get = GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> 'a

    val get_boolean_ = _import "g_value_get_boolean" : FFI.Bool.val_ get;

    val get_int_ = _import "g_value_get_int" : FFI.Int32.val_ get;

    val get_uint_ = _import "g_value_get_uint" : FFI.UInt32.val_ get;

    val get_long_ = _import "g_value_get_long" : FFI.Long.val_ get;

    val get_ulong_ = _import "g_value_get_ulong" : FFI.ULong.val_ get;

    val get_int64_ = _import "g_value_get_int64" : FFI.Int64.val_ get;

    val get_uint64_ = _import "g_value_get_uint64" : FFI.UInt64.val_ get;

    val get_float_ = _import "g_value_get_float" : FFI.Float.val_ get;

    val get_double_ = _import "g_value_get_double" : FFI.Double.val_ get;

    val get_char_ = _import "g_value_get_char" : FFI.Char.val_ get;

    val get_string_ = _import "g_value_get_string" : FFI.String.notnull FFI.String.out_p get;

    val get_string_opt_ = _import "g_value_get_string" : unit FFI.String.out_p get;


    type 'a set = GObjectValueRecord.C.notnull GObjectValueRecord.C.p * 'a -> unit

    val set_boolean_ =
      fn x1 & x2 =>
        (_import "g_value_set_boolean" : FFI.Bool.val_ set;)
        (x1, x2)

    val set_int_ =
      fn x1 & x2 =>
        (_import "g_value_set_int" : FFI.Int32.val_ set;)
        (x1, x2)

    val set_uint_ =
      fn x1 & x2 =>
        (_import "g_value_set_uint" : FFI.UInt32.val_ set;)
        (x1, x2)

    val set_long_ =
      fn x1 & x2 =>
        (_import "g_value_set_long" : FFI.Long.val_ set;)
        (x1, x2)

    val set_ulong_ =
      fn x1 & x2 =>
        (_import "g_value_set_ulong" : FFI.ULong.val_ set;)
        (x1, x2)

    val set_int64_ =
      fn x1 & x2 =>
        (_import "g_value_set_int64" : FFI.Int64.val_ set;)
        (x1, x2)

    val set_uint64_ =
      fn x1 & x2 =>
        (_import "g_value_set_uint64" : FFI.UInt64.val_ set;)
        (x1, x2)

    val set_float_ =
      fn x1 & x2 =>
        (_import "g_value_set_float" : FFI.Float.val_ set;)
        (x1, x2)

    val set_double_ =
      fn x1 & x2 =>
        (_import "g_value_set_double" : FFI.Double.val_ set;)
        (x1, x2)

    val set_char_ =
      fn x1 & x2 =>
        (_import "g_value_set_char" : FFI.Char.val_ set;)
        (x1, x2)

    val set_string_ =
      fn x1 & (x2, x3) =>
        (_import "mlton_g_value_set_string" :
           GObjectValueRecord.C.notnull GObjectValueRecord.C.p * cstring * unit CPointer.t -> unit;)
        (x1, x2, x3)

    val set_string_opt_ =
      fn x1 & (x2, x3) =>
        (_import "mlton_g_value_set_string" :
           GObjectValueRecord.C.notnull GObjectValueRecord.C.p * cstring * unit CPointer.t -> unit;)
        (x1, x2, x3)
in
  val boolean : (bool, bool) GObjectValue.accessor =
    GObjectValue.C.createAccessor {
      getType  = GObjectType.boolean,
      getValue = get_boolean_,
      setValue = set_boolean_
    }

  val int : (LargeInt.int, LargeInt.int) GObjectValue.accessor =
    GObjectValue.C.createAccessor {
      getType  = GObjectType.int,
      getValue = (I ---> FFI.Int.fromVal) get_int_,
      setValue = (I &&&> FFI.Int.withVal ---> I) set_int_
    }

  val uint : (LargeInt.int, LargeInt.int) GObjectValue.accessor =
    GObjectValue.C.createAccessor {
      getType  = GObjectType.uint,
      getValue = (I ---> FFI.UInt.fromVal) get_uint_,
      setValue = (I &&&> FFI.UInt.withVal ---> I) set_uint_
    }

  (* temporary *)
  val int32 = int
  val uint32 = uint

  val long : (LargeInt.int, LargeInt.int) GObjectValue.accessor =
    GObjectValue.C.createAccessor {
      getType  = GObjectType.long,
      getValue = (I ---> FFI.Long.fromVal) get_long_,
      setValue = (I &&&> FFI.Long.withVal ---> I) set_long_
    }

  val ulong : (LargeInt.int, LargeInt.int) GObjectValue.accessor =
    GObjectValue.C.createAccessor {
      getType  = GObjectType.ulong,
      getValue = (I ---> FFI.ULong.fromVal) get_ulong_,
      setValue = (I &&&> FFI.ULong.withVal ---> I) set_ulong_
    }

  val int64 : (LargeInt.int, LargeInt.int) GObjectValue.accessor =
    GObjectValue.C.createAccessor {
      getType  = GObjectType.int64,
      getValue = (I ---> FFI.Int64.fromVal) get_int64_,
      setValue = (I &&&> FFI.Int64.withVal ---> I) set_int64_
    }

  val uint64 : (LargeInt.int, LargeInt.int) GObjectValue.accessor =
    GObjectValue.C.createAccessor {
      getType  = GObjectType.uint64,
      getValue = (I ---> FFI.UInt64.fromVal) get_uint64_,
      setValue = (I &&&> FFI.UInt64.withVal ---> I) set_uint64_
    }

  val float : (real, real) GObjectValue.accessor =
    GObjectValue.C.createAccessor {
      getType  = GObjectType.float,
      getValue = get_float_,
      setValue = set_float_
    }

  val double : (real, real) GObjectValue.accessor =
    GObjectValue.C.createAccessor {
      getType  = GObjectType.double,
      getValue = get_double_,
      setValue = set_double_
    }

  val char : (char, char) GObjectValue.accessor =
    GObjectValue.C.createAccessor {
      getType  = GObjectType.char,
      getValue = get_char_,
      setValue = set_char_
    }

  val string : (string, string) GObjectValue.accessor =
    GObjectValue.C.createAccessor {
      getType  = GObjectType.string,
      getValue = (I ---> FFI.String.fromPtr false) get_string_,
      setValue = (I &&&> FFI.String.withConstPtr ---> I) set_string_
    }

  val stringOpt : (string option, string option) GObjectValue.accessor =
    GObjectValue.C.createAccessor {
      getType  = GObjectType.string,
      getValue = (I ---> FFI.String.fromOptPtr false) get_string_opt_,
      setValue = (I &&&> FFI.String.withConstOptPtr ---> I) set_string_opt_
    }
end

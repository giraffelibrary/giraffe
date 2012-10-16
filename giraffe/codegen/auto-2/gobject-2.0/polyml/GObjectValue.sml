structure GObjectValue :>
  G_OBJECT_VALUE
    where type record_t = GObjectValueRecord.t
    where type type_t = GObjectType.t
    where type C.notnull = GObjectValueRecord.C.notnull
    where type 'a C.p = 'a GObjectValueRecord.C.p
    where type 'a C.Array.p = 'a GObjectValueRecord.C.Array.p =
  struct
    local
      open PolyMLFFI
    in
      val init_ =
        call
          (load_sym libgobject "g_value_init")
          (GObjectValueRecord.PolyML.PTR &&> GObjectType.PolyML.VAL --> GObjectValueRecord.PolyML.PTR);

      val reset_ =
        call
          (load_sym libgobject "g_value_reset")
          (GObjectValueRecord.PolyML.PTR --> GObjectValueRecord.PolyML.PTR);

      val getType_ =
        call
          (load_sym libgobject "g_value_get_type")
          (FFI.PolyML.VOID --> GObjectType.PolyML.VAL);

      val holds_ =
        call
          (load_sym libgiraffegobject "giraffe_g_value_holds")
          (GObjectValueRecord.PolyML.PTR &&> GObjectType.PolyML.VAL --> FFI.PolyML.Bool.VAL);

      val gtypeOf_ =
        call
          (load_sym libgiraffegobject "giraffe_g_value_type")
          (GObjectValueRecord.PolyML.PTR --> GObjectType.PolyML.VAL);

      val isValue_ =
        call
          (load_sym libgiraffegobject "giraffe_g_is_value")
          (GObjectValueRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL);
    end

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


    local
      open PolyMLFFI
    in
      val nth_ =
        call
          (load_sym libgiraffegobject "giraffe_g_value_nth")
          (
            GObjectValueRecord.PolyML.Array.PTR
             &&> CInterface.mapConversion
                   (Word32.fromLargeInt, Word32.toLargeInt)
                   CInterface.UINT
             --> GObjectValueRecord.PolyML.PTR
          );

      val isValue_ =
        call
          (load_sym libgiraffegobject "giraffe_g_is_value")
          (GObjectValueRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL);
    end


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
  local
    open PolyMLFFI
  in
    fun GET conv = GObjectValueRecord.PolyML.PTR --> conv

    val get_boolean_ =
      call
        (load_sym libgobject "g_value_get_boolean")
        (GET FFI.PolyML.Bool.VAL);

    val get_int_ =
      call
        (load_sym libgobject "g_value_get_int")
        (GET FFI.PolyML.Int32.VAL);

    val get_uint_ =
      call
        (load_sym libgobject "g_value_get_uint")
        (GET FFI.PolyML.Word32.VAL);

    val get_long_ =
      call
        (load_sym libgobject "g_value_get_long")
        (GET FFI.PolyML.LongInt.VAL);

    val get_ulong_ =
      call
        (load_sym libgobject "g_value_get_ulong")
        (GET FFI.PolyML.LongWord.VAL);

    val get_int64_ =
      call
        (load_sym libgobject "g_value_get_int64")
        (GET FFI.PolyML.Int64.VAL);

    val get_uint64_ =
      call
        (load_sym libgobject "g_value_get_uint64")
        (GET FFI.PolyML.Word64.VAL);

    val get_float_ =
      call
        (load_sym libgobject "g_value_get_float")
        (GET FFI.PolyML.Float.VAL);

    val get_double_ =
      call
        (load_sym libgobject "g_value_get_double")
        (GET FFI.PolyML.Double.VAL);

    val get_char_ =
      call
        (load_sym libgobject "g_value_get_char")
        (GET FFI.PolyML.Char.VAL);

    val get_string_ =
      call
        (load_sym libgobject "g_value_get_string")
        (GET FFI.PolyML.String.RETPTR);

    val get_string_opt_ =
      call
        (load_sym libgobject "g_value_get_string")
        (GET FFI.PolyML.String.RETOPTPTR);


    fun SET conv = GObjectValueRecord.PolyML.PTR &&> conv --> FFI.PolyML.VOID

    val set_boolean_ =
      call
        (load_sym libgobject "g_value_set_boolean")
        (SET FFI.PolyML.Bool.VAL);

    val set_int_ =
      call
        (load_sym libgobject "g_value_set_int")
        (SET FFI.PolyML.Int32.VAL);

    val set_uint_ =
      call
        (load_sym libgobject "g_value_set_uint")
        (SET FFI.PolyML.Word32.VAL);

    val set_long_ =
      call
        (load_sym libgobject "g_value_set_long")
        (SET FFI.PolyML.LongInt.VAL);

    val set_ulong_ =
      call
        (load_sym libgobject "g_value_set_ulong")
        (SET FFI.PolyML.LongWord.VAL);

    val set_int64_ =
      call
        (load_sym libgobject "g_value_set_int64")
        (SET FFI.PolyML.Int64.VAL);

    val set_uint64_ =
      call
        (load_sym libgobject "g_value_set_uint64")
        (SET FFI.PolyML.Word64.VAL);

    val set_float_ =
      call
        (load_sym libgobject "g_value_set_float")
        (SET FFI.PolyML.Float.VAL);

    val set_double_ =
      call
        (load_sym libgobject "g_value_set_double")
        (SET FFI.PolyML.Double.VAL);

    val set_char_ =
      call
        (load_sym libgobject "g_value_set_char")
        (SET FFI.PolyML.Char.VAL);

    val set_string_ =
      call
        (load_sym libgobject "g_value_set_string")
        (SET FFI.PolyML.String.INPTR);

    val set_string_opt_ =
      call
        (load_sym libgobject "g_value_set_string")
        (SET FFI.PolyML.String.INOPTPTR);
  end
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
      getValue = (I ---> FFI.Word.fromVal) get_uint_,
      setValue = (I &&&> FFI.Word.withVal ---> I) set_uint_
    }

  (* temporary *)
  val int32 = int
  val uint32 = uint

  val long : (LargeInt.int, LargeInt.int) GObjectValue.accessor =
    GObjectValue.C.createAccessor {
      getType  = GObjectType.long,
      getValue = (I ---> FFI.LongInt.fromVal) get_long_,
      setValue = (I &&&> FFI.LongInt.withVal ---> I) set_long_
    }

  val ulong : (LargeInt.int, LargeInt.int) GObjectValue.accessor =
    GObjectValue.C.createAccessor {
      getType  = GObjectType.ulong,
      getValue = (I ---> FFI.LongWord.fromVal) get_ulong_,
      setValue = (I &&&> FFI.LongWord.withVal ---> I) set_ulong_
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
      getValue = (I ---> FFI.Word64.fromVal) get_uint64_,
      setValue = (I &&&> FFI.Word64.withVal ---> I) set_uint64_
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

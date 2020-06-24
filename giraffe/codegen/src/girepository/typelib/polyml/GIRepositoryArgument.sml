structure GIRepositoryArgument :>
  G_I_REPOSITORY_ARGUMENT
    where type typetag_t = GIRepositoryTypeTag.t =
  struct
    type opt = CPointer.opt
    type non_opt = CPointer.non_opt
    type 'a p = 'a CPointer.p

    val cPtr = CPointer.PolyML.cVal : non_opt p PolyMLFFI.conversion
    val cOptPtr = CPointer.PolyML.cOptVal : opt p PolyMLFFI.conversion

    local
      open PolyMLFFI
    in
      val new_ =
        call
          (getSymbol "giraffe_gi_argument_new")
          (cVoid --> cPtr);

      val free_ =
        call
          (getSymbol "giraffe_gi_argument_free")
          (cPtr --> cVoid);

      val from_boolean_ =
        call
          (getSymbol "giraffe_gi_argument_from_boolean")
          (cPtr --> GBool.PolyML.cVal);

      val from_int8_ =
        call
          (getSymbol "giraffe_gi_argument_from_int8")
          (cPtr --> GInt8.PolyML.cVal);

      val from_uint8_ =
        call
          (getSymbol "giraffe_gi_argument_from_uint8")
          (cPtr --> GUInt8.PolyML.cVal);

      val from_int16_ =
        call
          (getSymbol "giraffe_gi_argument_from_int16")
          (cPtr --> GInt16.PolyML.cVal);

      val from_uint16_ =
        call
          (getSymbol "giraffe_gi_argument_from_uint16")
          (cPtr --> GUInt16.PolyML.cVal);

      val from_int32_ =
        call
          (getSymbol "giraffe_gi_argument_from_int32")
          (cPtr --> GInt32.PolyML.cVal);

      val from_uint32_ =
        call
          (getSymbol "giraffe_gi_argument_from_uint32")
          (cPtr --> GUInt32.PolyML.cVal);

      val from_int64_ =
        call
          (getSymbol "giraffe_gi_argument_from_int64")
          (cPtr --> GInt64.PolyML.cVal);

      val from_uint64_ =
        call
          (getSymbol "giraffe_gi_argument_from_uint64")
          (cPtr --> GUInt64.PolyML.cVal);

      val from_float_ =
        call
          (getSymbol "giraffe_gi_argument_from_float")
          (cPtr --> GFloat.PolyML.cVal);

      val from_double_ =
        call
          (getSymbol "giraffe_gi_argument_from_double")
          (cPtr --> GDouble.PolyML.cVal);

      val from_string_ =
        call
          (getSymbol "giraffe_gi_argument_from_string")
          (cPtr --> Utf8.PolyML.cOutPtr);
    end

    fun fromReal x =
      let
        val {sign, digits, exp, ...} = Real.toDecimal x
        val numDigits = length digits

        (* `m` is integer with digits `digits` *)
        fun addDigit (d, a) = a * 10 + LargeInt.fromInt d
        val m =
          case digits of
            []      => 0
          | c :: cs => List.foldl addDigit (LargeInt.fromInt c) cs

        (* Use e-notation when `exp` is greater than `numDigits`, i.e. if
         * there would be a zero digit to the left of the decimal point
         * without e-notation.  With e-notation, always have one non-zero
         * digit before the decimal point. *)
        val (p, optE) =
          if exp <= numDigits
          then (numDigits - exp, NONE)
          else (numDigits - 1,   SOME (LargeInt.fromInt (exp - 1)))
      in
        (if sign then ~ m else m, p, optE)
      end

    type typetag_t = GIRepositoryTypeTag.t

    datatype t =
      BOOLEAN      of bool
    | INT8         of LargeInt.int
    | UINT8        of LargeInt.int
    | INT16        of LargeInt.int
    | UINT16       of LargeInt.int
    | INT32        of LargeInt.int
    | UINT32       of LargeInt.int
    | INT64        of LargeInt.int
    | UINT64       of LargeInt.int
    | FLOAT        of LargeInt.int * int * LargeInt.int option
    | DOUBLE       of LargeInt.int * int * LargeInt.int option
    | UTF8         of string
    | FILENAME     of string
    | VOID
    | GTYPE
    | ARRAY
    | INTERFACE
    | GLIST
    | GSLIST
    | GHASH
    | ERROR
    | UNICHAR

    structure FFI =
      struct
        structure Pointer = CPointer
        type opt = opt
        type non_opt = non_opt
        type 'a p = 'a p

        fun withNewPtr f () =
          let
            val ptr = new_ ()
            val retVal = f ptr
          in
            ptr & retVal
          end

        fun fromPtr tag ptr =
          (
            case tag of
              GIRepositoryTypeTag.BOOLEAN  => BOOLEAN (GBool.FFI.fromVal (from_boolean_ ptr))
            | GIRepositoryTypeTag.INT8     => INT8    (GInt8.FFI.fromVal (from_int8_ ptr))
            | GIRepositoryTypeTag.UINT8    => UINT8   (Word8.toLargeInt (GUInt8.FFI.fromVal (from_uint8_ ptr)))
            | GIRepositoryTypeTag.INT16    => INT16   (GInt16.FFI.fromVal (from_int16_ ptr))
            | GIRepositoryTypeTag.UINT16   => UINT16  (GUInt16.FFI.fromVal (from_uint16_ ptr))
            | GIRepositoryTypeTag.INT32    => INT32   (GInt32.FFI.fromVal (from_int32_ ptr))
            | GIRepositoryTypeTag.UINT32   => UINT32  (GUInt32.FFI.fromVal (from_uint32_ ptr))
            | GIRepositoryTypeTag.INT64    => INT64   (GInt64.FFI.fromVal (from_int64_ ptr))
            | GIRepositoryTypeTag.UINT64   => UINT64  (GUInt64.FFI.fromVal (from_uint64_ ptr))
            | GIRepositoryTypeTag.FLOAT    => FLOAT   (fromReal (GFloat.FFI.fromVal (from_float_ ptr)))
            | GIRepositoryTypeTag.DOUBLE   => DOUBLE  (fromReal (GDouble.FFI.fromVal (from_double_ ptr)))
            | GIRepositoryTypeTag.UTF8     => UTF8 (
                Utf8.FFI.fromPtr ~1 (from_string_ ptr)
              )
            | GIRepositoryTypeTag.FILENAME => FILENAME (
                Utf8.FFI.fromPtr ~1 (from_string_ ptr)
              )
            | GIRepositoryTypeTag.VOID      => VOID
            | GIRepositoryTypeTag.GTYPE     => GTYPE
            | GIRepositoryTypeTag.ARRAY     => ARRAY
            | GIRepositoryTypeTag.INTERFACE => INTERFACE
            | GIRepositoryTypeTag.GLIST     => GLIST
            | GIRepositoryTypeTag.GSLIST    => GSLIST
            | GIRepositoryTypeTag.GHASH     => GHASH
            | GIRepositoryTypeTag.ERROR     => ERROR
            | GIRepositoryTypeTag.UNICHAR   => UNICHAR
          ) before free_ ptr
      end

    structure PolyML =
      struct
        val cPtr = cPtr
        val cOptPtr = cOptPtr
      end
  end

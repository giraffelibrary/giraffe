structure GIRepositoryArgument :>
  sig
    include G_I_REPOSITORY_ARGUMENT
      where type typetag_t = GIRepositoryTypeTag.t

    structure PolyML :
      sig
        val PTR : C.notnull C.p PolyMLFFI.conversion
        val OPTPTR : unit C.p PolyMLFFI.conversion
      end
  end =
  struct
    type notnull = CPointer.notnull
    type 'a p = 'a CPointer.p

    val PTR = CPointer.PolyML.cVal : notnull p PolyMLFFI.conversion
    val OPTPTR = CPointer.PolyML.cOptVal : unit p PolyMLFFI.conversion

    local
      open PolyMLFFI
    in
      val new_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_new")
          (FFI.PolyML.VOID --> PTR);

      val free_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_free")
          (PTR --> FFI.PolyML.VOID);

      val from_boolean_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_boolean")
          (PTR --> FFI.Bool.PolyML.VAL);

      val from_int8_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_int8")
          (PTR --> FFI.Int8.PolyML.VAL);

      val from_uint8_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_uint8")
          (PTR --> FFI.UInt8.PolyML.VAL);

      val from_int16_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_int16")
          (PTR --> FFI.Int16.PolyML.VAL);

      val from_uint16_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_uint16")
          (PTR --> FFI.UInt16.PolyML.VAL);

      val from_int32_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_int32")
          (PTR --> FFI.Int32.PolyML.VAL);

      val from_uint32_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_uint32")
          (PTR --> FFI.UInt32.PolyML.VAL);

      val from_int64_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_int64")
          (PTR --> FFI.Int64.PolyML.VAL);

      val from_uint64_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_uint64")
          (PTR --> FFI.UInt64.PolyML.VAL);

      val from_float_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_float")
          (PTR --> FFI.Float.PolyML.VAL);

      val from_double_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_double")
          (PTR --> FFI.Double.PolyML.VAL);

      val from_string_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_string")
          (PTR --> Utf8.PolyML.RETPTR);
    end

    fun fromReal x =
      let
        val {sign, digits, exp, ...} = Real.toDecimal x
        val numDigits = length digits

        (* `m` is integer with digits `digits` *)
        fun addDigit (d, a) = a * 10 + d
        val m =
          case digits of
            []      => 0
          | c :: cs => List.foldl addDigit c cs

        (* Use e-notation when `exp` is greater than `numDigits`, i.e. if
         * there would be a zero digit to the left of the decimal point
         * without e-notation.  With e-notation, always have one non-zero
         * digit before the decimal point. *)
        val (p, optE) =
          if exp <= numDigits
          then (numDigits - exp, NONE)
          else (numDigits - 1,   SOME (exp - 1))
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
    | FLOAT        of LargeInt.int * LargeInt.int * LargeInt.int option
    | DOUBLE       of LargeInt.int * LargeInt.int * LargeInt.int option
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

    structure C =
      struct
        structure Pointer = CPointer
        type notnull = notnull
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
              GIRepositoryTypeTag.BOOLEAN  => BOOLEAN (FFI.Bool.C.fromVal (from_boolean_ ptr))
            | GIRepositoryTypeTag.INT8     => INT8    (FFI.Int8.C.fromVal (from_int8_ ptr))
            | GIRepositoryTypeTag.UINT8    => UINT8   (FFI.UInt8.C.fromVal (from_uint8_ ptr))
            | GIRepositoryTypeTag.INT16    => INT16   (FFI.Int16.C.fromVal (from_int16_ ptr))
            | GIRepositoryTypeTag.UINT16   => UINT16  (FFI.UInt16.C.fromVal (from_uint16_ ptr))
            | GIRepositoryTypeTag.INT32    => INT32   (FFI.Int32.C.fromVal (from_int32_ ptr))
            | GIRepositoryTypeTag.UINT32   => UINT32  (FFI.UInt32.C.fromVal (from_uint32_ ptr))
            | GIRepositoryTypeTag.INT64    => INT64   (FFI.Int64.C.fromVal (from_int64_ ptr))
            | GIRepositoryTypeTag.UINT64   => UINT64  (FFI.UInt64.C.fromVal (from_uint64_ ptr))
            | GIRepositoryTypeTag.FLOAT    => FLOAT   (fromReal (FFI.Float.C.fromVal (from_float_ ptr)))
            | GIRepositoryTypeTag.DOUBLE   => DOUBLE  (fromReal (FFI.Double.C.fromVal (from_double_ ptr)))
            | GIRepositoryTypeTag.UTF8     => UTF8 (
                Utf8.C.fromPtr true (from_string_ ptr)
              )
            | GIRepositoryTypeTag.FILENAME => FILENAME (
                Utf8.C.fromPtr true (from_string_ ptr)
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
        val PTR = PTR
        val OPTPTR = OPTPTR
      end
  end

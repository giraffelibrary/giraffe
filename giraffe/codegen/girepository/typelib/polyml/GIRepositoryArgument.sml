structure GIRepositoryArgument :>
  sig
    include G_I_REPOSITORY_ARGUMENT
      where type typetag_t = GIRepositoryTypeTag.t

    structure PolyML :
      sig
        val PTR : C.notnull C.p CInterface.Conversion
        val OPTPTR : unit C.p CInterface.Conversion
      end
  end =
  struct
    type notnull = CPointer.notnull
    type 'a p = 'a CPointer.t
    val PTR = CPointer.PolyML.POINTER : notnull p CInterface.Conversion
    val OPTPTR = CPointer.PolyML.POINTER : unit p CInterface.Conversion

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
          (PTR --> FFI.PolyML.Bool.VAL);

      val from_int8_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_int8")
          (PTR --> FFI.PolyML.Int8.VAL);

      val from_uint8_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_uint8")
          (PTR --> FFI.PolyML.UInt8.VAL);

      val from_int16_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_int16")
          (PTR --> FFI.PolyML.Int16.VAL);

      val from_uint16_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_uint16")
          (PTR --> FFI.PolyML.UInt16.VAL);

      val from_int32_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_int32")
          (PTR --> FFI.PolyML.Int32.VAL);

      val from_uint32_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_uint32")
          (PTR --> FFI.PolyML.UInt32.VAL);

      val from_int64_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_int64")
          (PTR --> FFI.PolyML.Int64.VAL);

      val from_uint64_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_uint64")
          (PTR --> FFI.PolyML.UInt64.VAL);

      val from_float_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_float")
          (PTR --> FFI.PolyML.Float.VAL);

      val from_double_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_double")
          (PTR --> FFI.PolyML.Double.VAL);

      val from_string_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_string")
          (PTR --> FFI.PolyML.String.RETPTR);
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
              GIRepositoryTypeTag.BOOLEAN  => BOOLEAN (from_boolean_ ptr)
            | GIRepositoryTypeTag.INT8     => INT8    (from_int8_ ptr)
            | GIRepositoryTypeTag.UINT8    => UINT8   (from_uint8_ ptr)
            | GIRepositoryTypeTag.INT16    => INT16   (from_int16_ ptr)
            | GIRepositoryTypeTag.UINT16   => UINT16  (from_uint16_ ptr)
            | GIRepositoryTypeTag.INT32    => INT32   (from_int32_ ptr)
            | GIRepositoryTypeTag.UINT32   => UINT32  (from_uint32_ ptr)
            | GIRepositoryTypeTag.INT64    => INT64   (from_int64_ ptr)
            | GIRepositoryTypeTag.UINT64   => UINT64  (from_uint64_ ptr)
            | GIRepositoryTypeTag.FLOAT    => FLOAT   (fromReal (from_float_ ptr))
            | GIRepositoryTypeTag.DOUBLE   => DOUBLE  (fromReal (from_double_ ptr))
            | GIRepositoryTypeTag.UTF8     => UTF8 (
                FFI.String.fromPtr true (from_string_ ptr)
              )
            | GIRepositoryTypeTag.FILENAME => FILENAME (
                FFI.String.fromPtr true (from_string_ ptr)
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

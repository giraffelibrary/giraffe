structure FFI :> F_F_I =
  struct

    structure PolyML =
      struct

        val VOID = CInterface.VOID


        local
          fun fromChar c = Char.ord c
          fun toChar x = Char.chr x handle Chr => raise Size
        in
          val UINT8 =
            CInterface.mapConversion (fromChar, toChar) CInterface.CHAR
        end


        local
          val m = IntInf.pow (2, 8)
          val half_m = m div 2

          fun fromChar c =
            let
              val x = Char.ord c
            in
              (* Assume x in range of unsigned char. *)
              if half_m <= x
              then x - m
              else x
            end

          fun toChar x =
            Char.chr (
              (*
               * Ensure result outside range of (signed) char if and only
               * if x is outside the range of unsigned char by swapping
               * regions [~m/2, 0) and [m/2, m).
               *)
              if half_m <= x andalso x < m
              then x - m
              else if ~ half_m <= x andalso x < 0
              then x + m
              else x
            ) handle
                Chr => raise Size
        in
          val INT8 =
            CInterface.mapConversion (fromChar, toChar) CInterface.CHAR
        end


        local
          val m =
            case PolyML.architecture () of
              "X86_64" => IntInf.pow (2, 16)
            | "I386"   => IntInf.pow (2, 16)
            | _        => raise Fail "unknown architecture"
          val half_m = m div 2

          fun fromShort x =
            (* Assume x in range of (signed) long int. *)
            if x < 0
            then x + m
            else x

          fun toShort x =
            (*
             * Ensure result outside range of (signed) long int if and only
             * if x is outside the range of unsigned long int by swapping
             * regions [~m/2, 0) and [m/2, m).
             *)
            if half_m <= x andalso x < m
            then x - m
            else if ~ half_m <= x andalso x < 0
            then x + m
            else x
        in
          val USHORT =
            CInterface.mapConversion (fromShort, toShort) CInterface.SHORT
        end


        local
          val m =
            case PolyML.architecture () of
              "X86_64" => IntInf.pow (2, 64)
            | "I386"   => IntInf.pow (2, 32)
            | _        => raise Fail "unknown architecture"
          val half_m = m div 2

          fun fromLong x =
            (* Assume x in range of (signed) long int. *)
            if x < 0
            then x + m
            else x

          fun toLong x =
            (*
             * Ensure result outside range of (signed) long int if and only
             * if x is outside the range of unsigned long int by swapping
             * regions [~m/2, 0) and [m/2, m).
             *)
            if half_m <= x andalso x < m
            then x - m
            else if ~ half_m <= x andalso x < 0
            then x + m
            else x
        in
          val ULONG =
            CInterface.mapConversion (fromLong, toLong) CInterface.LONG
        end


        val INT16 =
          case PolyML.architecture () of
            "X86_64" => CInterface.SHORT
          | "I386"   => CInterface.SHORT
          | _        => raise Fail "unknown architecture"


        val UINT16 =
          case PolyML.architecture () of
            "X86_64" => USHORT
          | "I386"   => USHORT
          | _        => raise Fail "unknown architecture"


        val INT32 =
          case PolyML.architecture () of
            "X86_64" => CInterface.INT
          | "I386"   => CInterface.INT
          | _        => raise Fail "unknown architecture"


        val UINT32 =
          case PolyML.architecture () of
            "X86_64" => CInterface.UINT
          | "I386"   => CInterface.UINT
          | _        => raise Fail "unknown architecture"


        fun fail msg _ = raise Fail msg
        fun FAIL msg =
          CInterface.mkConversion (fail msg) (fail msg) CInterface.voidStar

        val INT64 =
          case PolyML.architecture () of
            "X86_64" => CInterface.LONG
          | "I386"   => FAIL "unsupported architecture: I386"
          | _        => raise Fail "unknown architecture"


        val UINT64 =
          case PolyML.architecture () of
            "X86_64" => ULONG
          | "I386"   => FAIL "unsupported architecture: I386"
          | _        => raise Fail "unknown architecture"


        val SIZE = ULONG


        val SSIZE = CInterface.LONG


        val ENUM =
          case PolyML.architecture () of
            "X86_64" => CInterface.mapConversion (Int32.fromInt, Int32.toInt) CInterface.INT
          | "I386"   => CInterface.mapConversion (Int32.fromInt, Int32.toInt) CInterface.INT
          | _        => raise Fail "unknown architecture"


        val FLAGS =
          case PolyML.architecture () of
            "X86_64" => CInterface.mapConversion (Word32.fromLargeInt, Word32.toLargeInt) CInterface.UINT
          | "I386"   => CInterface.mapConversion (Word32.fromLargeInt, Word32.toLargeInt) CInterface.UINT
          | _        => raise Fail "unknown architecture"


        (**
         * Pointer
         *)
        structure Pointer =
          struct
            val VAL = CPointer.PolyML.POINTER : CPointer.notnull CPointer.t CInterface.Conversion
            val REF = CPointer.PolyML.POINTER : unit CPointer.t CInterface.Conversion
          end


        (**
         * OptPointer
         *)
        structure OptPointer =
          struct
            val VAL = CPointer.PolyML.POINTER : unit CPointer.t CInterface.Conversion
            val REF = CPointer.PolyML.POINTER : unit CPointer.t CInterface.Conversion
          end


        val REF = OptPointer.VAL


        (**
         * Char
         *)
        structure Char =
          struct
            val VAL = CInterface.CHAR
            val REF = REF
          end


        (**
         * Short
         *)
        structure Short =
          struct
            val VAL = CInterface.SHORT : LargeInt.int CInterface.Conversion
            val REF = REF
          end


        (**
         * UShort
         *)
        structure UShort =
          struct
            val VAL = USHORT : LargeInt.int CInterface.Conversion
            val REF = REF
          end


        (**
         * Int
         *)
        structure Int =
          struct
            val VAL = CInterface.INT : LargeInt.int CInterface.Conversion
            val REF = REF
          end


        (**
         * UInt
         *)
        structure UInt =
          struct
            val VAL = CInterface.UINT : LargeInt.int CInterface.Conversion
            val REF = REF
          end


        (**
         * Long
         *)
        structure Long =
          struct
            val VAL = CInterface.LONG : LargeInt.int CInterface.Conversion
            val REF = REF
          end


        (**
         * ULong
         *)
        structure ULong =
          struct
            val VAL = ULONG : LargeInt.int CInterface.Conversion
            val REF = REF
          end


        (**
         * Flags
         *)
        structure Flags =
          struct
            val VAL = FLAGS
            val REF = REF
          end


        (**
         * Enum
         *)
        structure Enum =
          struct
            val VAL = ENUM
            val REF = REF
          end


        (**
         * Bool
         *)
        structure Bool =
          struct
            val VAL = CInterface.BOOL
            val REF = REF
          end


        (**
         * Int8
         *)
        structure Int8 =
          struct
            val VAL = INT8
            val REF = REF
          end


        (**
         * UInt8
         *)
        structure UInt8 =
          struct
            val VAL = UINT8
            val REF = REF
          end


        (**
         * Int16
         *)
        structure Int16 =
          struct
            val VAL = INT16 : LargeInt.int CInterface.Conversion
            val REF = REF
          end


        (**
         * UInt16
         *)
        structure UInt16 =
          struct
            val VAL = UINT16 : LargeInt.int CInterface.Conversion
            val REF = REF
          end


        (**
         * Int32
         *)
        structure Int32 =
          struct
            val VAL = INT32 : LargeInt.int CInterface.Conversion
            val REF = REF
          end


        (**
         * UInt32
         *)
        structure UInt32 =
          struct
            val VAL = UINT32 : LargeInt.int CInterface.Conversion
            val REF = REF
          end


        (**
         * Int64
         *)
        structure Int64 =
          struct
            val VAL = INT64 : LargeInt.int CInterface.Conversion
            val REF = REF
          end


        (**
         * UInt64
         *)
        structure UInt64 =
          struct
            val VAL = UINT64 : LargeInt.int CInterface.Conversion
            val REF = REF
          end


        (**
         * SSize
         *)
        structure SSize = Long


        (**
         * Size
         *)
        structure Size = ULong


        (**
         * Float
         *)
        structure Float =
          struct
            val VAL = CInterface.FLOAT
            val REF = REF
          end


        (**
         * Double
         *)
        structure Double =
          struct
            val VAL = CInterface.DOUBLE
            val REF = REF
          end


        (**
         * String
         *)
        structure String =
          struct
            local
              open GCharVec.C
            in
              type notnull = notnull
              type 'a in_p = 'a in_p CInterface.Conversion
              type 'a out_p = 'a out_p CInterface.Conversion
              type ('a, 'b) r = ('a, 'b) r CInterface.Conversion 

              val INPTR = GCharVec.PolyML.INPTR : notnull in_p
              val INOPTPTR = GCharVec.PolyML.INPTR : unit in_p
              val OUTREF = GCharVec.PolyML.INOUTREF : (unit, notnull) r
              val OUTOPTREF = GCharVec.PolyML.INOUTREF : (unit, unit) r
              val INOUTREF = GCharVec.PolyML.INOUTREF : (notnull, notnull) r
              val RETPTR = GCharVec.PolyML.OUTPTR : notnull out_p
              val RETOPTPTR = GCharVec.PolyML.OUTPTR : unit out_p
            end
          end


        (**
         * String vector (to/from SML list)
         *)
        structure StringVector =
          struct
            local
              open GCharVecVec.C
            in
              type notnull = notnull
              type 'a in_p = 'a in_p CInterface.Conversion
              type 'a out_p = 'a out_p CInterface.Conversion
              type ('a, 'b) r = ('a, 'b) r CInterface.Conversion 

              val INPTR = GCharVecVec.PolyML.INPTR : notnull in_p
              val INOPTPTR = GCharVecVec.PolyML.INPTR : unit in_p
              val OUTREF = GCharVecVec.PolyML.INOUTREF : (unit, notnull) r
              val OUTOPTREF = GCharVecVec.PolyML.INOUTREF : (unit, unit) r
              val INOUTREF = GCharVecVec.PolyML.INOUTREF : (notnull, notnull) r
              val RETPTR = GCharVecVec.PolyML.OUTPTR : notnull out_p
              val RETOPTPTR = GCharVecVec.PolyML.OUTPTR : unit out_p
            end
          end
      end


    structure C =
      struct

     (* val withVal = I *)

        fun withRef conv f x =
          let
            val (fromC, toC, _) = CInterface.breakConversion conv
            open CPointer
            open PolyML

            val v = toC x
            val a = toOptNull (addressFromVol v)
            val r = f a
          in
            fromC v & r
          end

        type ref_ = unit CPointer.t

        fun withNullRef f () = f CPointer.null


        (**
         * Flags
         *)
        structure Flags =
          struct
            type val_ = Word32.word
            type ref_ = ref_
            val withRef = fn f => withRef PolyML.Flags.VAL f
          end


        (**
         * Enum
         *)
        structure Enum =
          struct
            type val_ = Int32.int
            type ref_ = ref_
            val withRef = fn f => withRef PolyML.Enum.VAL f
          end


        (**
         * Pointer
         *)
        structure Pointer =
          struct
            type val_ = CPointer.notnull CPointer.t
            type ref_ = ref_
            val withVal = I
            fun withRefVal f = withVal (withRef PolyML.Pointer.VAL f)
            val fromVal = I
          end


        (**
         * OptPointer
         *)
        structure OptPointer =
          struct
            type val_ = unit CPointer.t
            type ref_ = ref_
            val withVal = I
            fun withRefVal f = withVal (withRef PolyML.OptPointer.VAL f)
            val fromVal = I
          end


        (**
         * Char
         *)
        structure Char =
          struct
            type val_ = Char.char
            type ref_ = ref_
            val withVal = I
            fun withRefVal f = withVal (withRef PolyML.Char.VAL f)
            val fromVal = I
          end


        (**
         * Short
         *)
        structure Short =
          struct
            type val_ = LargeInt.int
            type ref_ = ref_
            val withVal = I
            fun withRefVal f = withVal (withRef PolyML.Short.VAL f)
            val fromVal = I
          end


        (**
         * UShort
         *)
        structure UShort =
          struct
            type val_ = LargeInt.int
            type ref_ = ref_
            val withVal = I
            fun withRefVal f = withVal (withRef PolyML.UShort.VAL f)
            val fromVal = I
          end


        (**
         * Int
         *)
        structure Int =
          struct
            type val_ = LargeInt.int
            type ref_ = ref_
            val withVal = I
            fun withRefVal f = withVal (withRef PolyML.Int.VAL f)
            val fromVal = I
          end


        (**
         * UInt
         *)
        structure UInt =
          struct
            type val_ = LargeInt.int
            type ref_ = ref_
            val withVal = I
            fun withRefVal f = withVal (withRef PolyML.UInt.VAL f)
            val fromVal = I
          end


        (**
         * Long
         *)
        structure Long =
          struct
            type val_ = LargeInt.int
            type ref_ = ref_
            val withVal = I
            fun withRefVal f = withVal (withRef PolyML.Long.VAL f)
            val fromVal = I
          end


        (**
         * ULong
         *)
        structure ULong =
          struct
            type val_ = LargeInt.int
            type ref_ = ref_
            val withVal = I
            fun withRefVal f = withVal (withRef PolyML.ULong.VAL f)
            val fromVal = I
          end


        (**
         * Bool
         *)
        structure Bool =
          struct
            type val_ = Bool.bool
            type ref_ = ref_
            val withVal = I
            fun withRefVal f = withVal (withRef PolyML.Bool.VAL f)
            val fromVal = I
          end


        (**
         * Int8
         *)
        structure Int8 =
          struct
            type val_ = LargeInt.int
            type ref_ = ref_
            val withVal = I
            fun withRefVal f = withVal (withRef PolyML.Int8.VAL f)
            val fromVal = I
          end


        (**
         * UInt8
         *)
        structure UInt8 =
          struct
            type val_ = LargeInt.int
            type ref_ = ref_
            val withVal = I
            fun withRefVal f = withVal (withRef PolyML.UInt8.VAL f)
            val fromVal = I
          end


        (**
         * Int16
         *)
        structure Int16 =
          struct
            type val_ = LargeInt.int
            type ref_ = ref_
            val withVal = I
            fun withRefVal f = withVal (withRef PolyML.Int16.VAL f)
            val fromVal = I
          end


        (**
         * UInt16
         *)
        structure UInt16 =
          struct
            type val_ = LargeInt.int
            type ref_ = ref_
            val withVal = I
            fun withRefVal f = withVal (withRef PolyML.UInt16.VAL f)
            val fromVal = I
          end


        (**
         * Int32
         *)
        structure Int32 =
          struct
            type val_ = LargeInt.int
            type ref_ = ref_
            val withVal = I
            fun withRefVal f = withVal (withRef PolyML.Int32.VAL f)
            val fromVal = I
          end


        (**
         * UInt32
         *)
        structure UInt32 =
          struct
            type val_ = LargeInt.int
            type ref_ = ref_
            val withVal = I
            fun withRefVal f = withVal (withRef PolyML.UInt32.VAL f)
            val fromVal = I
          end


        (**
         * Int64
         *)
        structure Int64 =
          struct
            type val_ = LargeInt.int
            type ref_ = ref_
            val withVal = I
            fun withRefVal f = withVal (withRef PolyML.Int64.VAL f)
            val fromVal = I
          end


        (**
         * UInt64
         *)
        structure UInt64 =
          struct
            type val_ = LargeInt.int
            type ref_ = ref_
            val withVal = I
            fun withRefVal f = withVal (withRef PolyML.UInt64.VAL f)
            val fromVal = I
          end


        (**
         * Size
         *)
        structure Size = ULong


        (**
         * SSize
         *)
        structure SSize = Long


        (**
         * Float
         *)
        structure Float =
          struct
            type val_ = real
            type ref_ = ref_
            val withVal = I
            fun withRefVal f = withVal (withRef PolyML.Float.VAL f)
            val fromVal = I
          end


        (**
         * Double
         *)
        structure Double =
          struct
            type val_ = real
            type ref_ = ref_
            val withVal = I
            fun withRefVal f = withVal (withRef PolyML.Double.VAL f)
            val fromVal = I
          end


        (**
         * String
         *)
        structure String =
          struct
            local
              open GCharVec.C
            in
              type notnull = notnull
              type 'a in_p = 'a in_p
              type 'a out_p = 'a out_p
              type ('a, 'b) r = ('a, 'b) r
            end


            val withNullRef = GCharVec.C.withNullRef


            val withConstPtr =
              fn f => GCharVec.C.withConstPtr f o GCharVec.fromVector

            val withConstOptPtr =
              fn f => GCharVec.C.withConstOptPtr f o Option.map GCharVec.fromVector


            val withRefConstPtr =
              fn f => GCharVec.C.withRefConstPtr f o GCharVec.fromVector

            val withRefConstOptPtr =
              fn f => GCharVec.C.withRefConstOptPtr f o Option.map GCharVec.fromVector


            val withRefDupPtr =
              fn f => GCharVec.C.withRefDupPtr f o GCharVec.fromVector

            val withRefDupOptPtr =
              fn f => GCharVec.C.withRefDupOptPtr f o Option.map GCharVec.fromVector


            fun fromPtr transfer =
              if transfer
              then GCharVec.C.copyNewPtrToVector o GCharVec.C.OutPointer.toNotNull
              else GCharVec.C.copyPtrToVector o GCharVec.C.OutPointer.toNotNull

            fun fromOptPtr transfer =
              if transfer
              then GCharVec.C.copyNewOptPtrToVector
              else GCharVec.C.copyOptPtrToVector
          end


        (**
         * String vector (to/from SML list)
         *)
        structure StringVector =
          struct
            local
              open GCharVecVec.C
            in
              type notnull = notnull
              type 'a in_p = 'a in_p
              type 'a out_p = 'a out_p
              type ('a, 'b) r = ('a, 'b) r
            end

            val fromList = GCharVecVec.fromVector o Vector.fromList


            val withNullRef = GCharVecVec.C.withNullRef


            val withConstPtr = fn f => GCharVecVec.C.withConstPtr f o fromList

            val withConstOptPtr =
              fn f => GCharVecVec.C.withConstOptPtr f o Option.map fromList


            val withRefConstPtr =
              fn f => GCharVecVec.C.withRefConstPtr f o fromList

            val withRefConstOptPtr =
              fn f => GCharVecVec.C.withRefConstOptPtr f o Option.map fromList


            val withRefDupPtr =
              fn f => GCharVecVec.C.withRefDupPtr f o fromList

            val withRefDupOptPtr =
              fn f => GCharVecVec.C.withRefDupOptPtr f o Option.map fromList


            fun fromPtr transfer =
              let
                val from =
                  if transfer
                  then GCharVecVec.C.copyNewPtrToTabulated
                  else GCharVecVec.C.copyPtrToTabulated
              in
                from List.tabulate o GCharVecVec.C.OutPointer.toNotNull
              end


            fun fromOptPtr transfer =
              let
                val from =
                  if transfer
                  then GCharVecVec.C.copyNewOptPtrToTabulated
                  else GCharVecVec.C.copyOptPtrToTabulated
              in
                from List.tabulate
              end
          end
      end


    (**
     * Flags
     *)
    structure Flags =
      struct
        type t = Word32.word
        structure C = C.Flags
        structure PolyML = PolyML.Flags
      end


    (**
     * Enum
     *)
    structure Enum =
      struct
        type t = Int32.int
        structure C = C.Enum
        structure PolyML = PolyML.Enum
      end


    (**
     * Pointer
     *)
    structure Pointer =
      struct
        type t = CPointer.notnull CPointer.t
        structure C = C.Pointer
        structure PolyML = PolyML.Pointer
      end


    (**
     * OptPointer
     *)
    structure OptPointer =
      struct
        type t = unit CPointer.t
        structure C = C.OptPointer
        structure PolyML = PolyML.OptPointer
      end


    (**
     * Char
     *)
    structure Char =
      struct
        type t = char
        structure C = C.Char
        structure PolyML = PolyML.Char
      end


    (**
     * Short
     *)
    structure Short =
      struct
        type t = LargeInt.int
        structure C = C.Short
        structure PolyML = PolyML.Short
      end


    (**
     * UShort
     *)
    structure UShort =
      struct
        type t = LargeInt.int
        structure C = C.UShort
        structure PolyML = PolyML.UShort
      end


    (**
     * Int
     *)
    structure Int =
      struct
        type t = LargeInt.int
        structure C = C.Int
        structure PolyML = PolyML.Int
      end


    (**
     * UInt
     *)
    structure UInt =
      struct
        type t = LargeInt.int
        structure C = C.UInt
        structure PolyML = PolyML.UInt
      end


    (**
     * Long
     *)
    structure Long =
      struct
        type t = LargeInt.int
        structure C = C.Long
        structure PolyML = PolyML.Long
      end


    (**
     * ULong
     *)
    structure ULong =
      struct
        type t = LargeInt.int
        structure C = C.ULong
        structure PolyML = PolyML.ULong
      end


    (**
     * Bool
     *)
    structure Bool =
      struct
        type t = bool
        structure C = C.Bool
        structure PolyML = PolyML.Bool
      end


    (**
     * Int8
     *)
    structure Int8 =
      struct
        type t = LargeInt.int
        structure C = C.Int8
        structure PolyML = PolyML.Int8
      end


    (**
     * UInt8
     *)
    structure UInt8 =
      struct
        type t = LargeInt.int
        structure C = C.UInt8
        structure PolyML = PolyML.UInt8
      end


    (**
     * Int16
     *)
    structure Int16 =
      struct
        type t = LargeInt.int
        structure C = C.Int16
        structure PolyML = PolyML.Int16
      end


    (**
     * UInt16
     *)
    structure UInt16 =
      struct
        type t = LargeInt.int
        structure C = C.UInt16
        structure PolyML = PolyML.UInt16
      end


    (**
     * Int32
     *)
    structure Int32 =
      struct
        type t = LargeInt.int
        structure C = C.Int32
        structure PolyML = PolyML.Int32
      end


    (**
     * UInt32
     *)
    structure UInt32 =
      struct
        type t = LargeInt.int
        structure C = C.UInt32
        structure PolyML = PolyML.UInt32
      end


    (**
     * Int64
     *)
    structure Int64 =
      struct
        type t = LargeInt.int
        structure C = C.Int64
        structure PolyML = PolyML.Int64
      end


    (**
     * UInt64
     *)
    structure UInt64 =
      struct
        type t = LargeInt.int
        structure C = C.UInt64
        structure PolyML = PolyML.UInt64
      end


    (**
     * SSize
     *)
    structure SSize =
      struct
        type t = LargeInt.int
        structure C = C.SSize
        structure PolyML = PolyML.SSize
      end


    (**
     * Size
     *)
    structure Size =
      struct
        type t = LargeInt.int
        structure C = C.Size
        structure PolyML = PolyML.Size
      end


    (**
     * Float
     *)
    structure Float =
      struct
        type t = real
        structure C = C.Float
        structure PolyML = PolyML.Float
      end


    (**
     * Double
     *)
    structure Double =
      struct
        type t = real
        structure C = C.Double
        structure PolyML = PolyML.Double
      end


    (**
     * String
     *)
    structure String =
      struct
        type t = string
        structure C = C.String
        structure PolyML = PolyML.String
      end


    (**
     * String vector (to/from SML list)
     *)
    structure StringVector =
      struct
        type t = string list
        structure C = C.StringVector
        structure PolyML = PolyML.StringVector
      end

  end

structure FFI :> F_F_I =
  struct

    structure C =
      struct

        val withVal = I

        fun withRef f x =
          let
            val a = ref x
            val r = f a
          in
            !a & r
          end

        type ref_ = unit CPointer.t

        fun withNullRef f () = f CPointer.null


        (**
         * Pointer
         *)
        structure Pointer =
          struct
            type val_ = CPointer.notnull CPointer.t
            type ref_ = val_ ref
            val withVal = I
            val withRefVal
              : (ref_ -> 'a)
                 -> CPointer.notnull CPointer.t
                 -> (CPointer.notnull CPointer.t, 'a) pair =
              withRef
            val fromVal = I
          end


        (**
         * OptPointer
         *)
        structure OptPointer =
          struct
            type val_ = unit CPointer.t
            type ref_ = val_ ref
            val withVal = I
            val withRefVal
              : (ref_ -> 'a) -> unit CPointer.t -> (unit CPointer.t, 'a) pair =
              withRef
            val fromVal = I
          end


        (**
         * Char
         *)
        structure Char =
          struct
            type val_ = Char.char
            type ref_ = val_ ref
            val withVal = I
            fun withRefVal f = withVal (withRef f)
            val fromVal = I
          end


        (**
         * Short
         *)
        structure Short =
          struct
            type val_ = C_Short.t
            type ref_ = val_ ref
            fun withVal f x = f (C_Short.fromLarge x)
            fun withRefVal f = withVal (withRef f)
            val fromVal = C_Short.toLarge
          end


        (**
         * UShort
         *)
        structure UShort =
          struct
            type val_ = C_UShort.t
            type ref_ = val_ ref
            fun withVal f x = f (C_UShort.fromLargeInt x)
            fun withRefVal f = withVal (withRef f)
            val fromVal = C_UShort.toLargeInt
          end


        (**
         * Int
         *)
        structure Int =
          struct
            type val_ = C_Int.t
            type ref_ = val_ ref
            fun withVal f x = f (C_Int.fromLarge x)
            fun withRefVal f = withVal (withRef f)
            val fromVal = C_Int.toLarge
          end


        (**
         * UInt
         *)
        structure UInt =
          struct
            type val_ = C_UInt.t
            type ref_ = val_ ref
            fun withVal f x = f (C_UInt.fromLargeInt x)
            fun withRefVal f = withVal (withRef f)
            val fromVal = C_UInt.toLargeInt
          end


        (**
         * Long
         *)
        structure Long =
          struct
            type val_ = C_Long.t
            type ref_ = val_ ref
            fun withVal f x = f (C_Long.fromLarge x)
            fun withRefVal f = withVal (withRef f)
            val fromVal = C_Long.toLarge
          end


        (**
         * ULong
         *)
        structure ULong =
          struct
            type val_ = C_ULong.t
            type ref_ = val_ ref
            fun withVal f x = f (C_ULong.fromLargeInt x)
            fun withRefVal f = withVal (withRef f)
            val fromVal = C_ULong.toLargeInt
          end


        (**
         * Flags
         *)
        structure Flags =
          struct
            type val_ = C_UInt.t
            type ref_ = val_ ref
            val withRef = withRef
          end


        (**
         * Enum
         *)
        structure Enum =
          struct
            type val_ = C_Int.t
            type ref_ = val_ ref
            val withRef = withRef
          end


        (**
         * Bool
         *)
        structure Bool =
          struct
            type val_ = Bool.bool
            type ref_ = val_ ref
            val withVal = I
            val withRefVal = withRef
            val fromVal = I
          end


        (**
         * Int8
         *)
        structure Int8 =
          struct
            type val_ = Int8.int
            type ref_ = val_ ref
            fun withVal f x = f (Int8.fromLarge x)
            fun withRefVal f = withVal (withRef f)
            val fromVal = Int8.toLarge
          end


        (**
         * UInt8
         *)
        structure UInt8 =
          struct
            type val_ = Word8.word
            type ref_ = val_ ref
            fun withVal f x = f (Word8.fromLargeInt x)
            fun withRefVal f = withVal (withRef f)
            val fromVal = Word8.toLargeInt
          end


        (**
         * Int16
         *)
        structure Int16 =
          struct
            type val_ = Int16.int
            type ref_ = val_ ref
            fun withVal f x = f (Int16.fromLarge x)
            fun withRefVal f = withVal (withRef f)
            val fromVal = Int16.toLarge
          end


        (**
         * UInt16
         *)
        structure UInt16 =
          struct
            type val_ = Word16.word
            type ref_ = val_ ref
            fun withVal f x = f (Word16.fromLargeInt x)
            fun withRefVal f = withVal (withRef f)
            val fromVal = Word16.toLargeInt
          end


        (**
         * Int32
         *)
        structure Int32 =
          struct
            type val_ = Int32.int
            type ref_ = val_ ref
            fun withVal f x = f (Int32.fromLarge x)
            fun withRefVal f = withVal (withRef f)
            val fromVal = Int32.toLarge
          end


        (**
         * UInt32
         *)
        structure UInt32 =
          struct
            type val_ = Word32.word
            type ref_ = val_ ref
            fun withVal f x = f (Word32.fromLargeInt x)
            fun withRefVal f = withVal (withRef f)
            val fromVal = Word32.toLargeInt
          end


        (**
         * Int64
         *)
        structure Int64 =
          struct
            type val_ = Int64.int
            type ref_ = val_ ref
            fun withVal f x = f (Int64.fromLarge x)
            fun withRefVal f = withVal (withRef f)
            val fromVal = Int64.toLarge
          end


        (**
         * UInt64
         *)
        structure UInt64 =
          struct
            type val_ = Word64.word
            type ref_ = val_ ref
            fun withVal f x = f (Word64.fromLargeInt x)
            fun withRefVal f = withVal (withRef f)
            val fromVal = Word64.toLargeInt
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
            type val_ = real
            type ref_ = val_ ref
            val withVal = I
            fun withRefVal f = withVal (withRef f)
            val fromVal = I
          end


        (**
         * Double
         *)
        structure Double =
          struct
            type val_ = real
            type ref_ = val_ ref
            val withVal = I
            fun withRefVal f = withVal (withRef f)
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
      end


    (**
     * Enum
     *)
    structure Enum =
      struct
        type t = Int32.int
        structure C = C.Enum
      end


    (**
     * Pointer
     *)
    structure Pointer =
      struct
        type t = CPointer.notnull CPointer.t
        structure C = C.Pointer
      end


    (**
     * OptPointer
     *)
    structure OptPointer =
      struct
        type t = unit CPointer.t
        structure C = C.OptPointer
      end


    (**
     * Char
     *)
    structure Char =
      struct
        type t = char
        structure C = C.Char
      end


    (**
     * Short
     *)
    structure Short =
      struct
        type t = LargeInt.int
        structure C = C.Short
      end


    (**
     * UShort
     *)
    structure UShort =
      struct
        type t = LargeInt.int
        structure C = C.UShort
      end


    (**
     * Int
     *)
    structure Int =
      struct
        type t = LargeInt.int
        structure C = C.Int
      end


    (**
     * UInt
     *)
    structure UInt =
      struct
        type t = LargeInt.int
        structure C = C.UInt
      end


    (**
     * Long
     *)
    structure Long =
      struct
        type t = LargeInt.int
        structure C = C.Long
      end


    (**
     * ULong
     *)
    structure ULong =
      struct
        type t = LargeInt.int
        structure C = C.ULong
      end


    (**
     * Bool
     *)
    structure Bool =
      struct
        type t = bool
        structure C = C.Bool
      end


    (**
     * Int8
     *)
    structure Int8 =
      struct
        type t = LargeInt.int
        structure C = C.Int8
      end


    (**
     * UInt8
     *)
    structure UInt8 =
      struct
        type t = LargeInt.int
        structure C = C.UInt8
      end


    (**
     * Int16
     *)
    structure Int16 =
      struct
        type t = LargeInt.int
        structure C = C.Int16
      end


    (**
     * UInt16
     *)
    structure UInt16 =
      struct
        type t = LargeInt.int
        structure C = C.UInt16
      end


    (**
     * Int32
     *)
    structure Int32 =
      struct
        type t = LargeInt.int
        structure C = C.Int32
      end


    (**
     * UInt32
     *)
    structure UInt32 =
      struct
        type t = LargeInt.int
        structure C = C.UInt32
      end


    (**
     * Int64
     *)
    structure Int64 =
      struct
        type t = LargeInt.int
        structure C = C.Int64
      end


    (**
     * UInt64
     *)
    structure UInt64 =
      struct
        type t = LargeInt.int
        structure C = C.UInt64
      end


    (**
     * SSize
     *)
    structure SSize =
      struct
        type t = LargeInt.int
        structure C = C.SSize
      end


    (**
     * Size
     *)
    structure Size =
      struct
        type t = LargeInt.int
        structure C = C.Size
      end


    (**
     * Float
     *)
    structure Float =
      struct
        type t = real
        structure C = C.Float
      end


    (**
     * Double
     *)
    structure Double =
      struct
        type t = real
        structure C = C.Double
      end


    (**
     * String
     *)
    structure String =
      struct
        type t = string
        structure C = C.String
      end


    (**
     * String vector (to/from SML list)
     *)
    structure StringVector =
      struct
        type t = string list
        structure C = C.StringVector
      end

  end

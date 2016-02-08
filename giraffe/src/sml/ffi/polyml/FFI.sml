(* Copyright (C) 2012-2013, 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure FFI :> F_F_I =
  struct

    structure PolyML =
      struct
        open PolyMLFFI

        val VOID = cVoid

        val cRef = cPointer : Memory.Pointer.t conversion


        (**
         * Flags
         *)
        local
          val {load, store, ctype} = breakConversion cUint32
        in
          val cFlags =
            makeConversion {
              load  = Word32.fromInt o load,
              store = store o Word32.toInt,
              ctype = ctype
            }
        end

        structure Flags =
          struct
            val VAL = cFlags
            val REF = cRef
          end


        (**
         * Enum
         *)
        local
          val {load, store, ctype} = breakConversion cUint32
        in
          val cEnum =
            makeConversion {
              load  = Int32.fromInt o load,
              store = store o Int32.toInt,
              ctype = ctype
            }
        end

        structure Enum =
          struct
            val VAL = cEnum
            val REF = cRef
          end


        (**
         * OptPointer
         *)
        structure OptPointer =
          struct
            val VAL = CPointer.PolyML.cOptVal : unit CPointer.p conversion
            val REF = cRef
          end


        (**
         * Char
         *)
        structure Char =
          struct
            val VAL = cChar
            val REF = cRef
          end


        (**
         * Short
         *)
        structure Short =
          struct
            val VAL = cShort
            val REF = cRef
          end


        (**
         * UShort
         *)
        structure UShort =
          struct
            val VAL = cUshort
            val REF = cRef
          end


        (**
         * Int
         *)
        structure Int =
          struct
            val VAL = cInt
            val REF = cRef
          end


        (**
         * UInt
         *)
        structure UInt =
          struct
            val VAL = cUint
            val REF = cRef
          end


        (**
         * Long
         *)
        structure Long =
          struct
            val VAL = cLong
            val REF = cRef
          end


        (**
         * ULong
         *)
        structure ULong =
          struct
            val VAL = cUlong
            val REF = cRef
          end


        (**
         * Bool
         *)
        local
          val {load, store, ctype} = breakConversion cInt
          fun fromInt n = n <> 0
          val toInt = fn true => 1 | false => 0
        in
          val cBool =
            makeConversion {
              load  = fromInt o load,
              store = store o toInt,
              ctype = ctype
            }
        end

        structure Bool =
          struct
            val VAL = cBool
            val REF = cRef
          end


        (**
         * Int8
         *)
        structure Int8 =
          struct
            val VAL = cInt8
            val REF = cRef
          end


        (**
         * UInt8
         *)
        structure UInt8 =
          struct
            val VAL = cUint8
            val REF = cRef
          end


        (**
         * Int16
         *)
        structure Int16 =
          struct
            val VAL = cInt16
            val REF = cRef
          end


        (**
         * UInt16
         *)
        structure UInt16 =
          struct
            val VAL = cUint16
            val REF = cRef
          end


        (**
         * Int32
         *)
        structure Int32 =
          struct
            val VAL = cInt32
            val REF = cRef
          end


        (**
         * UInt32
         *)
        structure UInt32 =
          struct
            val VAL = cUint32
            val REF = cRef
          end


        (**
         * Int64
         *)
        structure Int64 =
          struct
            val VAL = cInt64
            val REF = cRef
          end


        (**
         * UInt64
         *)
        structure UInt64 =
          struct
            val VAL = cUint64
            val REF = cRef
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
            val VAL = cFloat
            val REF = cRef
          end


        (**
         * Double
         *)
        structure Double =
          struct
            val VAL = cDouble
            val REF = cRef
          end
      end


    structure C =
      struct

     (* val withVal = I *)

        fun withRef conv f x =
          let
            val {load, store, ctype} = PolyMLFFI.breakConversion conv
            val mem = PolyMLFFI.Memory.malloc (#size ctype)
            val freeMem = store x mem
            fun freeAll () = (freeMem (); PolyMLFFI.Memory.free mem)
          in
            let
              val y = f mem
              val p' = load mem
              val () = freeAll ()
            in
              p' & y
            end
              handle e => (freeAll (); raise e)
          end

        type ref_ = PolyMLFFI.Memory.Pointer.t


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
         * OptPointer
         *)
        structure OptPointer =
          struct
            type val_ = unit CPointer.p
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
     * OptPointer
     *)
    structure OptPointer =
      struct
        type t = unit CPointer.p
        val null = CPointer.null
        structure C = C.OptPointer
        structure PolyML = PolyML.OptPointer
      end


    (**
     * Char
     *)
    structure Char =
      struct
        type t = char
        val null = #"\000"
        structure C = C.Char
        structure PolyML = PolyML.Char
      end


    (**
     * Short
     *)
    structure Short =
      struct
        type t = LargeInt.int
        val null = 0
        structure C = C.Short
        structure PolyML = PolyML.Short
      end


    (**
     * UShort
     *)
    structure UShort =
      struct
        type t = LargeInt.int
        val null = 0
        structure C = C.UShort
        structure PolyML = PolyML.UShort
      end


    (**
     * Int
     *)
    structure Int =
      struct
        type t = LargeInt.int
        val null = 0
        structure C = C.Int
        structure PolyML = PolyML.Int
      end


    (**
     * UInt
     *)
    structure UInt =
      struct
        type t = LargeInt.int
        val null = 0
        structure C = C.UInt
        structure PolyML = PolyML.UInt
      end


    (**
     * Long
     *)
    structure Long =
      struct
        type t = LargeInt.int
        val null = 0
        structure C = C.Long
        structure PolyML = PolyML.Long
      end


    (**
     * ULong
     *)
    structure ULong =
      struct
        type t = LargeInt.int
        val null = 0
        structure C = C.ULong
        structure PolyML = PolyML.ULong
      end


    (**
     * Bool
     *)
    structure Bool =
      struct
        type t = bool
        val null = false
        structure C = C.Bool
        structure PolyML = PolyML.Bool
      end


    (**
     * Int8
     *)
    structure Int8 =
      struct
        type t = LargeInt.int
        val null = 0
        structure C = C.Int8
        structure PolyML = PolyML.Int8
      end


    (**
     * UInt8
     *)
    structure UInt8 =
      struct
        type t = LargeInt.int
        val null = 0
        structure C = C.UInt8
        structure PolyML = PolyML.UInt8
      end


    (**
     * Int16
     *)
    structure Int16 =
      struct
        type t = LargeInt.int
        val null = 0
        structure C = C.Int16
        structure PolyML = PolyML.Int16
      end


    (**
     * UInt16
     *)
    structure UInt16 =
      struct
        type t = LargeInt.int
        val null = 0
        structure C = C.UInt16
        structure PolyML = PolyML.UInt16
      end


    (**
     * Int32
     *)
    structure Int32 =
      struct
        type t = LargeInt.int
        val null = 0
        structure C = C.Int32
        structure PolyML = PolyML.Int32
      end


    (**
     * UInt32
     *)
    structure UInt32 =
      struct
        type t = LargeInt.int
        val null = 0
        structure C = C.UInt32
        structure PolyML = PolyML.UInt32
      end


    (**
     * Int64
     *)
    structure Int64 =
      struct
        type t = LargeInt.int
        val null = 0
        structure C = C.Int64
        structure PolyML = PolyML.Int64
      end


    (**
     * UInt64
     *)
    structure UInt64 =
      struct
        type t = LargeInt.int
        val null = 0
        structure C = C.UInt64
        structure PolyML = PolyML.UInt64
      end


    (**
     * SSize
     *)
    structure SSize =
      struct
        type t = LargeInt.int
        val null = 0
        structure C = C.SSize
        structure PolyML = PolyML.SSize
      end


    (**
     * Size
     *)
    structure Size =
      struct
        type t = LargeInt.int
        val null = 0
        structure C = C.Size
        structure PolyML = PolyML.Size
      end


    (**
     * Float
     *)
    structure Float =
      struct
        type t = real
        val null = 0.0
        structure C = C.Float
        structure PolyML = PolyML.Float
      end


    (**
     * Double
     *)
    structure Double =
      struct
        type t = real
        val null = 0.0
        structure C = C.Double
        structure PolyML = PolyML.Double
      end

  end

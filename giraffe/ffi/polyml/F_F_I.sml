signature F_F_I =
  sig
    structure PolyML :
      sig
        val VOID : unit CInterface.Conversion
      end
    structure Flags : F_F_I_FLAGS_ENUM where type t = Word32.word
    structure Enum : F_F_I_FLAGS_ENUM where type t = Int32.int
    structure Pointer : F_F_I_SCALAR where type t = CPointer.notnull CPointer.t
    structure OptPointer : F_F_I_SCALAR where type t = unit CPointer.t
    structure Char : F_F_I_SCALAR where type t = char
    structure Short : F_F_I_SCALAR where type t = LargeInt.int
    structure UShort : F_F_I_SCALAR where type t = LargeInt.int
    structure Int : F_F_I_SCALAR where type t = LargeInt.int
    structure UInt : F_F_I_SCALAR where type t = LargeInt.int
    structure Long : F_F_I_SCALAR where type t = LargeInt.int
    structure ULong : F_F_I_SCALAR where type t = LargeInt.int
    structure Bool : F_F_I_SCALAR where type t = bool
    structure Int8 : F_F_I_SCALAR where type t = LargeInt.int
    structure UInt8 : F_F_I_SCALAR where type t = LargeInt.int
    structure Int16 : F_F_I_SCALAR where type t = LargeInt.int
    structure UInt16 : F_F_I_SCALAR where type t = LargeInt.int
    structure Int32 : F_F_I_SCALAR where type t = LargeInt.int
    structure UInt32 : F_F_I_SCALAR where type t = LargeInt.int
    structure Int64 : F_F_I_SCALAR where type t = LargeInt.int
    structure UInt64 : F_F_I_SCALAR where type t = LargeInt.int
    structure Size : F_F_I_SCALAR where type t = LargeInt.int
    structure SSize : F_F_I_SCALAR where type t = LargeInt.int
    structure Float : F_F_I_SCALAR where type t = real
    structure Double : F_F_I_SCALAR where type t = real
    structure String : F_F_I_ARRAY where type t = string
    structure StringVector : F_F_I_ARRAY where type t = string list
  end

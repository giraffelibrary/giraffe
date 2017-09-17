structure GIRepositoryTypeTag :> G_I_REPOSITORY_TYPE_TAG =
  struct
    datatype enum =
      VOID
    | BOOLEAN
    | INT8
    | UINT8
    | INT16
    | UINT16
    | INT32
    | UINT32
    | INT64
    | UINT64
    | FLOAT
    | DOUBLE
    | GTYPE
    | UTF8
    | FILENAME
    | ARRAY
    | INTERFACE
    | GLIST
    | GSLIST
    | GHASH
    | ERROR
    | UNICHAR
    structure Enum =
      Enum(
        type enum = enum
        val null = VOID
        val toInt =
          fn
            VOID => 0
          | BOOLEAN => 1
          | INT8 => 2
          | UINT8 => 3
          | INT16 => 4
          | UINT16 => 5
          | INT32 => 6
          | UINT32 => 7
          | INT64 => 8
          | UINT64 => 9
          | FLOAT => 10
          | DOUBLE => 11
          | GTYPE => 12
          | UTF8 => 13
          | FILENAME => 14
          | ARRAY => 15
          | INTERFACE => 16
          | GLIST => 17
          | GSLIST => 18
          | GHASH => 19
          | ERROR => 20
          | UNICHAR => 21
        exception Value of GInt.t
        val fromInt =
          fn
            0 => VOID
          | 1 => BOOLEAN
          | 2 => INT8
          | 3 => UINT8
          | 4 => INT16
          | 5 => UINT16
          | 6 => INT32
          | 7 => UINT32
          | 8 => INT64
          | 9 => UINT64
          | 10 => FLOAT
          | 11 => DOUBLE
          | 12 => GTYPE
          | 13 => UTF8
          | 14 => FILENAME
          | 15 => ARRAY
          | 16 => INTERFACE
          | 17 => GLIST
          | 18 => GSLIST
          | 19 => GHASH
          | 20 => ERROR
          | 21 => UNICHAR
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val toString_ = call (getSymbol "g_type_tag_to_string") (PolyML.cVal --> Utf8.PolyML.cOutPtr)
    end
    fun toString type' = (FFI.withVal ---> Utf8.FFI.fromPtr 0) toString_ type'
  end

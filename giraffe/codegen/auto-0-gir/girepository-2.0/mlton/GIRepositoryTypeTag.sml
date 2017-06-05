structure GIRepositoryTypeTag :> G_I_REPOSITORY_TYPE_TAG =
  struct
    datatype enum =
      VOID
    | BOOLEAN
    | INT_8
    | UINT_8
    | INT_16
    | UINT_16
    | INT_32
    | UINT_32
    | INT_64
    | UINT_64
    | FLOAT
    | DOUBLE
    | GTYPE
    | UTF_8
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
          | INT_8 => 2
          | UINT_8 => 3
          | INT_16 => 4
          | UINT_16 => 5
          | INT_32 => 6
          | UINT_32 => 7
          | INT_64 => 8
          | UINT_64 => 9
          | FLOAT => 10
          | DOUBLE => 11
          | GTYPE => 12
          | UTF_8 => 13
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
          | 2 => INT_8
          | 3 => UINT_8
          | 4 => INT_16
          | 5 => UINT_16
          | 6 => INT_32
          | 7 => UINT_32
          | 8 => INT_64
          | 9 => UINT_64
          | 10 => FLOAT
          | 11 => DOUBLE
          | 12 => GTYPE
          | 13 => UTF_8
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
  end

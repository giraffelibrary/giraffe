structure PangoBidiType :>
  sig
    include PANGO_BIDI_TYPE
  end =
  struct
    datatype t =
      L
    | LRE
    | LRO
    | R
    | AL
    | RLE
    | RLO
    | PDF
    | EN
    | ES
    | ET
    | AN
    | CS
    | NSM
    | BN
    | B
    | S
    | WS
    | ON
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            L => f 0
          | LRE => f 1
          | LRO => f 2
          | R => f 3
          | AL => f 4
          | RLE => f 5
          | RLO => f 6
          | PDF => f 7
          | EN => f 8
          | ES => f 9
          | ET => f 10
          | AN => f 11
          | CS => f 12
          | NSM => f 13
          | BN => f 14
          | B => f 15
          | S => f 16
          | WS => f 17
          | ON => f 18
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => L
          | 1 => LRE
          | 2 => LRO
          | 3 => R
          | 4 => AL
          | 5 => RLE
          | 6 => RLO
          | 7 => PDF
          | 8 => EN
          | 9 => ES
          | 10 => ET
          | 11 => AN
          | 12 => CS
          | 13 => NSM
          | 14 => BN
          | 15 => B
          | 16 => S
          | 17 => WS
          | 18 => ON
          | n => raise Value n
      end
    val getType_ = _import "pango_bidi_type_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = L
    val forUnichar_ = _import "pango_bidi_type_for_unichar" : FFI.Char.val_ -> C.val_;
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun forUnichar ch = (FFI.Char.withVal ---> C.fromVal) forUnichar_ ch
  end

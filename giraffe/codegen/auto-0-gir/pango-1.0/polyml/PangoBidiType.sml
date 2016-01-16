structure PangoBidiType :>
  sig
    include PANGO_BIDI_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ PolyMLFFI.conversion
        val REF : C.ref_ PolyMLFFI.conversion
      end
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
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
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
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
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
    structure PolyML =
      struct
        val VAL = FFI.Enum.PolyML.VAL
        val REF = FFI.Enum.PolyML.REF
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_bidi_type_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.PTR --> PolyML.VAL)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.PTR &&> PolyML.VAL --> FFI.PolyML.VOID)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = L
    local
      open PolyMLFFI
    in
      val forUnichar_ = call (load_sym libpango "pango_bidi_type_for_unichar") (FFI.Char.PolyML.VAL --> PolyML.VAL)
    end
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun forUnichar ch = (FFI.Char.C.withVal ---> C.fromVal) forUnichar_ ch
  end

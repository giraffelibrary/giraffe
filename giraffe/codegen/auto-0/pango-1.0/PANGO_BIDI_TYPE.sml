signature PANGO_BIDI_TYPE =
  sig
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
    val null : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
    val forUnichar : char -> t
    structure C :
      sig
        type val_
        type ref_
        val withVal :
          (val_ -> 'a)
           -> t
           -> 'a
        val withRefVal :
          (ref_ -> 'a)
           -> t
           -> (val_, 'a) pair
        val fromVal : val_ -> t
        exception Value of FFI.Enum.val_
      end
  end

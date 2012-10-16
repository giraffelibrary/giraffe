signature ATK_RELATION_TYPE =
  sig
    datatype t =
      NULL
    | CONTROLLEDBY
    | CONTROLLERFOR
    | LABELFOR
    | LABELLEDBY
    | MEMBEROF
    | NODECHILDOF
    | FLOWSTO
    | FLOWSFROM
    | SUBWINDOWOF
    | EMBEDS
    | EMBEDDEDBY
    | POPUPFOR
    | PARENTWINDOWOF
    | DESCRIBEDBY
    | DESCRIPTIONFOR
    | NODEPARENTOF
    | LASTDEFINED
    val null : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
    val forName : string -> t
    val getName : t -> string
    val register : string -> t
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

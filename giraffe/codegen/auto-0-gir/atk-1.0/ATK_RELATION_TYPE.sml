signature ATK_RELATION_TYPE =
  sig
    datatype t =
      NULL
    | CONTROLLED_BY
    | CONTROLLER_FOR
    | LABEL_FOR
    | LABELLED_BY
    | MEMBER_OF
    | NODE_CHILD_OF
    | FLOWS_TO
    | FLOWS_FROM
    | SUBWINDOW_OF
    | EMBEDS
    | EMBEDDED_BY
    | POPUP_FOR
    | PARENT_WINDOW_OF
    | DESCRIBED_BY
    | DESCRIPTION_FOR
    | NODE_PARENT_OF
    | LAST_DEFINED
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
        exception Value of FFI.Enum.C.val_
      end
  end

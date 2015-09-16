signature ATK_STATE_TYPE =
  sig
    datatype t =
      INVALID
    | ACTIVE
    | ARMED
    | BUSY
    | CHECKED
    | DEFUNCT
    | EDITABLE
    | ENABLED
    | EXPANDABLE
    | EXPANDED
    | FOCUSABLE
    | FOCUSED
    | HORIZONTAL
    | ICONIFIED
    | MODAL
    | MULTI_LINE
    | MULTISELECTABLE
    | OPAQUE
    | PRESSED
    | RESIZABLE
    | SELECTABLE
    | SELECTED
    | SENSITIVE
    | SHOWING
    | SINGLE_LINE
    | STALE
    | TRANSIENT
    | VERTICAL
    | VISIBLE
    | MANAGES_DESCENDANTS
    | INDETERMINATE
    | TRUNCATED
    | REQUIRED
    | INVALID_ENTRY
    | SUPPORTS_AUTOCOMPLETION
    | SELECTABLE_TEXT
    | DEFAULT
    | ANIMATED
    | VISITED
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

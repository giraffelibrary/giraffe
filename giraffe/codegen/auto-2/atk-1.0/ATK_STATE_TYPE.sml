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
    | MULTILINE
    | MULTISELECTABLE
    | OPAQUE
    | PRESSED
    | RESIZABLE
    | SELECTABLE
    | SELECTED
    | SENSITIVE
    | SHOWING
    | SINGLELINE
    | STALE
    | TRANSIENT
    | VERTICAL
    | VISIBLE
    | MANAGESDESCENDANTS
    | INDETERMINATE
    | TRUNCATED
    | REQUIRED
    | INVALIDENTRY
    | SUPPORTSAUTOCOMPLETION
    | SELECTABLETEXT
    | DEFAULT
    | ANIMATED
    | VISITED
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
        exception Value of FFI.Enum.C.val_
      end
  end

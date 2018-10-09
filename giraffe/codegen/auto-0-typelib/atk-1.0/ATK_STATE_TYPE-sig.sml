signature ATK_STATE_TYPE =
  sig
    datatype enum =
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
    | CHECKABLE
    | HAS_POPUP
    | HAS_TOOLTIP
    | READ_ONLY
    | LAST_DEFINED
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
    val forName : string -> t
    val getName : t -> string
    val register : string -> t
  end

signature GDK_MODIFIER_INTENT =
  sig
    datatype enum =
      PRIMARY_ACCELERATOR
    | CONTEXT_MENU
    | EXTEND_SELECTION
    | MODIFY_SELECTION
    | NO_TEXT_INPUT
    | SHIFT_GROUP
    | DEFAULT_MOD_MASK
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end

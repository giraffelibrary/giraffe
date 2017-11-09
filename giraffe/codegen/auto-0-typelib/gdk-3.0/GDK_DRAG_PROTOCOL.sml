signature GDK_DRAG_PROTOCOL =
  sig
    datatype enum =
      NONE
    | MOTIF
    | XDND
    | ROOTWIN
    | WIN_32_DROPFILES
    | OLE_2
    | LOCAL
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end

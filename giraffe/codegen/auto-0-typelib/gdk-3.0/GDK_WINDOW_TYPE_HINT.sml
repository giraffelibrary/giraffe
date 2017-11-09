signature GDK_WINDOW_TYPE_HINT =
  sig
    datatype enum =
      NORMAL
    | DIALOG
    | MENU
    | TOOLBAR
    | SPLASHSCREEN
    | UTILITY
    | DOCK
    | DESKTOP
    | DROPDOWN_MENU
    | POPUP_MENU
    | TOOLTIP
    | NOTIFICATION
    | COMBO
    | DND
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end

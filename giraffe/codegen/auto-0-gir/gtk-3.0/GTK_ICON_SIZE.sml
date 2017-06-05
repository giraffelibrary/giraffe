signature GTK_ICON_SIZE =
  sig
    datatype enum =
      INVALID
    | MENU
    | SMALL_TOOLBAR
    | LARGE_TOOLBAR
    | BUTTON
    | DND
    | DIALOG
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    type 'a settings_class
    val getType : unit -> GObject.Type.t
    val fromName : string -> LargeInt.int
    val getName : LargeInt.int -> string
    val lookup : LargeInt.int -> (LargeInt.int * LargeInt.int) option
    val lookupForSettings :
      'a settings_class
       -> LargeInt.int
       -> (LargeInt.int * LargeInt.int) option
    val register :
      string
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
    val registerAlias :
      string
       -> LargeInt.int
       -> unit
  end

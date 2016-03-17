signature GDK_APP_LAUNCH_CONTEXT =
  sig
    type 'a class
    type 'a screen_class
    type 'a display_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val setDesktop :
      'a class
       -> LargeInt.int
       -> unit
    val setIcon :
      'a class
       -> 'b Gio.IconClass.class option
       -> unit
    val setIconName :
      'a class
       -> string option
       -> unit
    val setScreen :
      'a class
       -> 'b screen_class
       -> unit
    val setTimestamp :
      'a class
       -> LargeInt.int
       -> unit
    val displayProp : ('a class, base display_class option, 'b display_class option) Property.readwrite
  end

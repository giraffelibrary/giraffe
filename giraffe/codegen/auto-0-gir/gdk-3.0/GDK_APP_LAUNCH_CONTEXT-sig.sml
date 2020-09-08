signature GDK_APP_LAUNCH_CONTEXT =
  sig
    type 'a class
    type 'a screen_class
    type 'a display_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val setDesktop :
      'a class
       -> LargeInt.int
       -> unit
    val setDisplay :
      'a class
       -> 'b display_class
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
    val displayProp : ('a class, unit -> base display_class option, unit, 'b display_class option -> unit) Property.t
  end

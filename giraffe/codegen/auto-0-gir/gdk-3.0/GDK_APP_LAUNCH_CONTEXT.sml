signature GDK_APP_LAUNCH_CONTEXT =
  sig
    type 'a class_t
    type 'a screen_class_t
    type 'a display_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val setDesktop :
      'a class_t
       -> LargeInt.int
       -> unit
    val setIcon :
      'a class_t
       -> 'b Gio.IconClass.t option
       -> unit
    val setIconName :
      'a class_t
       -> string option
       -> unit
    val setScreen :
      'a class_t
       -> 'b screen_class_t
       -> unit
    val setTimestamp :
      'a class_t
       -> LargeInt.int
       -> unit
    val displayProp : ('a class_t, base display_class_t option, 'b display_class_t option) Property.readwrite
  end

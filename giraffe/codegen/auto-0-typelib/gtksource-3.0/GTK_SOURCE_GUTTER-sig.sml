signature GTK_SOURCE_GUTTER =
  sig
    type 'a class
    type 'a gutter_renderer_class
    type 'a view_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getRendererAtPos :
      'a class
       -> LargeInt.int * LargeInt.int
       -> base gutter_renderer_class option
    val getWindow : 'a class -> base Gdk.WindowClass.class
    val insert :
      'a class
       -> 'b gutter_renderer_class * LargeInt.int
       -> bool
    val queueDraw : 'a class -> unit
    val remove :
      'a class
       -> 'b gutter_renderer_class
       -> unit
    val reorder :
      'a class
       -> 'b gutter_renderer_class * LargeInt.int
       -> unit
    val setPadding :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val viewProp : ('a class, unit -> base view_class option, unit, 'b view_class option -> unit) Property.t
    val windowTypeProp : ('a class, unit -> Gtk.TextWindowType.t, unit, Gtk.TextWindowType.t -> unit) Property.t
    val xpadProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val ypadProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
  end

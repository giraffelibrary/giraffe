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
       -> base gutter_renderer_class
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
    val viewProp : ('a class, base view_class option, 'b view_class option) Property.readwrite
    val windowTypeProp : ('a class, Gtk.TextWindowType.t, Gtk.TextWindowType.t) Property.readwrite
    val xpadProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val ypadProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
  end

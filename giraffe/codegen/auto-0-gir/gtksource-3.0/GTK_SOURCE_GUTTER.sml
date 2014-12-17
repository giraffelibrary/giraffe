signature GTK_SOURCE_GUTTER =
  sig
    type 'a class_t
    type 'a gutterrendererclass_t
    type 'a viewclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getRendererAtPos :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> base gutterrendererclass_t
    val getWindow : 'a class_t -> base Gdk.WindowClass.t
    val insert :
      'a class_t
       -> 'b gutterrendererclass_t
       -> LargeInt.int
       -> bool
    val queueDraw : 'a class_t -> unit
    val remove :
      'a class_t
       -> 'b gutterrendererclass_t
       -> unit
    val reorder :
      'a class_t
       -> 'b gutterrendererclass_t
       -> LargeInt.int
       -> unit
    val setPadding :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val viewProp : ('a class_t, base viewclass_t option, 'b viewclass_t option) Property.readwrite
    val windowTypeProp : ('a class_t, Gtk.TextWindowType.t, Gtk.TextWindowType.t) Property.readwrite
    val xpadProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val ypadProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end

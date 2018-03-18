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
    val viewProp :
      {
        get : 'a class -> base view_class option,
        new : 'b view_class option -> 'a class Property.t
      }
    val windowTypeProp :
      {
        get : 'a class -> Gtk.TextWindowType.t,
        new : Gtk.TextWindowType.t -> 'a class Property.t
      }
    val xpadProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val ypadProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
  end

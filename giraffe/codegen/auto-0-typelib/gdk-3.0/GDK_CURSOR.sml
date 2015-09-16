signature GDK_CURSOR =
  sig
    type 'a class_t
    type cursor_type_t
    type 'a display_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : cursor_type_t -> base class_t
    val newForDisplay :
      'a display_class_t
       -> cursor_type_t
       -> base class_t
    val newFromName :
      'a display_class_t
       -> string
       -> base class_t
    val newFromPixbuf :
      'a display_class_t
       -> 'b GdkPixbuf.PixbufClass.t
       -> LargeInt.int
       -> LargeInt.int
       -> base class_t
    val getCursorType : 'a class_t -> cursor_type_t
    val getDisplay : 'a class_t -> base display_class_t
    val getImage : 'a class_t -> base GdkPixbuf.PixbufClass.t
    val cursorTypeProp : ('a class_t, cursor_type_t, cursor_type_t) Property.readwrite
    val displayProp : ('a class_t, base display_class_t option, 'b display_class_t option) Property.readwrite
  end

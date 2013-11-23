signature GDK_CURSOR =
  sig
    type 'a class_t
    type 'a displayclass_t
    type cursortype_t
    val getType : unit -> GObject.Type.t
    val new : cursortype_t -> base class_t
    val newForDisplay :
      'a displayclass_t
       -> cursortype_t
       -> base class_t
    val newFromName :
      'a displayclass_t
       -> string
       -> base class_t
    val newFromPixbuf :
      'a displayclass_t
       -> 'b GdkPixbuf.PixbufClass.t
       -> LargeInt.int
       -> LargeInt.int
       -> base class_t
    val getCursorType : 'a class_t -> cursortype_t
    val getDisplay : 'a class_t -> base displayclass_t
    val getImage : 'a class_t -> base GdkPixbuf.PixbufClass.t
    val cursorTypeProp : ('a class_t, cursortype_t, cursortype_t) Property.readwrite
    val displayProp : ('a class_t, base displayclass_t option, 'b displayclass_t option) Property.readwrite
  end

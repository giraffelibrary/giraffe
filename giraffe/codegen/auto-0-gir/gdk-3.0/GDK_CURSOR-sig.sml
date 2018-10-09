signature GDK_CURSOR =
  sig
    type 'a class
    type cursor_type_t
    type 'a display_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : cursor_type_t -> base class
    val newForDisplay : 'a display_class * cursor_type_t -> base class
    val newFromName : 'a display_class * string -> base class option
    val newFromPixbuf :
      'a display_class
       * 'b GdkPixbuf.PixbufClass.class
       * LargeInt.int
       * LargeInt.int
       -> base class
    val newFromSurface :
      'a display_class
       * Cairo.SurfaceRecord.t
       * real
       * real
       -> base class
    val getCursorType : 'a class -> cursor_type_t
    val getDisplay : 'a class -> base display_class
    val getImage : 'a class -> base GdkPixbuf.PixbufClass.class option
    val getSurface :
      'a class
       -> Cairo.SurfaceRecord.t option
           * real
           * real
    val cursorTypeProp :
      {
        get : 'a class -> cursor_type_t,
        new : cursor_type_t -> 'a class Property.t
      }
    val displayProp :
      {
        get : 'a class -> base display_class option,
        new : 'b display_class option -> 'a class Property.t
      }
  end

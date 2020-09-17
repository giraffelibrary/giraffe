structure GtkTextMark :>
  GTK_TEXT_MARK
    where type 'a class = 'a GtkTextMarkClass.class
    where type 'a text_buffer_class = 'a GtkTextBufferClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_text_mark_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_text_mark_new") (Utf8.PolyML.cInOptPtr &&> GBool.PolyML.cVal --> GtkTextMarkClass.PolyML.cPtr)
      val getBuffer_ = call (getSymbol "gtk_text_mark_get_buffer") (GtkTextMarkClass.PolyML.cPtr --> GtkTextBufferClass.PolyML.cPtr)
      val getDeleted_ = call (getSymbol "gtk_text_mark_get_deleted") (GtkTextMarkClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getLeftGravity_ = call (getSymbol "gtk_text_mark_get_left_gravity") (GtkTextMarkClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getName_ = call (getSymbol "gtk_text_mark_get_name") (GtkTextMarkClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getVisible_ = call (getSymbol "gtk_text_mark_get_visible") (GtkTextMarkClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setVisible_ = call (getSymbol "gtk_text_mark_set_visible") (GtkTextMarkClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkTextMarkClass.class
    type 'a text_buffer_class = 'a GtkTextBufferClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (name, leftGravity) = (Utf8.FFI.withOptPtr 0 &&&> GBool.FFI.withVal ---> GtkTextMarkClass.FFI.fromPtr true) new_ (name & leftGravity)
    fun getBuffer self = (GtkTextMarkClass.FFI.withPtr false ---> GtkTextBufferClass.FFI.fromPtr false) getBuffer_ self before GtkTextMarkClass.FFI.touchPtr self
    fun getDeleted self = (GtkTextMarkClass.FFI.withPtr false ---> GBool.FFI.fromVal) getDeleted_ self
    fun getLeftGravity self = (GtkTextMarkClass.FFI.withPtr false ---> GBool.FFI.fromVal) getLeftGravity_ self
    fun getName self = (GtkTextMarkClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getName_ self before GtkTextMarkClass.FFI.touchPtr self
    fun getVisible self = (GtkTextMarkClass.FFI.withPtr false ---> GBool.FFI.fromVal) getVisible_ self
    fun setVisible self setting = (GtkTextMarkClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setVisible_ (self & setting)
    local
      open ValueAccessor
    in
      val leftGravityProp =
        {
          name = "left-gravity",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = fn x => C.set boolean x
        }
      val nameProp =
        {
          name = "name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
    end
  end

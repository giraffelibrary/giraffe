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
      val getName_ = call (getSymbol "gtk_text_mark_get_name") (GtkTextMarkClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getVisible_ = call (getSymbol "gtk_text_mark_get_visible") (GtkTextMarkClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setVisible_ = call (getSymbol "gtk_text_mark_set_visible") (GtkTextMarkClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkTextMarkClass.class
    type 'a text_buffer_class = 'a GtkTextBufferClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new name leftGravity = (Utf8.FFI.withOptPtr &&&> GBool.FFI.withVal ---> GtkTextMarkClass.FFI.fromPtr true) new_ (name & leftGravity)
    fun getBuffer self = (GtkTextMarkClass.FFI.withPtr ---> GtkTextBufferClass.FFI.fromPtr false) getBuffer_ self
    fun getDeleted self = (GtkTextMarkClass.FFI.withPtr ---> GBool.FFI.fromVal) getDeleted_ self
    fun getLeftGravity self = (GtkTextMarkClass.FFI.withPtr ---> GBool.FFI.fromVal) getLeftGravity_ self
    fun getName self = (GtkTextMarkClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getVisible self = (GtkTextMarkClass.FFI.withPtr ---> GBool.FFI.fromVal) getVisible_ self
    fun setVisible self setting = (GtkTextMarkClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setVisible_ (self & setting)
    local
      open Property
    in
      val leftGravityProp =
        {
          get = fn x => get "left-gravity" boolean x,
          set = fn x => set "left-gravity" boolean x
        }
      val nameProp =
        {
          get = fn x => get "name" stringOpt x,
          set = fn x => set "name" stringOpt x
        }
    end
  end

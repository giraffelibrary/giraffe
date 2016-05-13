structure GtkTextMark :>
  GTK_TEXT_MARK
    where type 'a class = 'a GtkTextMarkClass.class
    where type 'a text_buffer_class = 'a GtkTextBufferClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_text_mark_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_text_mark_new") (Utf8.PolyML.cInOptPtr &&> FFI.Bool.PolyML.cVal --> GtkTextMarkClass.PolyML.cPtr)
      val getBuffer_ = call (load_sym libgtk "gtk_text_mark_get_buffer") (GtkTextMarkClass.PolyML.cPtr --> GtkTextBufferClass.PolyML.cPtr)
      val getDeleted_ = call (load_sym libgtk "gtk_text_mark_get_deleted") (GtkTextMarkClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getLeftGravity_ = call (load_sym libgtk "gtk_text_mark_get_left_gravity") (GtkTextMarkClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getName_ = call (load_sym libgtk "gtk_text_mark_get_name") (GtkTextMarkClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getVisible_ = call (load_sym libgtk "gtk_text_mark_get_visible") (GtkTextMarkClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setVisible_ = call (load_sym libgtk "gtk_text_mark_set_visible") (GtkTextMarkClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkTextMarkClass.class
    type 'a text_buffer_class = 'a GtkTextBufferClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new name leftGravity = (Utf8.C.withOptPtr &&&> FFI.Bool.C.withVal ---> GtkTextMarkClass.C.fromPtr true) new_ (name & leftGravity)
    fun getBuffer self = (GtkTextMarkClass.C.withPtr ---> GtkTextBufferClass.C.fromPtr false) getBuffer_ self
    fun getDeleted self = (GtkTextMarkClass.C.withPtr ---> FFI.Bool.C.fromVal) getDeleted_ self
    fun getLeftGravity self = (GtkTextMarkClass.C.withPtr ---> FFI.Bool.C.fromVal) getLeftGravity_ self
    fun getName self = (GtkTextMarkClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun getVisible self = (GtkTextMarkClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisible_ self
    fun setVisible self setting = (GtkTextMarkClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVisible_ (self & setting)
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

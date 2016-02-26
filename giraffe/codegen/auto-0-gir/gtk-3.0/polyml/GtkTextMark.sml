structure GtkTextMark :>
  GTK_TEXT_MARK
    where type 'a class_t = 'a GtkTextMarkClass.t
    where type 'a text_buffer_class_t = 'a GtkTextBufferClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_text_mark_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_text_mark_new") (Utf8.PolyML.cInOptPtr &&> FFI.Bool.PolyML.cVal --> GObjectObjectClass.PolyML.cPtr)
      val getBuffer_ = call (load_sym libgtk "gtk_text_mark_get_buffer") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getDeleted_ = call (load_sym libgtk "gtk_text_mark_get_deleted") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getLeftGravity_ = call (load_sym libgtk "gtk_text_mark_get_left_gravity") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getName_ = call (load_sym libgtk "gtk_text_mark_get_name") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getVisible_ = call (load_sym libgtk "gtk_text_mark_get_visible") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setVisible_ = call (load_sym libgtk "gtk_text_mark_set_visible") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GtkTextMarkClass.t
    type 'a text_buffer_class_t = 'a GtkTextBufferClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new name leftGravity = (Utf8.C.withOptPtr &&&> FFI.Bool.C.withVal ---> GtkTextMarkClass.C.fromPtr true) new_ (name & leftGravity)
    fun getBuffer self = (GObjectObjectClass.C.withPtr ---> GtkTextBufferClass.C.fromPtr false) getBuffer_ self
    fun getDeleted self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getDeleted_ self
    fun getLeftGravity self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getLeftGravity_ self
    fun getName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun getVisible self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisible_ self
    fun setVisible self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVisible_ (self & setting)
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

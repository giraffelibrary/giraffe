structure GtkTextMark :>
  GTK_TEXT_MARK
    where type 'a class_t = 'a GtkTextMarkClass.t
    where type 'a textbufferclass_t = 'a GtkTextBufferClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_text_mark_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_text_mark_new") (FFI.PolyML.String.INOPTPTR &&> FFI.PolyML.Bool.VAL --> GObjectObjectClass.PolyML.PTR)
      val getBuffer_ = call (load_sym libgtk "gtk_text_mark_get_buffer") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getDeleted_ = call (load_sym libgtk "gtk_text_mark_get_deleted") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getLeftGravity_ = call (load_sym libgtk "gtk_text_mark_get_left_gravity") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getName_ = call (load_sym libgtk "gtk_text_mark_get_name") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getVisible_ = call (load_sym libgtk "gtk_text_mark_get_visible") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val setVisible_ = call (load_sym libgtk "gtk_text_mark_set_visible") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkTextMarkClass.t
    type 'a textbufferclass_t = 'a GtkTextBufferClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new name leftGravity = (FFI.String.withConstOptPtr &&&> FFI.Bool.withVal ---> GtkTextMarkClass.C.fromPtr true) new_ (name & leftGravity)
    fun getBuffer self = (GObjectObjectClass.C.withPtr ---> GtkTextBufferClass.C.fromPtr false) getBuffer_ self
    fun getDeleted self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getDeleted_ self
    fun getLeftGravity self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getLeftGravity_ self
    fun getName self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getName_ self
    fun getVisible self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getVisible_ self
    fun setVisible self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setVisible_ (self & setting)
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

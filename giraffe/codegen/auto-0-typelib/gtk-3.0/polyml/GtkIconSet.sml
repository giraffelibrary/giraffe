structure GtkIconSet :>
  GTK_ICON_SET
    where type t = GtkIconSetRecord.t
    where type icon_source_t = GtkIconSourceRecord.t
    where type 'a style_context_class = 'a GtkStyleContextClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_icon_set_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_icon_set_new") (PolyMLFFI.cVoid --> GtkIconSetRecord.PolyML.cPtr)
      val newFromPixbuf_ = call (load_sym libgtk "gtk_icon_set_new_from_pixbuf") (GdkPixbufPixbufClass.PolyML.cPtr --> GtkIconSetRecord.PolyML.cPtr)
      val addSource_ = call (load_sym libgtk "gtk_icon_set_add_source") (GtkIconSetRecord.PolyML.cPtr &&> GtkIconSourceRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val copy_ = call (load_sym libgtk "gtk_icon_set_copy") (GtkIconSetRecord.PolyML.cPtr --> GtkIconSetRecord.PolyML.cPtr)
      val renderIconPixbuf_ =
        call (load_sym libgtk "gtk_icon_set_render_icon_pixbuf")
          (
            GtkIconSetRecord.PolyML.cPtr
             &&> GtkStyleContextClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             --> GdkPixbufPixbufClass.PolyML.cPtr
          )
    end
    type t = GtkIconSetRecord.t
    type icon_source_t = GtkIconSourceRecord.t
    type 'a style_context_class = 'a GtkStyleContextClass.class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkIconSetRecord.C.fromPtr true) new_ ()
    fun newFromPixbuf pixbuf = (GdkPixbufPixbufClass.C.withPtr ---> GtkIconSetRecord.C.fromPtr true) newFromPixbuf_ pixbuf
    fun addSource self source = (GtkIconSetRecord.C.withPtr &&&> GtkIconSourceRecord.C.withPtr ---> I) addSource_ (self & source)
    fun copy self = (GtkIconSetRecord.C.withPtr ---> GtkIconSetRecord.C.fromPtr true) copy_ self
    fun renderIconPixbuf self context size =
      (
        GtkIconSetRecord.C.withPtr
         &&&> GtkStyleContextClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         ---> GdkPixbufPixbufClass.C.fromPtr true
      )
        renderIconPixbuf_
        (
          self
           & context
           & size
        )
  end

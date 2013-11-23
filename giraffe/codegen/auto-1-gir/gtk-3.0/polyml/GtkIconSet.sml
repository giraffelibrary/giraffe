structure GtkIconSet :>
  GTK_ICON_SET
    where type record_t = GtkIconSetRecord.t
    where type iconsourcerecord_t = GtkIconSourceRecord.t
    where type 'a stylecontextclass_t = 'a GtkStyleContextClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_icon_set_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_icon_set_new") (FFI.PolyML.VOID --> GtkIconSetRecord.PolyML.PTR)
      val newFromPixbuf_ = call (load_sym libgtk "gtk_icon_set_new_from_pixbuf") (GObjectObjectClass.PolyML.PTR --> GtkIconSetRecord.PolyML.PTR)
      val addSource_ = call (load_sym libgtk "gtk_icon_set_add_source") (GtkIconSetRecord.PolyML.PTR &&> GtkIconSourceRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val copy_ = call (load_sym libgtk "gtk_icon_set_copy") (GtkIconSetRecord.PolyML.PTR --> GtkIconSetRecord.PolyML.PTR)
      val renderIconPixbuf_ =
        call (load_sym libgtk "gtk_icon_set_render_icon_pixbuf")
          (
            GtkIconSetRecord.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             --> GObjectObjectClass.PolyML.PTR
          )
    end
    type record_t = GtkIconSetRecord.t
    type iconsourcerecord_t = GtkIconSourceRecord.t
    type 'a stylecontextclass_t = 'a GtkStyleContextClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkIconSetRecord.C.fromPtr true) new_ ()
    fun newFromPixbuf pixbuf = (GObjectObjectClass.C.withPtr ---> GtkIconSetRecord.C.fromPtr true) newFromPixbuf_ pixbuf
    fun addSource self source = (GtkIconSetRecord.C.withPtr &&&> GtkIconSourceRecord.C.withPtr ---> I) addSource_ (self & source)
    fun copy self = (GtkIconSetRecord.C.withPtr ---> GtkIconSetRecord.C.fromPtr true) copy_ self
    fun renderIconPixbuf self context size =
      (
        GtkIconSetRecord.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> GdkPixbufPixbufClass.C.fromPtr true
      )
        renderIconPixbuf_
        (
          self
           & context
           & size
        )
  end

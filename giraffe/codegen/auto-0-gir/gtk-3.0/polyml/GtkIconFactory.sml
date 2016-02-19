structure GtkIconFactory :>
  GTK_ICON_FACTORY
    where type 'a class_t = 'a GtkIconFactoryClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type icon_set_record_t = GtkIconSetRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_icon_factory_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_icon_factory_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val lookupDefault_ = call (load_sym libgtk "gtk_icon_factory_lookup_default") (Utf8.PolyML.INPTR --> GtkIconSetRecord.PolyML.PTR)
      val add_ =
        call (load_sym libgtk "gtk_icon_factory_add")
          (
            GObjectObjectClass.PolyML.PTR
             &&> Utf8.PolyML.INPTR
             &&> GtkIconSetRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val addDefault_ = call (load_sym libgtk "gtk_icon_factory_add_default") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val lookup_ = call (load_sym libgtk "gtk_icon_factory_lookup") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> GtkIconSetRecord.PolyML.PTR)
      val removeDefault_ = call (load_sym libgtk "gtk_icon_factory_remove_default") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkIconFactoryClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type icon_set_record_t = GtkIconSetRecord.t
    type t = base class_t
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkIconFactoryClass.C.fromPtr true) new_ ()
    fun lookupDefault stockId = (Utf8.C.withPtr ---> GtkIconSetRecord.C.fromPtr false) lookupDefault_ stockId
    fun add self stockId iconSet =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GtkIconSetRecord.C.withPtr
         ---> I
      )
        add_
        (
          self
           & stockId
           & iconSet
        )
    fun addDefault self = (GObjectObjectClass.C.withPtr ---> I) addDefault_ self
    fun lookup self stockId = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> GtkIconSetRecord.C.fromPtr false) lookup_ (self & stockId)
    fun removeDefault self = (GObjectObjectClass.C.withPtr ---> I) removeDefault_ self
  end

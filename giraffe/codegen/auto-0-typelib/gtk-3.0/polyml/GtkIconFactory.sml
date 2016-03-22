structure GtkIconFactory :>
  GTK_ICON_FACTORY
    where type 'a class = 'a GtkIconFactoryClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type icon_set_t = GtkIconSetRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_icon_factory_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_icon_factory_new") (FFI.PolyML.cVoid --> GtkIconFactoryClass.PolyML.cPtr)
      val lookupDefault_ = call (load_sym libgtk "gtk_icon_factory_lookup_default") (Utf8.PolyML.cInPtr --> GtkIconSetRecord.PolyML.cPtr)
      val add_ =
        call (load_sym libgtk "gtk_icon_factory_add")
          (
            GtkIconFactoryClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkIconSetRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val addDefault_ = call (load_sym libgtk "gtk_icon_factory_add_default") (GtkIconFactoryClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val lookup_ = call (load_sym libgtk "gtk_icon_factory_lookup") (GtkIconFactoryClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GtkIconSetRecord.PolyML.cPtr)
      val removeDefault_ = call (load_sym libgtk "gtk_icon_factory_remove_default") (GtkIconFactoryClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkIconFactoryClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type icon_set_t = GtkIconSetRecord.t
    type t = base class
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkIconFactoryClass.C.fromPtr true) new_ ()
    fun lookupDefault stockId = (Utf8.C.withPtr ---> GtkIconSetRecord.C.fromPtr false) lookupDefault_ stockId
    fun add self stockId iconSet =
      (
        GtkIconFactoryClass.C.withPtr
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
    fun addDefault self = (GtkIconFactoryClass.C.withPtr ---> I) addDefault_ self
    fun lookup self stockId = (GtkIconFactoryClass.C.withPtr &&&> Utf8.C.withPtr ---> GtkIconSetRecord.C.fromPtr false) lookup_ (self & stockId)
    fun removeDefault self = (GtkIconFactoryClass.C.withPtr ---> I) removeDefault_ self
  end

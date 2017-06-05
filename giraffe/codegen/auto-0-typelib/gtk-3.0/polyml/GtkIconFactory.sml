structure GtkIconFactory :>
  GTK_ICON_FACTORY
    where type 'a class = 'a GtkIconFactoryClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type icon_set_t = GtkIconSetRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_icon_factory_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_icon_factory_new") (PolyMLFFI.cVoid --> GtkIconFactoryClass.PolyML.cPtr)
      val lookupDefault_ = call (load_sym libgtk "gtk_icon_factory_lookup_default") (Utf8.PolyML.cInPtr --> GtkIconSetRecord.PolyML.cPtr)
      val add_ =
        call (load_sym libgtk "gtk_icon_factory_add")
          (
            GtkIconFactoryClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkIconSetRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val addDefault_ = call (load_sym libgtk "gtk_icon_factory_add_default") (GtkIconFactoryClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val lookup_ = call (load_sym libgtk "gtk_icon_factory_lookup") (GtkIconFactoryClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GtkIconSetRecord.PolyML.cPtr)
      val removeDefault_ = call (load_sym libgtk "gtk_icon_factory_remove_default") (GtkIconFactoryClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkIconFactoryClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type icon_set_t = GtkIconSetRecord.t
    type t = base class
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkIconFactoryClass.FFI.fromPtr true) new_ ()
    fun lookupDefault stockId = (Utf8.FFI.withPtr ---> GtkIconSetRecord.FFI.fromPtr false) lookupDefault_ stockId
    fun add self stockId iconSet =
      (
        GtkIconFactoryClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GtkIconSetRecord.FFI.withPtr
         ---> I
      )
        add_
        (
          self
           & stockId
           & iconSet
        )
    fun addDefault self = (GtkIconFactoryClass.FFI.withPtr ---> I) addDefault_ self
    fun lookup self stockId = (GtkIconFactoryClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GtkIconSetRecord.FFI.fromPtr false) lookup_ (self & stockId)
    fun removeDefault self = (GtkIconFactoryClass.FFI.withPtr ---> I) removeDefault_ self
  end

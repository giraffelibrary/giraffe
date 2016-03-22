structure GtkIconFactory :>
  GTK_ICON_FACTORY
    where type 'a class = 'a GtkIconFactoryClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type icon_set_t = GtkIconSetRecord.t =
  struct
    val getType_ = _import "gtk_icon_factory_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_icon_factory_new" : unit -> GtkIconFactoryClass.C.notnull GtkIconFactoryClass.C.p;
    val lookupDefault_ = _import "mlton_gtk_icon_factory_lookup_default" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GtkIconSetRecord.C.notnull GtkIconSetRecord.C.p;
    val add_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_icon_factory_add" :
              GtkIconFactoryClass.C.notnull GtkIconFactoryClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GtkIconSetRecord.C.notnull GtkIconSetRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val addDefault_ = _import "gtk_icon_factory_add_default" : GtkIconFactoryClass.C.notnull GtkIconFactoryClass.C.p -> unit;
    val lookup_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_icon_factory_lookup" :
              GtkIconFactoryClass.C.notnull GtkIconFactoryClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GtkIconSetRecord.C.notnull GtkIconSetRecord.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val removeDefault_ = _import "gtk_icon_factory_remove_default" : GtkIconFactoryClass.C.notnull GtkIconFactoryClass.C.p -> unit;
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

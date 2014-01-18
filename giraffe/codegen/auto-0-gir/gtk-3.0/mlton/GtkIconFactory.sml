structure GtkIconFactory :>
  GTK_ICON_FACTORY
    where type 'a class_t = 'a GtkIconFactoryClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type iconsetrecord_t = GtkIconSetRecord.t =
  struct
    val getType_ = _import "gtk_icon_factory_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_icon_factory_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val lookupDefault_ = _import "mlton_gtk_icon_factory_lookup_default" : cstring * unit CPointer.t -> GtkIconSetRecord.C.notnull GtkIconSetRecord.C.p;
    val add_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_icon_factory_add" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * GtkIconSetRecord.C.notnull GtkIconSetRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val addDefault_ = _import "gtk_icon_factory_add_default" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val lookup_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_icon_factory_lookup" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> GtkIconSetRecord.C.notnull GtkIconSetRecord.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val removeDefault_ = _import "gtk_icon_factory_remove_default" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    type 'a class_t = 'a GtkIconFactoryClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type iconsetrecord_t = GtkIconSetRecord.t
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkIconFactoryClass.C.fromPtr true) new_ ()
    fun lookupDefault stockId = (FFI.String.C.withConstPtr ---> GtkIconSetRecord.C.fromPtr false) lookupDefault_ stockId
    fun add self stockId iconSet =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
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
    fun lookup self stockId = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GtkIconSetRecord.C.fromPtr false) lookup_ (self & stockId)
    fun removeDefault self = (GObjectObjectClass.C.withPtr ---> I) removeDefault_ self
  end
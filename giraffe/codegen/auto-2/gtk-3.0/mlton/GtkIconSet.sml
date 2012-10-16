structure GtkIconSet :>
  GTK_ICON_SET
    where type record_t = GtkIconSetRecord.t
    where type iconsourcerecord_t = GtkIconSourceRecord.t
    where type 'a stylecontextclass_t = 'a GtkStyleContextClass.t =
  struct
    val getType_ = _import "gtk_icon_set_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_icon_set_new" : unit -> GtkIconSetRecord.C.notnull GtkIconSetRecord.C.p;
    val newFromPixbuf_ = _import "gtk_icon_set_new_from_pixbuf" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkIconSetRecord.C.notnull GtkIconSetRecord.C.p;
    val addSource_ = fn x1 & x2 => (_import "gtk_icon_set_add_source" : GtkIconSetRecord.C.notnull GtkIconSetRecord.C.p * GtkIconSourceRecord.C.notnull GtkIconSourceRecord.C.p -> unit;) (x1, x2)
    val copy_ = _import "gtk_icon_set_copy" : GtkIconSetRecord.C.notnull GtkIconSetRecord.C.p -> GtkIconSetRecord.C.notnull GtkIconSetRecord.C.p;
    val renderIconPixbuf_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_icon_set_render_icon_pixbuf" :
              GtkIconSetRecord.C.notnull GtkIconSetRecord.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
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
         &&&> FFI.Int32.withVal
         ---> GdkPixbufPixbufClass.C.fromPtr true
      )
        renderIconPixbuf_
        (
          self
           & context
           & size
        )
  end

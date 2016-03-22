structure GtkIconSet :>
  GTK_ICON_SET
    where type t = GtkIconSetRecord.t
    where type icon_source_t = GtkIconSourceRecord.t
    where type 'a style_context_class = 'a GtkStyleContextClass.class =
  struct
    val getType_ = _import "gtk_icon_set_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_icon_set_new" : unit -> GtkIconSetRecord.C.notnull GtkIconSetRecord.C.p;
    val newFromPixbuf_ = _import "gtk_icon_set_new_from_pixbuf" : GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p -> GtkIconSetRecord.C.notnull GtkIconSetRecord.C.p;
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
               * GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p
               * FFI.Int32.C.val_
               -> GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
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

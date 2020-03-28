structure GtkIconSet :>
  GTK_ICON_SET
    where type t = GtkIconSetRecord.t
    where type icon_source_t = GtkIconSourceRecord.t
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type state_type_t = GtkStateType.t
    where type text_direction_t = GtkTextDirection.t
    where type 'a style_class = 'a GtkStyleClass.class
    where type 'a style_context_class = 'a GtkStyleContextClass.class =
  struct
    val getType_ = _import "gtk_icon_set_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_icon_set_new" : unit -> GtkIconSetRecord.FFI.notnull GtkIconSetRecord.FFI.p;
    val newFromPixbuf_ = _import "gtk_icon_set_new_from_pixbuf" : GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p -> GtkIconSetRecord.FFI.notnull GtkIconSetRecord.FFI.p;
    val addSource_ = fn x1 & x2 => (_import "gtk_icon_set_add_source" : GtkIconSetRecord.FFI.notnull GtkIconSetRecord.FFI.p * GtkIconSourceRecord.FFI.notnull GtkIconSourceRecord.FFI.p -> unit;) (x1, x2)
    val copy_ = _import "gtk_icon_set_copy" : GtkIconSetRecord.FFI.notnull GtkIconSetRecord.FFI.p -> GtkIconSetRecord.FFI.notnull GtkIconSetRecord.FFI.p;
    val getSizes_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_icon_set_get_sizes" :
              GtkIconSetRecord.FFI.notnull GtkIconSetRecord.FFI.p
               * GInt32CArrayN.MLton.r1
               * (unit, GInt32CArrayN.FFI.notnull) GInt32CArrayN.MLton.r2
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val renderIcon_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & (x7, x8) =>
          (
            _import "mlton_gtk_icon_set_render_icon" :
              GtkIconSetRecord.FFI.notnull GtkIconSetRecord.FFI.p
               * unit GtkStyleClass.FFI.p
               * GtkTextDirection.FFI.val_
               * GtkStateType.FFI.val_
               * GInt32.FFI.val_
               * unit GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val renderIconPixbuf_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_icon_set_render_icon_pixbuf" :
              GtkIconSetRecord.FFI.notnull GtkIconSetRecord.FFI.p
               * GtkStyleContextClass.FFI.notnull GtkStyleContextClass.FFI.p
               * GInt32.FFI.val_
               -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val renderIconSurface_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_icon_set_render_icon_surface" :
              GtkIconSetRecord.FFI.notnull GtkIconSetRecord.FFI.p
               * GtkStyleContextClass.FFI.notnull GtkStyleContextClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * unit GdkWindowClass.FFI.p
               -> CairoSurfaceRecord.FFI.notnull CairoSurfaceRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    type t = GtkIconSetRecord.t
    type icon_source_t = GtkIconSourceRecord.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type state_type_t = GtkStateType.t
    type text_direction_t = GtkTextDirection.t
    type 'a style_class = 'a GtkStyleClass.class
    type 'a style_context_class = 'a GtkStyleContextClass.class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkIconSetRecord.FFI.fromPtr true) new_ ()
    fun newFromPixbuf pixbuf = (GdkPixbufPixbufClass.FFI.withPtr ---> GtkIconSetRecord.FFI.fromPtr true) newFromPixbuf_ pixbuf
    fun addSource self source = (GtkIconSetRecord.FFI.withPtr &&&> GtkIconSourceRecord.FFI.withPtr ---> I) addSource_ (self & source)
    fun copy self = (GtkIconSetRecord.FFI.withPtr ---> GtkIconSetRecord.FFI.fromPtr true) copy_ self
    fun getSizes self =
      let
        val sizes
         & nSizes
         & () =
          (
            GtkIconSetRecord.FFI.withPtr
             &&&> GInt32CArrayN.FFI.withRefOptPtr
             &&&> GInt32.FFI.withRefVal
             ---> GInt32CArrayN.FFI.fromPtr 1
                   && GInt32.FFI.fromVal
                   && I
          )
            getSizes_
            (
              self
               & NONE
               & GInt32.null
            )
      in
        sizes (LargeInt.toInt nSizes)
      end
    fun renderIcon
      self
      (
        style,
        direction,
        state,
        size,
        widget,
        detail
      ) =
      (
        GtkIconSetRecord.FFI.withPtr
         &&&> GtkStyleClass.FFI.withOptPtr
         &&&> GtkTextDirection.FFI.withVal
         &&&> GtkStateType.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GtkWidgetClass.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         ---> GdkPixbufPixbufClass.FFI.fromPtr true
      )
        renderIcon_
        (
          self
           & style
           & direction
           & state
           & size
           & widget
           & detail
        )
    fun renderIconPixbuf self (context, size) =
      (
        GtkIconSetRecord.FFI.withPtr
         &&&> GtkStyleContextClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         ---> GdkPixbufPixbufClass.FFI.fromPtr true
      )
        renderIconPixbuf_
        (
          self
           & context
           & size
        )
    fun renderIconSurface
      self
      (
        context,
        size,
        scale,
        forWindow
      ) =
      (
        GtkIconSetRecord.FFI.withPtr
         &&&> GtkStyleContextClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GdkWindowClass.FFI.withOptPtr
         ---> CairoSurfaceRecord.FFI.fromPtr true
      )
        renderIconSurface_
        (
          self
           & context
           & size
           & scale
           & forWindow
        )
  end

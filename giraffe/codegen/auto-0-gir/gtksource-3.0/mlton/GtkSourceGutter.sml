structure GtkSourceGutter :>
  GTK_SOURCE_GUTTER
    where type 'a class = 'a GtkSourceGutterClass.class
    where type 'a gutter_renderer_class = 'a GtkSourceGutterRendererClass.class
    where type 'a view_class = 'a GtkSourceViewClass.class =
  struct
    val getType_ = _import "gtk_source_gutter_get_type" : unit -> GObjectType.FFI.val_;
    val getRendererAtPos_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_gutter_get_renderer_at_pos" :
              GtkSourceGutterClass.FFI.notnull GtkSourceGutterClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> GtkSourceGutterRendererClass.FFI.notnull GtkSourceGutterRendererClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getWindow_ = _import "gtk_source_gutter_get_window" : GtkSourceGutterClass.FFI.notnull GtkSourceGutterClass.FFI.p -> GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p;
    val insert_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_gutter_insert" :
              GtkSourceGutterClass.FFI.notnull GtkSourceGutterClass.FFI.p
               * GtkSourceGutterRendererClass.FFI.notnull GtkSourceGutterRendererClass.FFI.p
               * GInt.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val queueDraw_ = _import "gtk_source_gutter_queue_draw" : GtkSourceGutterClass.FFI.notnull GtkSourceGutterClass.FFI.p -> unit;
    val remove_ = fn x1 & x2 => (_import "gtk_source_gutter_remove" : GtkSourceGutterClass.FFI.notnull GtkSourceGutterClass.FFI.p * GtkSourceGutterRendererClass.FFI.notnull GtkSourceGutterRendererClass.FFI.p -> unit;) (x1, x2)
    val reorder_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_gutter_reorder" :
              GtkSourceGutterClass.FFI.notnull GtkSourceGutterClass.FFI.p
               * GtkSourceGutterRendererClass.FFI.notnull GtkSourceGutterRendererClass.FFI.p
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPadding_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_gutter_set_padding" :
              GtkSourceGutterClass.FFI.notnull GtkSourceGutterClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkSourceGutterClass.class
    type 'a gutter_renderer_class = 'a GtkSourceGutterRendererClass.class
    type 'a view_class = 'a GtkSourceViewClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getRendererAtPos self x y =
      (
        GtkSourceGutterClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> GtkSourceGutterRendererClass.FFI.fromPtr false
      )
        getRendererAtPos_
        (
          self
           & x
           & y
        )
    fun getWindow self = (GtkSourceGutterClass.FFI.withPtr ---> GdkWindowClass.FFI.fromPtr false) getWindow_ self
    fun insert self renderer position =
      (
        GtkSourceGutterClass.FFI.withPtr
         &&&> GtkSourceGutterRendererClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        insert_
        (
          self
           & renderer
           & position
        )
    fun queueDraw self = (GtkSourceGutterClass.FFI.withPtr ---> I) queueDraw_ self
    fun remove self renderer = (GtkSourceGutterClass.FFI.withPtr &&&> GtkSourceGutterRendererClass.FFI.withPtr ---> I) remove_ (self & renderer)
    fun reorder self renderer position =
      (
        GtkSourceGutterClass.FFI.withPtr
         &&&> GtkSourceGutterRendererClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         ---> I
      )
        reorder_
        (
          self
           & renderer
           & position
        )
    fun setPadding self xpad ypad =
      (
        GtkSourceGutterClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        setPadding_
        (
          self
           & xpad
           & ypad
        )
    local
      open Property
    in
      val viewProp =
        {
          get = fn x => get "view" GtkSourceViewClass.tOpt x,
          set = fn x => set "view" GtkSourceViewClass.tOpt x
        }
      val windowTypeProp =
        {
          get = fn x => get "window-type" GtkTextWindowType.t x,
          set = fn x => set "window-type" GtkTextWindowType.t x
        }
      val xpadProp =
        {
          get = fn x => get "xpad" int x,
          set = fn x => set "xpad" int x
        }
      val ypadProp =
        {
          get = fn x => get "ypad" int x,
          set = fn x => set "ypad" int x
        }
    end
  end

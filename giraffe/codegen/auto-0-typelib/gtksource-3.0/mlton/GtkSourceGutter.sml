structure GtkSourceGutter :>
  GTK_SOURCE_GUTTER
    where type 'a class = 'a GtkSourceGutterClass.class
    where type 'a gutter_renderer_class = 'a GtkSourceGutterRendererClass.class
    where type 'a view_class = 'a GtkSourceViewClass.class =
  struct
    val getType_ = _import "gtk_source_gutter_get_type" : unit -> GObjectType.C.val_;
    val getRendererAtPos_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_gutter_get_renderer_at_pos" :
              GtkSourceGutterClass.C.notnull GtkSourceGutterClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> GtkSourceGutterRendererClass.C.notnull GtkSourceGutterRendererClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getWindow_ = _import "gtk_source_gutter_get_window" : GtkSourceGutterClass.C.notnull GtkSourceGutterClass.C.p -> GdkWindowClass.C.notnull GdkWindowClass.C.p;
    val insert_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_gutter_insert" :
              GtkSourceGutterClass.C.notnull GtkSourceGutterClass.C.p
               * GtkSourceGutterRendererClass.C.notnull GtkSourceGutterRendererClass.C.p
               * FFI.Int32.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val queueDraw_ = _import "gtk_source_gutter_queue_draw" : GtkSourceGutterClass.C.notnull GtkSourceGutterClass.C.p -> unit;
    val remove_ = fn x1 & x2 => (_import "gtk_source_gutter_remove" : GtkSourceGutterClass.C.notnull GtkSourceGutterClass.C.p * GtkSourceGutterRendererClass.C.notnull GtkSourceGutterRendererClass.C.p -> unit;) (x1, x2)
    val reorder_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_gutter_reorder" :
              GtkSourceGutterClass.C.notnull GtkSourceGutterClass.C.p
               * GtkSourceGutterRendererClass.C.notnull GtkSourceGutterRendererClass.C.p
               * FFI.Int32.C.val_
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
              GtkSourceGutterClass.C.notnull GtkSourceGutterClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
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
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getRendererAtPos self x y =
      (
        GtkSourceGutterClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> GtkSourceGutterRendererClass.C.fromPtr false
      )
        getRendererAtPos_
        (
          self
           & x
           & y
        )
    fun getWindow self = (GtkSourceGutterClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getWindow_ self
    fun insert self renderer position =
      (
        GtkSourceGutterClass.C.withPtr
         &&&> GtkSourceGutterRendererClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        insert_
        (
          self
           & renderer
           & position
        )
    fun queueDraw self = (GtkSourceGutterClass.C.withPtr ---> I) queueDraw_ self
    fun remove self renderer = (GtkSourceGutterClass.C.withPtr &&&> GtkSourceGutterRendererClass.C.withPtr ---> I) remove_ (self & renderer)
    fun reorder self renderer position =
      (
        GtkSourceGutterClass.C.withPtr
         &&&> GtkSourceGutterRendererClass.C.withPtr
         &&&> FFI.Int32.C.withVal
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
        GtkSourceGutterClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
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

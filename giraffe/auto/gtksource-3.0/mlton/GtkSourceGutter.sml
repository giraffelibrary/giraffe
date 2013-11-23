structure GtkSourceGutter :>
  GTK_SOURCE_GUTTER
    where type 'a class_t = 'a GtkSourceGutterClass.t
    where type 'a gutterrendererclass_t = 'a GtkSourceGutterRendererClass.t
    where type 'a viewclass_t = 'a GtkSourceViewClass.t =
  struct
    val getType_ = _import "gtk_source_gutter_get_type" : unit -> GObjectType.C.val_;
    val getRendererAtPos_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_gutter_get_renderer_at_pos" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getWindow_ = _import "gtk_source_gutter_get_window" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val insert_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_gutter_insert" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val queueDraw_ = _import "gtk_source_gutter_queue_draw" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val remove_ = fn x1 & x2 => (_import "gtk_source_gutter_remove" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val reorder_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_gutter_reorder" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GtkSourceGutterClass.t
    type 'a gutterrendererclass_t = 'a GtkSourceGutterRendererClass.t
    type 'a viewclass_t = 'a GtkSourceViewClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getRendererAtPos self x y =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> GtkSourceGutterRendererClass.C.fromPtr false
      )
        getRendererAtPos_
        (
          self
           & x
           & y
        )
    fun getWindow self = (GObjectObjectClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getWindow_ self
    fun insert self renderer position =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        insert_
        (
          self
           & renderer
           & position
        )
    fun queueDraw self = (GObjectObjectClass.C.withPtr ---> I) queueDraw_ self
    fun remove self renderer = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) remove_ (self & renderer)
    fun reorder self renderer position =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
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

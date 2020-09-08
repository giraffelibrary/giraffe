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
              GtkSourceGutterClass.FFI.non_opt GtkSourceGutterClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> GtkSourceGutterRendererClass.FFI.opt GtkSourceGutterRendererClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getWindow_ = _import "gtk_source_gutter_get_window" : GtkSourceGutterClass.FFI.non_opt GtkSourceGutterClass.FFI.p -> GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p;
    val insert_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_gutter_insert" :
              GtkSourceGutterClass.FFI.non_opt GtkSourceGutterClass.FFI.p
               * GtkSourceGutterRendererClass.FFI.non_opt GtkSourceGutterRendererClass.FFI.p
               * GInt.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val queueDraw_ = _import "gtk_source_gutter_queue_draw" : GtkSourceGutterClass.FFI.non_opt GtkSourceGutterClass.FFI.p -> unit;
    val remove_ = fn x1 & x2 => (_import "gtk_source_gutter_remove" : GtkSourceGutterClass.FFI.non_opt GtkSourceGutterClass.FFI.p * GtkSourceGutterRendererClass.FFI.non_opt GtkSourceGutterRendererClass.FFI.p -> unit;) (x1, x2)
    val reorder_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_gutter_reorder" :
              GtkSourceGutterClass.FFI.non_opt GtkSourceGutterClass.FFI.p
               * GtkSourceGutterRendererClass.FFI.non_opt GtkSourceGutterRendererClass.FFI.p
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
              GtkSourceGutterClass.FFI.non_opt GtkSourceGutterClass.FFI.p
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
    fun getRendererAtPos self (x, y) =
      (
        GtkSourceGutterClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> GtkSourceGutterRendererClass.FFI.fromOptPtr false
      )
        getRendererAtPos_
        (
          self
           & x
           & y
        )
    fun getWindow self = (GtkSourceGutterClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromPtr false) getWindow_ self
    fun insert self (renderer, position) =
      (
        GtkSourceGutterClass.FFI.withPtr false
         &&&> GtkSourceGutterRendererClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        insert_
        (
          self
           & renderer
           & position
        )
    fun queueDraw self = (GtkSourceGutterClass.FFI.withPtr false ---> I) queueDraw_ self
    fun remove self renderer = (GtkSourceGutterClass.FFI.withPtr false &&&> GtkSourceGutterRendererClass.FFI.withPtr false ---> I) remove_ (self & renderer)
    fun reorder self (renderer, position) =
      (
        GtkSourceGutterClass.FFI.withPtr false
         &&&> GtkSourceGutterRendererClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         ---> I
      )
        reorder_
        (
          self
           & renderer
           & position
        )
    fun setPadding self (xpad, ypad) =
      (
        GtkSourceGutterClass.FFI.withPtr false
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
      open ValueAccessor
    in
      val viewProp =
        {
          name = "view",
          gtype = fn () => C.gtype GtkSourceViewClass.tOpt (),
          get = fn x => fn () => C.get GtkSourceViewClass.tOpt x,
          set = ignore,
          init = fn x => C.set GtkSourceViewClass.tOpt x
        }
      val windowTypeProp =
        {
          name = "window-type",
          gtype = fn () => C.gtype GtkTextWindowType.t (),
          get = fn x => fn () => C.get GtkTextWindowType.t x,
          set = ignore,
          init = fn x => C.set GtkTextWindowType.t x
        }
      val xpadProp =
        {
          name = "xpad",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val ypadProp =
        {
          name = "ypad",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
    end
  end

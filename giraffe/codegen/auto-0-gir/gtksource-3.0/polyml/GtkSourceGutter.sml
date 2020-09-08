structure GtkSourceGutter :>
  GTK_SOURCE_GUTTER
    where type 'a class = 'a GtkSourceGutterClass.class
    where type 'a gutter_renderer_class = 'a GtkSourceGutterRendererClass.class
    where type 'a view_class = 'a GtkSourceViewClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_gutter_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getRendererAtPos_ =
        call (getSymbol "gtk_source_gutter_get_renderer_at_pos")
          (
            GtkSourceGutterClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> GtkSourceGutterRendererClass.PolyML.cOptPtr
          )
      val getWindow_ = call (getSymbol "gtk_source_gutter_get_window") (GtkSourceGutterClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val insert_ =
        call (getSymbol "gtk_source_gutter_insert")
          (
            GtkSourceGutterClass.PolyML.cPtr
             &&> GtkSourceGutterRendererClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val queueDraw_ = call (getSymbol "gtk_source_gutter_queue_draw") (GtkSourceGutterClass.PolyML.cPtr --> cVoid)
      val remove_ = call (getSymbol "gtk_source_gutter_remove") (GtkSourceGutterClass.PolyML.cPtr &&> GtkSourceGutterRendererClass.PolyML.cPtr --> cVoid)
      val reorder_ =
        call (getSymbol "gtk_source_gutter_reorder")
          (
            GtkSourceGutterClass.PolyML.cPtr
             &&> GtkSourceGutterRendererClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val setPadding_ =
        call (getSymbol "gtk_source_gutter_set_padding")
          (
            GtkSourceGutterClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
    end
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

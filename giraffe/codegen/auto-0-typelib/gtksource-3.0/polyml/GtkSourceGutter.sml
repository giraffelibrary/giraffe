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
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> GtkSourceGutterRendererClass.PolyML.cOptPtr
          )
      val getWindow_ = call (getSymbol "gtk_source_gutter_get_window") (GtkSourceGutterClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val insert_ =
        call (getSymbol "gtk_source_gutter_insert")
          (
            GtkSourceGutterClass.PolyML.cPtr
             &&> GtkSourceGutterRendererClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val queueDraw_ = call (getSymbol "gtk_source_gutter_queue_draw") (GtkSourceGutterClass.PolyML.cPtr --> cVoid)
      val remove_ = call (getSymbol "gtk_source_gutter_remove") (GtkSourceGutterClass.PolyML.cPtr &&> GtkSourceGutterRendererClass.PolyML.cPtr --> cVoid)
      val reorder_ =
        call (getSymbol "gtk_source_gutter_reorder")
          (
            GtkSourceGutterClass.PolyML.cPtr
             &&> GtkSourceGutterRendererClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val setPadding_ =
        call (getSymbol "gtk_source_gutter_set_padding")
          (
            GtkSourceGutterClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
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
        GtkSourceGutterClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> GtkSourceGutterRendererClass.FFI.fromOptPtr false
      )
        getRendererAtPos_
        (
          self
           & x
           & y
        )
    fun getWindow self = (GtkSourceGutterClass.FFI.withPtr ---> GdkWindowClass.FFI.fromPtr false) getWindow_ self
    fun insert self (renderer, position) =
      (
        GtkSourceGutterClass.FFI.withPtr
         &&&> GtkSourceGutterRendererClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
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
    fun reorder self (renderer, position) =
      (
        GtkSourceGutterClass.FFI.withPtr
         &&&> GtkSourceGutterRendererClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
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
        GtkSourceGutterClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
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

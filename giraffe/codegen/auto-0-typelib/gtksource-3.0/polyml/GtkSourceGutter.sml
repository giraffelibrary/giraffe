structure GtkSourceGutter :>
  GTK_SOURCE_GUTTER
    where type 'a class = 'a GtkSourceGutterClass.class
    where type 'a gutter_renderer_class = 'a GtkSourceGutterRendererClass.class
    where type 'a view_class = 'a GtkSourceViewClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_gutter_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getRendererAtPos_ =
        call (load_sym libgtksourceview "gtk_source_gutter_get_renderer_at_pos")
          (
            GtkSourceGutterClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> GtkSourceGutterRendererClass.PolyML.cPtr
          )
      val getWindow_ = call (load_sym libgtksourceview "gtk_source_gutter_get_window") (GtkSourceGutterClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val insert_ =
        call (load_sym libgtksourceview "gtk_source_gutter_insert")
          (
            GtkSourceGutterClass.PolyML.cPtr
             &&> GtkSourceGutterRendererClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val queueDraw_ = call (load_sym libgtksourceview "gtk_source_gutter_queue_draw") (GtkSourceGutterClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val remove_ = call (load_sym libgtksourceview "gtk_source_gutter_remove") (GtkSourceGutterClass.PolyML.cPtr &&> GtkSourceGutterRendererClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val reorder_ =
        call (load_sym libgtksourceview "gtk_source_gutter_reorder")
          (
            GtkSourceGutterClass.PolyML.cPtr
             &&> GtkSourceGutterRendererClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setPadding_ =
        call (load_sym libgtksourceview "gtk_source_gutter_set_padding")
          (
            GtkSourceGutterClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
    end
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

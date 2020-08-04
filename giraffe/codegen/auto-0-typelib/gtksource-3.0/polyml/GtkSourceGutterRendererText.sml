structure GtkSourceGutterRendererText :>
  GTK_SOURCE_GUTTER_RENDERER_TEXT
    where type 'a class = 'a GtkSourceGutterRendererTextClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_gutter_renderer_text_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_source_gutter_renderer_text_new") (cVoid --> GtkSourceGutterRendererClass.PolyML.cPtr)
      val measure_ =
        call (getSymbol "gtk_source_gutter_renderer_text_measure")
          (
            GtkSourceGutterRendererTextClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val measureMarkup_ =
        call (getSymbol "gtk_source_gutter_renderer_text_measure_markup")
          (
            GtkSourceGutterRendererTextClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val setMarkup_ =
        call (getSymbol "gtk_source_gutter_renderer_text_set_markup")
          (
            GtkSourceGutterRendererTextClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val setText_ =
        call (getSymbol "gtk_source_gutter_renderer_text_set_text")
          (
            GtkSourceGutterRendererTextClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
    end
    type 'a class = 'a GtkSourceGutterRendererTextClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSourceGutterRendererTextClass.FFI.fromPtr true) new_ ()
    fun measure self text =
      let
        val width
         & height
         & () =
          (
            GtkSourceGutterRendererTextClass.FFI.withPtr false
             &&&> Utf8.FFI.withPtr 0
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            measure_
            (
              self
               & text
               & GInt32.null
               & GInt32.null
            )
      in
        (width, height)
      end
    fun measureMarkup self markup =
      let
        val width
         & height
         & () =
          (
            GtkSourceGutterRendererTextClass.FFI.withPtr false
             &&&> Utf8.FFI.withPtr 0
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            measureMarkup_
            (
              self
               & markup
               & GInt32.null
               & GInt32.null
            )
      in
        (width, height)
      end
    fun setMarkup self (markup, length) =
      (
        GtkSourceGutterRendererTextClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt32.FFI.withVal
         ---> I
      )
        setMarkup_
        (
          self
           & markup
           & length
        )
    fun setText self (text, length) =
      (
        GtkSourceGutterRendererTextClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt32.FFI.withVal
         ---> I
      )
        setText_
        (
          self
           & text
           & length
        )
    local
      open Property
    in
      val markupProp =
        {
          get = fn x => get "markup" stringOpt x,
          set = fn x => set "markup" stringOpt x,
          new = fn x => new "markup" stringOpt x
        }
      val textProp =
        {
          get = fn x => get "text" stringOpt x,
          set = fn x => set "text" stringOpt x,
          new = fn x => new "text" stringOpt x
        }
    end
  end

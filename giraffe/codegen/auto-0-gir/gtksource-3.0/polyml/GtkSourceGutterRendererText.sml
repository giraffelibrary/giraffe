structure GtkSourceGutterRendererText :>
  GTK_SOURCE_GUTTER_RENDERER_TEXT
    where type 'a class = 'a GtkSourceGutterRendererTextClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_text_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_text_new") (FFI.PolyML.cVoid --> GtkSourceGutterRendererClass.PolyML.cPtr)
      val setMarkup_ =
        call (load_sym libgtksourceview "gtk_source_gutter_renderer_text_set_markup")
          (
            GtkSourceGutterRendererTextClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setText_ =
        call (load_sym libgtksourceview "gtk_source_gutter_renderer_text_set_text")
          (
            GtkSourceGutterRendererTextClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
    end
    type 'a class = 'a GtkSourceGutterRendererTextClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkSourceGutterRendererTextClass.C.fromPtr true) new_ ()
    fun setMarkup self markup length =
      (
        GtkSourceGutterRendererTextClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> I
      )
        setMarkup_
        (
          self
           & markup
           & length
        )
    fun setText self text length =
      (
        GtkSourceGutterRendererTextClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
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
          set = fn x => set "markup" stringOpt x
        }
      val textProp =
        {
          get = fn x => get "text" stringOpt x,
          set = fn x => set "text" stringOpt x
        }
    end
  end

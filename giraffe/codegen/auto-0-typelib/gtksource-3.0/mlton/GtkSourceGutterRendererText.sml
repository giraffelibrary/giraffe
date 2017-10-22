structure GtkSourceGutterRendererText :>
  GTK_SOURCE_GUTTER_RENDERER_TEXT
    where type 'a class = 'a GtkSourceGutterRendererTextClass.class =
  struct
    val getType_ = _import "gtk_source_gutter_renderer_text_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_source_gutter_renderer_text_new" : unit -> GtkSourceGutterRendererClass.FFI.notnull GtkSourceGutterRendererClass.FFI.p;
    val measure_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_gtk_source_gutter_renderer_text_measure" :
              GtkSourceGutterRendererTextClass.FFI.notnull GtkSourceGutterRendererTextClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val measureMarkup_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_gtk_source_gutter_renderer_text_measure_markup" :
              GtkSourceGutterRendererTextClass.FFI.notnull GtkSourceGutterRendererTextClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setMarkup_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_source_gutter_renderer_text_set_markup" :
              GtkSourceGutterRendererTextClass.FFI.notnull GtkSourceGutterRendererTextClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setText_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_source_gutter_renderer_text_set_text" :
              GtkSourceGutterRendererTextClass.FFI.notnull GtkSourceGutterRendererTextClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
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
            GtkSourceGutterRendererTextClass.FFI.withPtr
             &&&> Utf8.FFI.withPtr
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
            GtkSourceGutterRendererTextClass.FFI.withPtr
             &&&> Utf8.FFI.withPtr
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
        GtkSourceGutterRendererTextClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
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
        GtkSourceGutterRendererTextClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
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
          set = fn x => set "markup" stringOpt x
        }
      val textProp =
        {
          get = fn x => get "text" stringOpt x,
          set = fn x => set "text" stringOpt x
        }
    end
  end

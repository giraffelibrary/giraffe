structure GtkSourceGutterRendererText :>
  GTK_SOURCE_GUTTER_RENDERER_TEXT
    where type 'a class_t = 'a GtkSourceGutterRendererTextClass.t =
  struct
    val getType_ = _import "gtk_source_gutter_renderer_text_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_source_gutter_renderer_text_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val setMarkup_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_source_gutter_renderer_text_set_markup" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int32.val_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int32.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type 'a class_t = 'a GtkSourceGutterRendererTextClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkSourceGutterRendererTextClass.C.fromPtr true) new_ ()
    fun setMarkup self markup length =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Int32.withVal
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Int32.withVal
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

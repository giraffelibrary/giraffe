structure GtkSourceStyle :>
  GTK_SOURCE_STYLE
    where type 'a class = 'a GtkSourceStyleClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_style_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val apply_ = call (getSymbol "gtk_source_style_apply") (GtkSourceStyleClass.PolyML.cPtr &&> GtkTextTagClass.PolyML.cPtr --> cVoid)
      val copy_ = call (getSymbol "gtk_source_style_copy") (GtkSourceStyleClass.PolyML.cPtr --> GtkSourceStyleClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkSourceStyleClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun apply self tag = (GtkSourceStyleClass.FFI.withPtr &&&> GtkTextTagClass.FFI.withPtr ---> I) apply_ (self & tag)
    fun copy self = (GtkSourceStyleClass.FFI.withPtr ---> GtkSourceStyleClass.FFI.fromPtr true) copy_ self
    local
      open Property
    in
      val backgroundProp =
        {
          get = fn x => get "background" stringOpt x,
          set = fn x => set "background" stringOpt x
        }
      val backgroundSetProp =
        {
          get = fn x => get "background-set" boolean x,
          set = fn x => set "background-set" boolean x
        }
      val boldProp =
        {
          get = fn x => get "bold" boolean x,
          set = fn x => set "bold" boolean x
        }
      val boldSetProp =
        {
          get = fn x => get "bold-set" boolean x,
          set = fn x => set "bold-set" boolean x
        }
      val foregroundProp =
        {
          get = fn x => get "foreground" stringOpt x,
          set = fn x => set "foreground" stringOpt x
        }
      val foregroundSetProp =
        {
          get = fn x => get "foreground-set" boolean x,
          set = fn x => set "foreground-set" boolean x
        }
      val italicProp =
        {
          get = fn x => get "italic" boolean x,
          set = fn x => set "italic" boolean x
        }
      val italicSetProp =
        {
          get = fn x => get "italic-set" boolean x,
          set = fn x => set "italic-set" boolean x
        }
      val lineBackgroundProp =
        {
          get = fn x => get "line-background" stringOpt x,
          set = fn x => set "line-background" stringOpt x
        }
      val lineBackgroundSetProp =
        {
          get = fn x => get "line-background-set" boolean x,
          set = fn x => set "line-background-set" boolean x
        }
      val pangoUnderlineProp =
        {
          get = fn x => get "pango-underline" PangoUnderline.t x,
          set = fn x => set "pango-underline" PangoUnderline.t x
        }
      val scaleProp =
        {
          get = fn x => get "scale" stringOpt x,
          set = fn x => set "scale" stringOpt x
        }
      val scaleSetProp =
        {
          get = fn x => get "scale-set" boolean x,
          set = fn x => set "scale-set" boolean x
        }
      val strikethroughProp =
        {
          get = fn x => get "strikethrough" boolean x,
          set = fn x => set "strikethrough" boolean x
        }
      val strikethroughSetProp =
        {
          get = fn x => get "strikethrough-set" boolean x,
          set = fn x => set "strikethrough-set" boolean x
        }
      val underlineProp =
        {
          get = fn x => get "underline" boolean x,
          set = fn x => set "underline" boolean x
        }
      val underlineColorProp =
        {
          get = fn x => get "underline-color" stringOpt x,
          set = fn x => set "underline-color" stringOpt x
        }
      val underlineColorSetProp =
        {
          get = fn x => get "underline-color-set" boolean x,
          set = fn x => set "underline-color-set" boolean x
        }
      val underlineSetProp =
        {
          get = fn x => get "underline-set" boolean x,
          set = fn x => set "underline-set" boolean x
        }
    end
  end

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
    fun apply self tag = (GtkSourceStyleClass.FFI.withPtr false &&&> GtkTextTagClass.FFI.withPtr false ---> I) apply_ (self & tag)
    fun copy self = (GtkSourceStyleClass.FFI.withPtr false ---> GtkSourceStyleClass.FFI.fromPtr true) copy_ self
    local
      open Property
    in
      val backgroundProp =
        {
          get = fn x => get "background" stringOpt x,
          new = fn x => new "background" stringOpt x
        }
      val backgroundSetProp =
        {
          get = fn x => get "background-set" boolean x,
          new = fn x => new "background-set" boolean x
        }
      val boldProp =
        {
          get = fn x => get "bold" boolean x,
          new = fn x => new "bold" boolean x
        }
      val boldSetProp =
        {
          get = fn x => get "bold-set" boolean x,
          new = fn x => new "bold-set" boolean x
        }
      val foregroundProp =
        {
          get = fn x => get "foreground" stringOpt x,
          new = fn x => new "foreground" stringOpt x
        }
      val foregroundSetProp =
        {
          get = fn x => get "foreground-set" boolean x,
          new = fn x => new "foreground-set" boolean x
        }
      val italicProp =
        {
          get = fn x => get "italic" boolean x,
          new = fn x => new "italic" boolean x
        }
      val italicSetProp =
        {
          get = fn x => get "italic-set" boolean x,
          new = fn x => new "italic-set" boolean x
        }
      val lineBackgroundProp =
        {
          get = fn x => get "line-background" stringOpt x,
          new = fn x => new "line-background" stringOpt x
        }
      val lineBackgroundSetProp =
        {
          get = fn x => get "line-background-set" boolean x,
          new = fn x => new "line-background-set" boolean x
        }
      val pangoUnderlineProp =
        {
          get = fn x => get "pango-underline" PangoUnderline.t x,
          new = fn x => new "pango-underline" PangoUnderline.t x
        }
      val scaleProp =
        {
          get = fn x => get "scale" stringOpt x,
          new = fn x => new "scale" stringOpt x
        }
      val scaleSetProp =
        {
          get = fn x => get "scale-set" boolean x,
          new = fn x => new "scale-set" boolean x
        }
      val strikethroughProp =
        {
          get = fn x => get "strikethrough" boolean x,
          new = fn x => new "strikethrough" boolean x
        }
      val strikethroughSetProp =
        {
          get = fn x => get "strikethrough-set" boolean x,
          new = fn x => new "strikethrough-set" boolean x
        }
      val underlineProp =
        {
          get = fn x => get "underline" boolean x,
          new = fn x => new "underline" boolean x
        }
      val underlineColorProp =
        {
          get = fn x => get "underline-color" stringOpt x,
          new = fn x => new "underline-color" stringOpt x
        }
      val underlineColorSetProp =
        {
          get = fn x => get "underline-color-set" boolean x,
          new = fn x => new "underline-color-set" boolean x
        }
      val underlineSetProp =
        {
          get = fn x => get "underline-set" boolean x,
          new = fn x => new "underline-set" boolean x
        }
    end
  end

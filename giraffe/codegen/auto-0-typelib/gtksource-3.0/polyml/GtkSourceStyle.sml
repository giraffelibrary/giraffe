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
      open ValueAccessor
    in
      val backgroundProp =
        {
          name = "background",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val backgroundSetProp =
        {
          name = "background-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = fn x => C.set boolean x
        }
      val boldProp =
        {
          name = "bold",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = fn x => C.set boolean x
        }
      val boldSetProp =
        {
          name = "bold-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = fn x => C.set boolean x
        }
      val foregroundProp =
        {
          name = "foreground",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val foregroundSetProp =
        {
          name = "foreground-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = fn x => C.set boolean x
        }
      val italicProp =
        {
          name = "italic",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = fn x => C.set boolean x
        }
      val italicSetProp =
        {
          name = "italic-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = fn x => C.set boolean x
        }
      val lineBackgroundProp =
        {
          name = "line-background",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val lineBackgroundSetProp =
        {
          name = "line-background-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = fn x => C.set boolean x
        }
      val pangoUnderlineProp =
        {
          name = "pango-underline",
          gtype = fn () => C.gtype PangoUnderline.t (),
          get = fn x => fn () => C.get PangoUnderline.t x,
          set = ignore,
          init = fn x => C.set PangoUnderline.t x
        }
      val scaleProp =
        {
          name = "scale",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val scaleSetProp =
        {
          name = "scale-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = fn x => C.set boolean x
        }
      val strikethroughProp =
        {
          name = "strikethrough",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = fn x => C.set boolean x
        }
      val strikethroughSetProp =
        {
          name = "strikethrough-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = fn x => C.set boolean x
        }
      val underlineProp =
        {
          name = "underline",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = fn x => C.set boolean x
        }
      val underlineColorProp =
        {
          name = "underline-color",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val underlineColorSetProp =
        {
          name = "underline-color-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = fn x => C.set boolean x
        }
      val underlineSetProp =
        {
          name = "underline-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = fn x => C.set boolean x
        }
    end
  end

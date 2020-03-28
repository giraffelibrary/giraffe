structure GtkColorChooser :>
  GTK_COLOR_CHOOSER
    where type 'a class = 'a GtkColorChooserClass.class
    where type orientation_t = GtkOrientation.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_color_chooser_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val addPalette_ =
        call (getSymbol "gtk_color_chooser_add_palette")
          (
            GtkColorChooserClass.PolyML.cPtr
             &&> GtkOrientation.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GdkRgbaRecordCArrayN.PolyML.cInOptPtr
             --> cVoid
          )
      val getRgba_ = call (getSymbol "gtk_color_chooser_get_rgba") (GtkColorChooserClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> cVoid)
      val getUseAlpha_ = call (getSymbol "gtk_color_chooser_get_use_alpha") (GtkColorChooserClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setRgba_ = call (getSymbol "gtk_color_chooser_set_rgba") (GtkColorChooserClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> cVoid)
      val setUseAlpha_ = call (getSymbol "gtk_color_chooser_set_use_alpha") (GtkColorChooserClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkColorChooserClass.class
    type orientation_t = GtkOrientation.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun addPalette
      self
      (
        orientation,
        colorsPerLine,
        colors
      ) =
      let
        val nColors =
          case colors of
            SOME colors => LargeInt.fromInt (GdkRgbaRecordCArrayN.length colors)
          | NONE => GInt32.null
        val () =
          (
            GtkColorChooserClass.FFI.withPtr
             &&&> GtkOrientation.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GdkRgbaRecordCArrayN.FFI.withOptPtr
             ---> I
          )
            addPalette_
            (
              self
               & orientation
               & colorsPerLine
               & nColors
               & colors
            )
      in
        ()
      end
    fun getRgba self =
      let
        val color & () = (GtkColorChooserClass.FFI.withPtr &&&> GdkRgbaRecord.FFI.withNewPtr ---> GdkRgbaRecord.FFI.fromPtr true && I) getRgba_ (self & ())
      in
        color
      end
    fun getUseAlpha self = (GtkColorChooserClass.FFI.withPtr ---> GBool.FFI.fromVal) getUseAlpha_ self
    fun setRgba self color = (GtkColorChooserClass.FFI.withPtr &&&> GdkRgbaRecord.FFI.withPtr ---> I) setRgba_ (self & color)
    fun setUseAlpha self useAlpha = (GtkColorChooserClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setUseAlpha_ (self & useAlpha)
    local
      open ClosureMarshal Signal
    in
      fun colorActivatedSig f = signal "color-activated" (get 0w1 GdkRgbaRecord.t ---> ret_void) f
    end
    local
      open Property
    in
      val rgbaProp =
        {
          get = fn x => get "rgba" GdkRgbaRecord.tOpt x,
          set = fn x => set "rgba" GdkRgbaRecord.tOpt x,
          new = fn x => new "rgba" GdkRgbaRecord.tOpt x
        }
      val useAlphaProp =
        {
          get = fn x => get "use-alpha" boolean x,
          set = fn x => set "use-alpha" boolean x,
          new = fn x => new "use-alpha" boolean x
        }
    end
  end

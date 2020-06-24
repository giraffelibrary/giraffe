structure GtkColorChooser :>
  GTK_COLOR_CHOOSER
    where type 'a class = 'a GtkColorChooserClass.class
    where type orientation_t = GtkOrientation.t =
  struct
    val getType_ = _import "gtk_color_chooser_get_type" : unit -> GObjectType.FFI.val_;
    val addPalette_ =
      fn
        x1
         & x2
         & x3
         & x4
         & (x5, x6) =>
          (
            _import "mlton_gtk_color_chooser_add_palette" :
              GtkColorChooserClass.FFI.non_opt GtkColorChooserClass.FFI.p
               * GtkOrientation.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GdkRgbaRecordCArrayN.MLton.p1
               * GdkRgbaRecordCArrayN.FFI.opt GdkRgbaRecordCArrayN.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val getRgba_ = fn x1 & x2 => (_import "gtk_color_chooser_get_rgba" : GtkColorChooserClass.FFI.non_opt GtkColorChooserClass.FFI.p * GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val getUseAlpha_ = _import "gtk_color_chooser_get_use_alpha" : GtkColorChooserClass.FFI.non_opt GtkColorChooserClass.FFI.p -> GBool.FFI.val_;
    val setRgba_ = fn x1 & x2 => (_import "gtk_color_chooser_set_rgba" : GtkColorChooserClass.FFI.non_opt GtkColorChooserClass.FFI.p * GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setUseAlpha_ = fn x1 & x2 => (_import "gtk_color_chooser_set_use_alpha" : GtkColorChooserClass.FFI.non_opt GtkColorChooserClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
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

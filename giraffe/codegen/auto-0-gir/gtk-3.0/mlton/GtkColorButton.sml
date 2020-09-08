structure GtkColorButton :>
  GTK_COLOR_BUTTON
    where type 'a class = 'a GtkColorButtonClass.class
    where type 'a actionable_class = 'a GtkActionableClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a color_chooser_class = 'a GtkColorChooserClass.class =
  struct
    val getType_ = _import "gtk_color_button_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_color_button_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newWithColor_ = _import "gtk_color_button_new_with_color" : GdkColorRecord.FFI.non_opt GdkColorRecord.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newWithRgba_ = _import "gtk_color_button_new_with_rgba" : GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getAlpha_ = _import "gtk_color_button_get_alpha" : GtkColorButtonClass.FFI.non_opt GtkColorButtonClass.FFI.p -> GUInt16.FFI.val_;
    val getColor_ = fn x1 & x2 => (_import "gtk_color_button_get_color" : GtkColorButtonClass.FFI.non_opt GtkColorButtonClass.FFI.p * GdkColorRecord.FFI.non_opt GdkColorRecord.FFI.p -> unit;) (x1, x2)
    val getTitle_ = _import "gtk_color_button_get_title" : GtkColorButtonClass.FFI.non_opt GtkColorButtonClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getUseAlpha_ = _import "gtk_color_button_get_use_alpha" : GtkColorButtonClass.FFI.non_opt GtkColorButtonClass.FFI.p -> GBool.FFI.val_;
    val setAlpha_ = fn x1 & x2 => (_import "gtk_color_button_set_alpha" : GtkColorButtonClass.FFI.non_opt GtkColorButtonClass.FFI.p * GUInt16.FFI.val_ -> unit;) (x1, x2)
    val setColor_ = fn x1 & x2 => (_import "gtk_color_button_set_color" : GtkColorButtonClass.FFI.non_opt GtkColorButtonClass.FFI.p * GdkColorRecord.FFI.non_opt GdkColorRecord.FFI.p -> unit;) (x1, x2)
    val setTitle_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_color_button_set_title" :
              GtkColorButtonClass.FFI.non_opt GtkColorButtonClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setUseAlpha_ = fn x1 & x2 => (_import "gtk_color_button_set_use_alpha" : GtkColorButtonClass.FFI.non_opt GtkColorButtonClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkColorButtonClass.class
    type 'a actionable_class = 'a GtkActionableClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a color_chooser_class = 'a GtkColorChooserClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActionableClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asColorChooser self = (GObjectObjectClass.FFI.withPtr false ---> GtkColorChooserClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkColorButtonClass.FFI.fromPtr false) new_ ()
    fun newWithColor color = (GdkColorRecord.FFI.withPtr false ---> GtkColorButtonClass.FFI.fromPtr false) newWithColor_ color
    fun newWithRgba rgba = (GdkRgbaRecord.FFI.withPtr false ---> GtkColorButtonClass.FFI.fromPtr false) newWithRgba_ rgba
    fun getAlpha self = (GtkColorButtonClass.FFI.withPtr false ---> GUInt16.FFI.fromVal) getAlpha_ self
    fun getColor self =
      let
        val color & () = (GtkColorButtonClass.FFI.withPtr false &&&> GdkColorRecord.FFI.withNewPtr ---> GdkColorRecord.FFI.fromPtr true && I) getColor_ (self & ())
      in
        color
      end
    fun getTitle self = (GtkColorButtonClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getTitle_ self
    fun getUseAlpha self = (GtkColorButtonClass.FFI.withPtr false ---> GBool.FFI.fromVal) getUseAlpha_ self
    fun setAlpha self alpha = (GtkColorButtonClass.FFI.withPtr false &&&> GUInt16.FFI.withVal ---> I) setAlpha_ (self & alpha)
    fun setColor self color = (GtkColorButtonClass.FFI.withPtr false &&&> GdkColorRecord.FFI.withPtr false ---> I) setColor_ (self & color)
    fun setTitle self title = (GtkColorButtonClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setTitle_ (self & title)
    fun setUseAlpha self useAlpha = (GtkColorButtonClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setUseAlpha_ (self & useAlpha)
    local
      open ClosureMarshal Signal
    in
      fun colorSetSig f = signal "color-set" (void ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val alphaProp =
        {
          name = "alpha",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val colorProp =
        {
          name = "color",
          gtype = fn () => C.gtype GdkColorRecord.tOpt (),
          get = fn x => fn () => C.get GdkColorRecord.tOpt x,
          set = fn x => C.set GdkColorRecord.tOpt x,
          init = fn x => C.set GdkColorRecord.tOpt x
        }
      val rgbaProp =
        {
          name = "rgba",
          gtype = fn () => C.gtype GdkRgbaRecord.tOpt (),
          get = fn x => fn () => C.get GdkRgbaRecord.tOpt x,
          set = fn x => C.set GdkRgbaRecord.tOpt x,
          init = fn x => C.set GdkRgbaRecord.tOpt x
        }
      val showEditorProp =
        {
          name = "show-editor",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val titleProp =
        {
          name = "title",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val useAlphaProp =
        {
          name = "use-alpha",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end

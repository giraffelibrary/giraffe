structure GtkColorButton :>
  GTK_COLOR_BUTTON
    where type 'a class = 'a GtkColorButtonClass.class
    where type 'a actionable_class = 'a GtkActionableClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a color_chooser_class = 'a GtkColorChooserClass.class =
  struct
    val getType_ = _import "gtk_color_button_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_color_button_new" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val newWithColor_ = _import "gtk_color_button_new_with_color" : GdkColorRecord.FFI.notnull GdkColorRecord.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val newWithRgba_ = _import "gtk_color_button_new_with_rgba" : GdkRgbaRecord.FFI.notnull GdkRgbaRecord.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getAlpha_ = _import "gtk_color_button_get_alpha" : GtkColorButtonClass.FFI.notnull GtkColorButtonClass.FFI.p -> GUInt16.FFI.val_;
    val getColor_ = fn x1 & x2 => (_import "gtk_color_button_get_color" : GtkColorButtonClass.FFI.notnull GtkColorButtonClass.FFI.p * GdkColorRecord.FFI.notnull GdkColorRecord.FFI.p -> unit;) (x1, x2)
    val getTitle_ = _import "gtk_color_button_get_title" : GtkColorButtonClass.FFI.notnull GtkColorButtonClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getUseAlpha_ = _import "gtk_color_button_get_use_alpha" : GtkColorButtonClass.FFI.notnull GtkColorButtonClass.FFI.p -> GBool.FFI.val_;
    val setAlpha_ = fn x1 & x2 => (_import "gtk_color_button_set_alpha" : GtkColorButtonClass.FFI.notnull GtkColorButtonClass.FFI.p * GUInt16.FFI.val_ -> unit;) (x1, x2)
    val setColor_ = fn x1 & x2 => (_import "gtk_color_button_set_color" : GtkColorButtonClass.FFI.notnull GtkColorButtonClass.FFI.p * GdkColorRecord.FFI.notnull GdkColorRecord.FFI.p -> unit;) (x1, x2)
    val setTitle_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_color_button_set_title" :
              GtkColorButtonClass.FFI.notnull GtkColorButtonClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setUseAlpha_ = fn x1 & x2 => (_import "gtk_color_button_set_use_alpha" : GtkColorButtonClass.FFI.notnull GtkColorButtonClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkColorButtonClass.class
    type 'a actionable_class = 'a GtkActionableClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a color_chooser_class = 'a GtkColorChooserClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionable self = (GObjectObjectClass.FFI.withPtr ---> GtkActionableClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asColorChooser self = (GObjectObjectClass.FFI.withPtr ---> GtkColorChooserClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkColorButtonClass.FFI.fromPtr false) new_ ()
    fun newWithColor color = (GdkColorRecord.FFI.withPtr ---> GtkColorButtonClass.FFI.fromPtr false) newWithColor_ color
    fun newWithRgba rgba = (GdkRgbaRecord.FFI.withPtr ---> GtkColorButtonClass.FFI.fromPtr false) newWithRgba_ rgba
    fun getAlpha self = (GtkColorButtonClass.FFI.withPtr ---> GUInt16.FFI.fromVal) getAlpha_ self
    fun getColor self =
      let
        val color & () = (GtkColorButtonClass.FFI.withPtr &&&> GdkColorRecord.FFI.withNewPtr ---> GdkColorRecord.FFI.fromPtr true && I) getColor_ (self & ())
      in
        color
      end
    fun getTitle self = (GtkColorButtonClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getTitle_ self
    fun getUseAlpha self = (GtkColorButtonClass.FFI.withPtr ---> GBool.FFI.fromVal) getUseAlpha_ self
    fun setAlpha self alpha = (GtkColorButtonClass.FFI.withPtr &&&> GUInt16.FFI.withVal ---> I) setAlpha_ (self & alpha)
    fun setColor self color = (GtkColorButtonClass.FFI.withPtr &&&> GdkColorRecord.FFI.withPtr ---> I) setColor_ (self & color)
    fun setTitle self title = (GtkColorButtonClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setTitle_ (self & title)
    fun setUseAlpha self useAlpha = (GtkColorButtonClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setUseAlpha_ (self & useAlpha)
    local
      open ClosureMarshal Signal
    in
      fun colorSetSig f = signal "color-set" (void ---> ret_void) f
    end
    local
      open Property
    in
      val alphaProp =
        {
          get = fn x => get "alpha" uint x,
          set = fn x => set "alpha" uint x
        }
      val colorProp =
        {
          get = fn x => get "color" GdkColorRecord.tOpt x,
          set = fn x => set "color" GdkColorRecord.tOpt x
        }
      val rgbaProp =
        {
          get = fn x => get "rgba" GdkRgbaRecord.tOpt x,
          set = fn x => set "rgba" GdkRgbaRecord.tOpt x
        }
      val showEditorProp =
        {
          get = fn x => get "show-editor" boolean x,
          set = fn x => set "show-editor" boolean x
        }
      val titleProp =
        {
          get = fn x => get "title" stringOpt x,
          set = fn x => set "title" stringOpt x
        }
      val useAlphaProp =
        {
          get = fn x => get "use-alpha" boolean x,
          set = fn x => set "use-alpha" boolean x
        }
    end
  end

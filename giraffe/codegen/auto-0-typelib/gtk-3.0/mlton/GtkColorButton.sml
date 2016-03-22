structure GtkColorButton :>
  GTK_COLOR_BUTTON
    where type 'a class = 'a GtkColorButtonClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_color_button_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_color_button_new" : unit -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val newWithColor_ = _import "gtk_color_button_new_with_color" : GdkColorRecord.C.notnull GdkColorRecord.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val newWithRgba_ = _import "gtk_color_button_new_with_rgba" : GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getAlpha_ = _import "gtk_color_button_get_alpha" : GtkColorButtonClass.C.notnull GtkColorButtonClass.C.p -> FFI.UInt16.C.val_;
    val getColor_ = fn x1 & x2 => (_import "gtk_color_button_get_color" : GtkColorButtonClass.C.notnull GtkColorButtonClass.C.p * GdkColorRecord.C.notnull GdkColorRecord.C.p -> unit;) (x1, x2)
    val getRgba_ = fn x1 & x2 => (_import "gtk_color_button_get_rgba" : GtkColorButtonClass.C.notnull GtkColorButtonClass.C.p * GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p -> unit;) (x1, x2)
    val getTitle_ = _import "gtk_color_button_get_title" : GtkColorButtonClass.C.notnull GtkColorButtonClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getUseAlpha_ = _import "gtk_color_button_get_use_alpha" : GtkColorButtonClass.C.notnull GtkColorButtonClass.C.p -> FFI.Bool.C.val_;
    val setAlpha_ = fn x1 & x2 => (_import "gtk_color_button_set_alpha" : GtkColorButtonClass.C.notnull GtkColorButtonClass.C.p * FFI.UInt16.C.val_ -> unit;) (x1, x2)
    val setColor_ = fn x1 & x2 => (_import "gtk_color_button_set_color" : GtkColorButtonClass.C.notnull GtkColorButtonClass.C.p * GdkColorRecord.C.notnull GdkColorRecord.C.p -> unit;) (x1, x2)
    val setRgba_ = fn x1 & x2 => (_import "gtk_color_button_set_rgba" : GtkColorButtonClass.C.notnull GtkColorButtonClass.C.p * GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p -> unit;) (x1, x2)
    val setTitle_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_color_button_set_title" :
              GtkColorButtonClass.C.notnull GtkColorButtonClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setUseAlpha_ = fn x1 & x2 => (_import "gtk_color_button_set_use_alpha" : GtkColorButtonClass.C.notnull GtkColorButtonClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkColorButtonClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkColorButtonClass.C.fromPtr false) new_ ()
    fun newWithColor color = (GdkColorRecord.C.withPtr ---> GtkColorButtonClass.C.fromPtr false) newWithColor_ color
    fun newWithRgba rgba = (GdkRgbaRecord.C.withPtr ---> GtkColorButtonClass.C.fromPtr false) newWithRgba_ rgba
    fun getAlpha self = (GtkColorButtonClass.C.withPtr ---> FFI.UInt16.C.fromVal) getAlpha_ self
    fun getColor self =
      let
        val color & () = (GtkColorButtonClass.C.withPtr &&&> GdkColorRecord.C.withNewPtr ---> GdkColorRecord.C.fromPtr true && I) getColor_ (self & ())
      in
        color
      end
    fun getRgba self =
      let
        val rgba & () = (GtkColorButtonClass.C.withPtr &&&> GdkRgbaRecord.C.withNewPtr ---> GdkRgbaRecord.C.fromPtr true && I) getRgba_ (self & ())
      in
        rgba
      end
    fun getTitle self = (GtkColorButtonClass.C.withPtr ---> Utf8.C.fromPtr false) getTitle_ self
    fun getUseAlpha self = (GtkColorButtonClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseAlpha_ self
    fun setAlpha self alpha = (GtkColorButtonClass.C.withPtr &&&> FFI.UInt16.C.withVal ---> I) setAlpha_ (self & alpha)
    fun setColor self color = (GtkColorButtonClass.C.withPtr &&&> GdkColorRecord.C.withPtr ---> I) setColor_ (self & color)
    fun setRgba self rgba = (GtkColorButtonClass.C.withPtr &&&> GdkRgbaRecord.C.withPtr ---> I) setRgba_ (self & rgba)
    fun setTitle self title = (GtkColorButtonClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setTitle_ (self & title)
    fun setUseAlpha self useAlpha = (GtkColorButtonClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseAlpha_ (self & useAlpha)
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

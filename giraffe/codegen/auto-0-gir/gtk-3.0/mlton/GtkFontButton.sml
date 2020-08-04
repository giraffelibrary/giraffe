structure GtkFontButton :>
  GTK_FONT_BUTTON
    where type 'a class = 'a GtkFontButtonClass.class
    where type 'a actionable_class = 'a GtkActionableClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a font_chooser_class = 'a GtkFontChooserClass.class =
  struct
    val getType_ = _import "gtk_font_button_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_font_button_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newWithFont_ = _import "mlton_gtk_font_button_new_with_font" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getFontName_ = _import "gtk_font_button_get_font_name" : GtkFontButtonClass.FFI.non_opt GtkFontButtonClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getShowSize_ = _import "gtk_font_button_get_show_size" : GtkFontButtonClass.FFI.non_opt GtkFontButtonClass.FFI.p -> GBool.FFI.val_;
    val getShowStyle_ = _import "gtk_font_button_get_show_style" : GtkFontButtonClass.FFI.non_opt GtkFontButtonClass.FFI.p -> GBool.FFI.val_;
    val getTitle_ = _import "gtk_font_button_get_title" : GtkFontButtonClass.FFI.non_opt GtkFontButtonClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getUseFont_ = _import "gtk_font_button_get_use_font" : GtkFontButtonClass.FFI.non_opt GtkFontButtonClass.FFI.p -> GBool.FFI.val_;
    val getUseSize_ = _import "gtk_font_button_get_use_size" : GtkFontButtonClass.FFI.non_opt GtkFontButtonClass.FFI.p -> GBool.FFI.val_;
    val setFontName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_font_button_set_font_name" :
              GtkFontButtonClass.FFI.non_opt GtkFontButtonClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setShowSize_ = fn x1 & x2 => (_import "gtk_font_button_set_show_size" : GtkFontButtonClass.FFI.non_opt GtkFontButtonClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setShowStyle_ = fn x1 & x2 => (_import "gtk_font_button_set_show_style" : GtkFontButtonClass.FFI.non_opt GtkFontButtonClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setTitle_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_font_button_set_title" :
              GtkFontButtonClass.FFI.non_opt GtkFontButtonClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setUseFont_ = fn x1 & x2 => (_import "gtk_font_button_set_use_font" : GtkFontButtonClass.FFI.non_opt GtkFontButtonClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setUseSize_ = fn x1 & x2 => (_import "gtk_font_button_set_use_size" : GtkFontButtonClass.FFI.non_opt GtkFontButtonClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkFontButtonClass.class
    type 'a actionable_class = 'a GtkActionableClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a font_chooser_class = 'a GtkFontChooserClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActionableClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asFontChooser self = (GObjectObjectClass.FFI.withPtr false ---> GtkFontChooserClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkFontButtonClass.FFI.fromPtr false) new_ ()
    fun newWithFont fontname = (Utf8.FFI.withPtr 0 ---> GtkFontButtonClass.FFI.fromPtr false) newWithFont_ fontname
    fun getFontName self = (GtkFontButtonClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getFontName_ self
    fun getShowSize self = (GtkFontButtonClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowSize_ self
    fun getShowStyle self = (GtkFontButtonClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowStyle_ self
    fun getTitle self = (GtkFontButtonClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getTitle_ self
    fun getUseFont self = (GtkFontButtonClass.FFI.withPtr false ---> GBool.FFI.fromVal) getUseFont_ self
    fun getUseSize self = (GtkFontButtonClass.FFI.withPtr false ---> GBool.FFI.fromVal) getUseSize_ self
    fun setFontName self fontname = (GtkFontButtonClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) setFontName_ (self & fontname)
    fun setShowSize self showSize = (GtkFontButtonClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowSize_ (self & showSize)
    fun setShowStyle self showStyle = (GtkFontButtonClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowStyle_ (self & showStyle)
    fun setTitle self title = (GtkFontButtonClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setTitle_ (self & title)
    fun setUseFont self useFont = (GtkFontButtonClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setUseFont_ (self & useFont)
    fun setUseSize self useSize = (GtkFontButtonClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setUseSize_ (self & useSize)
    local
      open ClosureMarshal Signal
    in
      fun fontSetSig f = signal "font-set" (void ---> ret_void) f
    end
    local
      open Property
    in
      val fontNameProp =
        {
          get = fn x => get "font-name" stringOpt x,
          set = fn x => set "font-name" stringOpt x,
          new = fn x => new "font-name" stringOpt x
        }
      val showSizeProp =
        {
          get = fn x => get "show-size" boolean x,
          set = fn x => set "show-size" boolean x,
          new = fn x => new "show-size" boolean x
        }
      val showStyleProp =
        {
          get = fn x => get "show-style" boolean x,
          set = fn x => set "show-style" boolean x,
          new = fn x => new "show-style" boolean x
        }
      val titleProp =
        {
          get = fn x => get "title" stringOpt x,
          set = fn x => set "title" stringOpt x,
          new = fn x => new "title" stringOpt x
        }
      val useFontProp =
        {
          get = fn x => get "use-font" boolean x,
          set = fn x => set "use-font" boolean x,
          new = fn x => new "use-font" boolean x
        }
      val useSizeProp =
        {
          get = fn x => get "use-size" boolean x,
          set = fn x => set "use-size" boolean x,
          new = fn x => new "use-size" boolean x
        }
    end
  end

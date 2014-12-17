structure GtkFontButton :>
  GTK_FONT_BUTTON
    where type 'a class_t = 'a GtkFontButtonClass.t
    where type 'a activatableclass_t = 'a GtkActivatableClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a fontchooserclass_t = 'a GtkFontChooserClass.t =
  struct
    val getType_ = _import "gtk_font_button_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_font_button_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithFont_ = _import "mlton_gtk_font_button_new_with_font" : cstring * unit CPointer.t -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getFontName_ = _import "gtk_font_button_get_font_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getShowSize_ = _import "gtk_font_button_get_show_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getShowStyle_ = _import "gtk_font_button_get_show_style" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getTitle_ = _import "gtk_font_button_get_title" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getUseFont_ = _import "gtk_font_button_get_use_font" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getUseSize_ = _import "gtk_font_button_get_use_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val setFontName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_font_button_set_font_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setShowSize_ = fn x1 & x2 => (_import "gtk_font_button_set_show_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setShowStyle_ = fn x1 & x2 => (_import "gtk_font_button_set_show_style" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setTitle_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_font_button_set_title" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setUseFont_ = fn x1 & x2 => (_import "gtk_font_button_set_use_font" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setUseSize_ = fn x1 & x2 => (_import "gtk_font_button_set_use_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GtkFontButtonClass.t
    type 'a activatableclass_t = 'a GtkActivatableClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a fontchooserclass_t = 'a GtkFontChooserClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asFontChooser self = (GObjectObjectClass.C.withPtr ---> GtkFontChooserClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkFontButtonClass.C.fromPtr false) new_ ()
    fun newWithFont fontname = (FFI.String.C.withConstPtr ---> GtkFontButtonClass.C.fromPtr false) newWithFont_ fontname
    fun getFontName self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getFontName_ self
    fun getShowSize self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowSize_ self
    fun getShowStyle self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowStyle_ self
    fun getTitle self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getTitle_ self
    fun getUseFont self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseFont_ self
    fun getUseSize self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseSize_ self
    fun setFontName self fontname = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) setFontName_ (self & fontname)
    fun setShowSize self showSize = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowSize_ (self & showSize)
    fun setShowStyle self showStyle = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowStyle_ (self & showStyle)
    fun setTitle self title = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setTitle_ (self & title)
    fun setUseFont self useFont = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseFont_ (self & useFont)
    fun setUseSize self useSize = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseSize_ (self & useSize)
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
          set = fn x => set "font-name" stringOpt x
        }
      val showSizeProp =
        {
          get = fn x => get "show-size" boolean x,
          set = fn x => set "show-size" boolean x
        }
      val showStyleProp =
        {
          get = fn x => get "show-style" boolean x,
          set = fn x => set "show-style" boolean x
        }
      val titleProp =
        {
          get = fn x => get "title" stringOpt x,
          set = fn x => set "title" stringOpt x
        }
      val useFontProp =
        {
          get = fn x => get "use-font" boolean x,
          set = fn x => set "use-font" boolean x
        }
      val useSizeProp =
        {
          get = fn x => get "use-size" boolean x,
          set = fn x => set "use-size" boolean x
        }
    end
  end

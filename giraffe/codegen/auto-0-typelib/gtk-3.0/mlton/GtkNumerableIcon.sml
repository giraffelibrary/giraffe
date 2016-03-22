structure GtkNumerableIcon :>
  GTK_NUMERABLE_ICON
    where type 'a class = 'a GtkNumerableIconClass.class
    where type 'a style_context_class = 'a GtkStyleContextClass.class =
  struct
    val getType_ = _import "gtk_numerable_icon_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_numerable_icon_new" : GioIconClass.C.notnull GioIconClass.C.p -> GioIconClass.C.notnull GioIconClass.C.p;
    val newWithStyleContext_ = fn x1 & x2 => (_import "gtk_numerable_icon_new_with_style_context" : GioIconClass.C.notnull GioIconClass.C.p * GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p -> GioIconClass.C.notnull GioIconClass.C.p;) (x1, x2)
    val getBackgroundGicon_ = _import "gtk_numerable_icon_get_background_gicon" : GtkNumerableIconClass.C.notnull GtkNumerableIconClass.C.p -> GioIconClass.C.notnull GioIconClass.C.p;
    val getBackgroundIconName_ = _import "gtk_numerable_icon_get_background_icon_name" : GtkNumerableIconClass.C.notnull GtkNumerableIconClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getCount_ = _import "gtk_numerable_icon_get_count" : GtkNumerableIconClass.C.notnull GtkNumerableIconClass.C.p -> FFI.Int32.C.val_;
    val getLabel_ = _import "gtk_numerable_icon_get_label" : GtkNumerableIconClass.C.notnull GtkNumerableIconClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getStyleContext_ = _import "gtk_numerable_icon_get_style_context" : GtkNumerableIconClass.C.notnull GtkNumerableIconClass.C.p -> GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p;
    val setBackgroundGicon_ = fn x1 & x2 => (_import "gtk_numerable_icon_set_background_gicon" : GtkNumerableIconClass.C.notnull GtkNumerableIconClass.C.p * unit GioIconClass.C.p -> unit;) (x1, x2)
    val setBackgroundIconName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_numerable_icon_set_background_icon_name" :
              GtkNumerableIconClass.C.notnull GtkNumerableIconClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setCount_ = fn x1 & x2 => (_import "gtk_numerable_icon_set_count" : GtkNumerableIconClass.C.notnull GtkNumerableIconClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_numerable_icon_set_label" :
              GtkNumerableIconClass.C.notnull GtkNumerableIconClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setStyleContext_ = fn x1 & x2 => (_import "gtk_numerable_icon_set_style_context" : GtkNumerableIconClass.C.notnull GtkNumerableIconClass.C.p * GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p -> unit;) (x1, x2)
    type 'a class = 'a GtkNumerableIconClass.class
    type 'a style_context_class = 'a GtkStyleContextClass.class
    type t = base class
    fun asIcon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new baseIcon = (GioIconClass.C.withPtr ---> GioIconClass.C.fromPtr true) new_ baseIcon
    fun newWithStyleContext baseIcon context = (GioIconClass.C.withPtr &&&> GtkStyleContextClass.C.withPtr ---> GioIconClass.C.fromPtr true) newWithStyleContext_ (baseIcon & context)
    fun getBackgroundGicon self = (GtkNumerableIconClass.C.withPtr ---> GioIconClass.C.fromPtr false) getBackgroundGicon_ self
    fun getBackgroundIconName self = (GtkNumerableIconClass.C.withPtr ---> Utf8.C.fromPtr false) getBackgroundIconName_ self
    fun getCount self = (GtkNumerableIconClass.C.withPtr ---> FFI.Int32.C.fromVal) getCount_ self
    fun getLabel self = (GtkNumerableIconClass.C.withPtr ---> Utf8.C.fromPtr false) getLabel_ self
    fun getStyleContext self = (GtkNumerableIconClass.C.withPtr ---> GtkStyleContextClass.C.fromPtr false) getStyleContext_ self
    fun setBackgroundGicon self icon = (GtkNumerableIconClass.C.withPtr &&&> GioIconClass.C.withOptPtr ---> I) setBackgroundGicon_ (self & icon)
    fun setBackgroundIconName self iconName = (GtkNumerableIconClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setBackgroundIconName_ (self & iconName)
    fun setCount self count = (GtkNumerableIconClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setCount_ (self & count)
    fun setLabel self label = (GtkNumerableIconClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setLabel_ (self & label)
    fun setStyleContext self style = (GtkNumerableIconClass.C.withPtr &&&> GtkStyleContextClass.C.withPtr ---> I) setStyleContext_ (self & style)
    local
      open Property
    in
      val backgroundIconProp =
        {
          get = fn x => get "background-icon" GioIconClass.tOpt x,
          set = fn x => set "background-icon" GioIconClass.tOpt x
        }
      val backgroundIconNameProp =
        {
          get = fn x => get "background-icon-name" stringOpt x,
          set = fn x => set "background-icon-name" stringOpt x
        }
      val countProp =
        {
          get = fn x => get "count" int x,
          set = fn x => set "count" int x
        }
      val labelProp =
        {
          get = fn x => get "label" stringOpt x,
          set = fn x => set "label" stringOpt x
        }
      val styleContextProp =
        {
          get = fn x => get "style-context" GtkStyleContextClass.tOpt x,
          set = fn x => set "style-context" GtkStyleContextClass.tOpt x
        }
    end
  end

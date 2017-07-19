structure GtkNumerableIcon :>
  GTK_NUMERABLE_ICON
    where type 'a class = 'a GtkNumerableIconClass.class
    where type 'a style_context_class = 'a GtkStyleContextClass.class =
  struct
    val getType_ = _import "gtk_numerable_icon_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_numerable_icon_new" : GioIconClass.FFI.notnull GioIconClass.FFI.p -> GioIconClass.FFI.notnull GioIconClass.FFI.p;
    val newWithStyleContext_ = fn x1 & x2 => (_import "gtk_numerable_icon_new_with_style_context" : GioIconClass.FFI.notnull GioIconClass.FFI.p * GtkStyleContextClass.FFI.notnull GtkStyleContextClass.FFI.p -> GioIconClass.FFI.notnull GioIconClass.FFI.p;) (x1, x2)
    val getBackgroundGicon_ = _import "gtk_numerable_icon_get_background_gicon" : GtkNumerableIconClass.FFI.notnull GtkNumerableIconClass.FFI.p -> GioIconClass.FFI.notnull GioIconClass.FFI.p;
    val getBackgroundIconName_ = _import "gtk_numerable_icon_get_background_icon_name" : GtkNumerableIconClass.FFI.notnull GtkNumerableIconClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getCount_ = _import "gtk_numerable_icon_get_count" : GtkNumerableIconClass.FFI.notnull GtkNumerableIconClass.FFI.p -> GInt.FFI.val_;
    val getLabel_ = _import "gtk_numerable_icon_get_label" : GtkNumerableIconClass.FFI.notnull GtkNumerableIconClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getStyleContext_ = _import "gtk_numerable_icon_get_style_context" : GtkNumerableIconClass.FFI.notnull GtkNumerableIconClass.FFI.p -> GtkStyleContextClass.FFI.notnull GtkStyleContextClass.FFI.p;
    val setBackgroundGicon_ = fn x1 & x2 => (_import "gtk_numerable_icon_set_background_gicon" : GtkNumerableIconClass.FFI.notnull GtkNumerableIconClass.FFI.p * unit GioIconClass.FFI.p -> unit;) (x1, x2)
    val setBackgroundIconName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_numerable_icon_set_background_icon_name" :
              GtkNumerableIconClass.FFI.notnull GtkNumerableIconClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setCount_ = fn x1 & x2 => (_import "gtk_numerable_icon_set_count" : GtkNumerableIconClass.FFI.notnull GtkNumerableIconClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_numerable_icon_set_label" :
              GtkNumerableIconClass.FFI.notnull GtkNumerableIconClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setStyleContext_ = fn x1 & x2 => (_import "gtk_numerable_icon_set_style_context" : GtkNumerableIconClass.FFI.notnull GtkNumerableIconClass.FFI.p * GtkStyleContextClass.FFI.notnull GtkStyleContextClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkNumerableIconClass.class
    type 'a style_context_class = 'a GtkStyleContextClass.class
    type t = base class
    fun asIcon self = (GObjectObjectClass.FFI.withPtr ---> GioIconClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new baseIcon = (GioIconClass.FFI.withPtr ---> GioIconClass.FFI.fromPtr true) new_ baseIcon
    fun newWithStyleContext (baseIcon, context) = (GioIconClass.FFI.withPtr &&&> GtkStyleContextClass.FFI.withPtr ---> GioIconClass.FFI.fromPtr true) newWithStyleContext_ (baseIcon & context)
    fun getBackgroundGicon self = (GtkNumerableIconClass.FFI.withPtr ---> GioIconClass.FFI.fromPtr false) getBackgroundGicon_ self
    fun getBackgroundIconName self = (GtkNumerableIconClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getBackgroundIconName_ self
    fun getCount self = (GtkNumerableIconClass.FFI.withPtr ---> GInt.FFI.fromVal) getCount_ self
    fun getLabel self = (GtkNumerableIconClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getLabel_ self
    fun getStyleContext self = (GtkNumerableIconClass.FFI.withPtr ---> GtkStyleContextClass.FFI.fromPtr false) getStyleContext_ self
    fun setBackgroundGicon self icon = (GtkNumerableIconClass.FFI.withPtr &&&> GioIconClass.FFI.withOptPtr ---> I) setBackgroundGicon_ (self & icon)
    fun setBackgroundIconName self iconName = (GtkNumerableIconClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setBackgroundIconName_ (self & iconName)
    fun setCount self count = (GtkNumerableIconClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setCount_ (self & count)
    fun setLabel self label = (GtkNumerableIconClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setLabel_ (self & label)
    fun setStyleContext self style = (GtkNumerableIconClass.FFI.withPtr &&&> GtkStyleContextClass.FFI.withPtr ---> I) setStyleContext_ (self & style)
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

structure GtkNumerableIcon :>
  GTK_NUMERABLE_ICON
    where type 'a class = 'a GtkNumerableIconClass.class
    where type 'a style_context_class = 'a GtkStyleContextClass.class =
  struct
    val getType_ = _import "gtk_numerable_icon_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_numerable_icon_new" : GioIconClass.FFI.non_opt GioIconClass.FFI.p -> GioIconClass.FFI.non_opt GioIconClass.FFI.p;
    val newWithStyleContext_ = fn x1 & x2 => (_import "gtk_numerable_icon_new_with_style_context" : GioIconClass.FFI.non_opt GioIconClass.FFI.p * GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p -> GioIconClass.FFI.non_opt GioIconClass.FFI.p;) (x1, x2)
    val getBackgroundGicon_ = _import "gtk_numerable_icon_get_background_gicon" : GtkNumerableIconClass.FFI.non_opt GtkNumerableIconClass.FFI.p -> GioIconClass.FFI.opt GioIconClass.FFI.p;
    val getBackgroundIconName_ = _import "gtk_numerable_icon_get_background_icon_name" : GtkNumerableIconClass.FFI.non_opt GtkNumerableIconClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getCount_ = _import "gtk_numerable_icon_get_count" : GtkNumerableIconClass.FFI.non_opt GtkNumerableIconClass.FFI.p -> GInt32.FFI.val_;
    val getLabel_ = _import "gtk_numerable_icon_get_label" : GtkNumerableIconClass.FFI.non_opt GtkNumerableIconClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getStyleContext_ = _import "gtk_numerable_icon_get_style_context" : GtkNumerableIconClass.FFI.non_opt GtkNumerableIconClass.FFI.p -> GtkStyleContextClass.FFI.opt GtkStyleContextClass.FFI.p;
    val setBackgroundGicon_ = fn x1 & x2 => (_import "gtk_numerable_icon_set_background_gicon" : GtkNumerableIconClass.FFI.non_opt GtkNumerableIconClass.FFI.p * GioIconClass.FFI.opt GioIconClass.FFI.p -> unit;) (x1, x2)
    val setBackgroundIconName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_numerable_icon_set_background_icon_name" :
              GtkNumerableIconClass.FFI.non_opt GtkNumerableIconClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setCount_ = fn x1 & x2 => (_import "gtk_numerable_icon_set_count" : GtkNumerableIconClass.FFI.non_opt GtkNumerableIconClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_numerable_icon_set_label" :
              GtkNumerableIconClass.FFI.non_opt GtkNumerableIconClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setStyleContext_ = fn x1 & x2 => (_import "gtk_numerable_icon_set_style_context" : GtkNumerableIconClass.FFI.non_opt GtkNumerableIconClass.FFI.p * GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkNumerableIconClass.class
    type 'a style_context_class = 'a GtkStyleContextClass.class
    type t = base class
    fun asIcon self = (GObjectObjectClass.FFI.withPtr false ---> GioIconClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new baseIcon = (GioIconClass.FFI.withPtr false ---> GioIconClass.FFI.fromPtr true) new_ baseIcon
    fun newWithStyleContext (baseIcon, context) = (GioIconClass.FFI.withPtr false &&&> GtkStyleContextClass.FFI.withPtr false ---> GioIconClass.FFI.fromPtr true) newWithStyleContext_ (baseIcon & context)
    fun getBackgroundGicon self = (GtkNumerableIconClass.FFI.withPtr false ---> GioIconClass.FFI.fromOptPtr false) getBackgroundGicon_ self
    fun getBackgroundIconName self = (GtkNumerableIconClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getBackgroundIconName_ self
    fun getCount self = (GtkNumerableIconClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getCount_ self
    fun getLabel self = (GtkNumerableIconClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getLabel_ self
    fun getStyleContext self = (GtkNumerableIconClass.FFI.withPtr false ---> GtkStyleContextClass.FFI.fromOptPtr false) getStyleContext_ self
    fun setBackgroundGicon self icon = (GtkNumerableIconClass.FFI.withPtr false &&&> GioIconClass.FFI.withOptPtr false ---> I) setBackgroundGicon_ (self & icon)
    fun setBackgroundIconName self iconName = (GtkNumerableIconClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setBackgroundIconName_ (self & iconName)
    fun setCount self count = (GtkNumerableIconClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setCount_ (self & count)
    fun setLabel self label = (GtkNumerableIconClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setLabel_ (self & label)
    fun setStyleContext self style = (GtkNumerableIconClass.FFI.withPtr false &&&> GtkStyleContextClass.FFI.withPtr false ---> I) setStyleContext_ (self & style)
    local
      open ValueAccessor
    in
      val backgroundIconProp =
        {
          name = "background-icon",
          gtype = fn () => C.gtype GioIconClass.tOpt (),
          get = fn x => fn () => C.get GioIconClass.tOpt x,
          set = fn x => C.set GioIconClass.tOpt x,
          init = fn x => C.set GioIconClass.tOpt x
        }
      val backgroundIconNameProp =
        {
          name = "background-icon-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val countProp =
        {
          name = "count",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val labelProp =
        {
          name = "label",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val styleContextProp =
        {
          name = "style-context",
          gtype = fn () => C.gtype GtkStyleContextClass.tOpt (),
          get = fn x => fn () => C.get GtkStyleContextClass.tOpt x,
          set = fn x => C.set GtkStyleContextClass.tOpt x,
          init = fn x => C.set GtkStyleContextClass.tOpt x
        }
    end
  end

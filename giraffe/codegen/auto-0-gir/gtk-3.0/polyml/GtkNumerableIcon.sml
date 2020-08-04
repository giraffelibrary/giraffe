structure GtkNumerableIcon :>
  GTK_NUMERABLE_ICON
    where type 'a class = 'a GtkNumerableIconClass.class
    where type 'a style_context_class = 'a GtkStyleContextClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_numerable_icon_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_numerable_icon_new") (GioIconClass.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val newWithStyleContext_ = call (getSymbol "gtk_numerable_icon_new_with_style_context") (GioIconClass.PolyML.cPtr &&> GtkStyleContextClass.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val getBackgroundGicon_ = call (getSymbol "gtk_numerable_icon_get_background_gicon") (GtkNumerableIconClass.PolyML.cPtr --> GioIconClass.PolyML.cOptPtr)
      val getBackgroundIconName_ = call (getSymbol "gtk_numerable_icon_get_background_icon_name") (GtkNumerableIconClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getCount_ = call (getSymbol "gtk_numerable_icon_get_count") (GtkNumerableIconClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getLabel_ = call (getSymbol "gtk_numerable_icon_get_label") (GtkNumerableIconClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getStyleContext_ = call (getSymbol "gtk_numerable_icon_get_style_context") (GtkNumerableIconClass.PolyML.cPtr --> GtkStyleContextClass.PolyML.cOptPtr)
      val setBackgroundGicon_ = call (getSymbol "gtk_numerable_icon_set_background_gicon") (GtkNumerableIconClass.PolyML.cPtr &&> GioIconClass.PolyML.cOptPtr --> cVoid)
      val setBackgroundIconName_ = call (getSymbol "gtk_numerable_icon_set_background_icon_name") (GtkNumerableIconClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setCount_ = call (getSymbol "gtk_numerable_icon_set_count") (GtkNumerableIconClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setLabel_ = call (getSymbol "gtk_numerable_icon_set_label") (GtkNumerableIconClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setStyleContext_ = call (getSymbol "gtk_numerable_icon_set_style_context") (GtkNumerableIconClass.PolyML.cPtr &&> GtkStyleContextClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkNumerableIconClass.class
    type 'a style_context_class = 'a GtkStyleContextClass.class
    type t = base class
    fun asIcon self = (GObjectObjectClass.FFI.withPtr false ---> GioIconClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new baseIcon = (GioIconClass.FFI.withPtr false ---> GioIconClass.FFI.fromPtr true) new_ baseIcon
    fun newWithStyleContext (baseIcon, context) = (GioIconClass.FFI.withPtr false &&&> GtkStyleContextClass.FFI.withPtr false ---> GioIconClass.FFI.fromPtr true) newWithStyleContext_ (baseIcon & context)
    fun getBackgroundGicon self = (GtkNumerableIconClass.FFI.withPtr false ---> GioIconClass.FFI.fromOptPtr false) getBackgroundGicon_ self
    fun getBackgroundIconName self = (GtkNumerableIconClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getBackgroundIconName_ self
    fun getCount self = (GtkNumerableIconClass.FFI.withPtr false ---> GInt.FFI.fromVal) getCount_ self
    fun getLabel self = (GtkNumerableIconClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getLabel_ self
    fun getStyleContext self = (GtkNumerableIconClass.FFI.withPtr false ---> GtkStyleContextClass.FFI.fromOptPtr false) getStyleContext_ self
    fun setBackgroundGicon self icon = (GtkNumerableIconClass.FFI.withPtr false &&&> GioIconClass.FFI.withOptPtr false ---> I) setBackgroundGicon_ (self & icon)
    fun setBackgroundIconName self iconName = (GtkNumerableIconClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setBackgroundIconName_ (self & iconName)
    fun setCount self count = (GtkNumerableIconClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setCount_ (self & count)
    fun setLabel self label = (GtkNumerableIconClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setLabel_ (self & label)
    fun setStyleContext self style = (GtkNumerableIconClass.FFI.withPtr false &&&> GtkStyleContextClass.FFI.withPtr false ---> I) setStyleContext_ (self & style)
    local
      open Property
    in
      val backgroundIconProp =
        {
          get = fn x => get "background-icon" GioIconClass.tOpt x,
          set = fn x => set "background-icon" GioIconClass.tOpt x,
          new = fn x => new "background-icon" GioIconClass.tOpt x
        }
      val backgroundIconNameProp =
        {
          get = fn x => get "background-icon-name" stringOpt x,
          set = fn x => set "background-icon-name" stringOpt x,
          new = fn x => new "background-icon-name" stringOpt x
        }
      val countProp =
        {
          get = fn x => get "count" int x,
          set = fn x => set "count" int x,
          new = fn x => new "count" int x
        }
      val labelProp =
        {
          get = fn x => get "label" stringOpt x,
          set = fn x => set "label" stringOpt x,
          new = fn x => new "label" stringOpt x
        }
      val styleContextProp =
        {
          get = fn x => get "style-context" GtkStyleContextClass.tOpt x,
          set = fn x => set "style-context" GtkStyleContextClass.tOpt x,
          new = fn x => new "style-context" GtkStyleContextClass.tOpt x
        }
    end
  end

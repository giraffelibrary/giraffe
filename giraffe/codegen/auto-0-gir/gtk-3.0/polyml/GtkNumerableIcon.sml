structure GtkNumerableIcon :>
  GTK_NUMERABLE_ICON
    where type 'a class = 'a GtkNumerableIconClass.class
    where type 'a style_context_class = 'a GtkStyleContextClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_numerable_icon_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_numerable_icon_new") (GioIconClass.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val newWithStyleContext_ = call (getSymbol "gtk_numerable_icon_new_with_style_context") (GioIconClass.PolyML.cPtr &&> GtkStyleContextClass.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val getBackgroundGicon_ = call (getSymbol "gtk_numerable_icon_get_background_gicon") (GtkNumerableIconClass.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val getBackgroundIconName_ = call (getSymbol "gtk_numerable_icon_get_background_icon_name") (GtkNumerableIconClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getCount_ = call (getSymbol "gtk_numerable_icon_get_count") (GtkNumerableIconClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getLabel_ = call (getSymbol "gtk_numerable_icon_get_label") (GtkNumerableIconClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getStyleContext_ = call (getSymbol "gtk_numerable_icon_get_style_context") (GtkNumerableIconClass.PolyML.cPtr --> GtkStyleContextClass.PolyML.cPtr)
      val setBackgroundGicon_ = call (getSymbol "gtk_numerable_icon_set_background_gicon") (GtkNumerableIconClass.PolyML.cPtr &&> GioIconClass.PolyML.cOptPtr --> PolyMLFFI.cVoid)
      val setBackgroundIconName_ = call (getSymbol "gtk_numerable_icon_set_background_icon_name") (GtkNumerableIconClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> PolyMLFFI.cVoid)
      val setCount_ = call (getSymbol "gtk_numerable_icon_set_count") (GtkNumerableIconClass.PolyML.cPtr &&> GInt.PolyML.cVal --> PolyMLFFI.cVoid)
      val setLabel_ = call (getSymbol "gtk_numerable_icon_set_label") (GtkNumerableIconClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> PolyMLFFI.cVoid)
      val setStyleContext_ = call (getSymbol "gtk_numerable_icon_set_style_context") (GtkNumerableIconClass.PolyML.cPtr &&> GtkStyleContextClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkNumerableIconClass.class
    type 'a style_context_class = 'a GtkStyleContextClass.class
    type t = base class
    fun asIcon self = (GObjectObjectClass.FFI.withPtr ---> GioIconClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new baseIcon = (GioIconClass.FFI.withPtr ---> GioIconClass.FFI.fromPtr true) new_ baseIcon
    fun newWithStyleContext baseIcon context = (GioIconClass.FFI.withPtr &&&> GtkStyleContextClass.FFI.withPtr ---> GioIconClass.FFI.fromPtr true) newWithStyleContext_ (baseIcon & context)
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

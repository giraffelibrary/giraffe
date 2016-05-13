structure GtkNumerableIcon :>
  GTK_NUMERABLE_ICON
    where type 'a class = 'a GtkNumerableIconClass.class
    where type 'a style_context_class = 'a GtkStyleContextClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_numerable_icon_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_numerable_icon_new") (GioIconClass.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val newWithStyleContext_ = call (load_sym libgtk "gtk_numerable_icon_new_with_style_context") (GioIconClass.PolyML.cPtr &&> GtkStyleContextClass.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val getBackgroundGicon_ = call (load_sym libgtk "gtk_numerable_icon_get_background_gicon") (GtkNumerableIconClass.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val getBackgroundIconName_ = call (load_sym libgtk "gtk_numerable_icon_get_background_icon_name") (GtkNumerableIconClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getCount_ = call (load_sym libgtk "gtk_numerable_icon_get_count") (GtkNumerableIconClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getLabel_ = call (load_sym libgtk "gtk_numerable_icon_get_label") (GtkNumerableIconClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getStyleContext_ = call (load_sym libgtk "gtk_numerable_icon_get_style_context") (GtkNumerableIconClass.PolyML.cPtr --> GtkStyleContextClass.PolyML.cPtr)
      val setBackgroundGicon_ = call (load_sym libgtk "gtk_numerable_icon_set_background_gicon") (GtkNumerableIconClass.PolyML.cPtr &&> GioIconClass.PolyML.cOptPtr --> PolyMLFFI.cVoid)
      val setBackgroundIconName_ = call (load_sym libgtk "gtk_numerable_icon_set_background_icon_name") (GtkNumerableIconClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> PolyMLFFI.cVoid)
      val setCount_ = call (load_sym libgtk "gtk_numerable_icon_set_count") (GtkNumerableIconClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> PolyMLFFI.cVoid)
      val setLabel_ = call (load_sym libgtk "gtk_numerable_icon_set_label") (GtkNumerableIconClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> PolyMLFFI.cVoid)
      val setStyleContext_ = call (load_sym libgtk "gtk_numerable_icon_set_style_context") (GtkNumerableIconClass.PolyML.cPtr &&> GtkStyleContextClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
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

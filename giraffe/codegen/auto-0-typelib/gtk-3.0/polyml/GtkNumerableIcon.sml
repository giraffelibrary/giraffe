structure GtkNumerableIcon :>
  GTK_NUMERABLE_ICON
    where type 'a class_t = 'a GtkNumerableIconClass.t
    where type 'a style_context_class_t = 'a GtkStyleContextClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_numerable_icon_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_numerable_icon_new") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val newWithStyleContext_ = call (load_sym libgtk "gtk_numerable_icon_new_with_style_context") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getBackgroundGicon_ = call (load_sym libgtk "gtk_numerable_icon_get_background_gicon") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getBackgroundIconName_ = call (load_sym libgtk "gtk_numerable_icon_get_background_icon_name") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getCount_ = call (load_sym libgtk "gtk_numerable_icon_get_count") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getLabel_ = call (load_sym libgtk "gtk_numerable_icon_get_label") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getStyleContext_ = call (load_sym libgtk "gtk_numerable_icon_get_style_context") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val setBackgroundGicon_ = call (load_sym libgtk "gtk_numerable_icon_set_background_gicon") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setBackgroundIconName_ = call (load_sym libgtk "gtk_numerable_icon_set_background_icon_name") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
      val setCount_ = call (load_sym libgtk "gtk_numerable_icon_set_count") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setLabel_ = call (load_sym libgtk "gtk_numerable_icon_set_label") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
      val setStyleContext_ = call (load_sym libgtk "gtk_numerable_icon_set_style_context") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GtkNumerableIconClass.t
    type 'a style_context_class_t = 'a GtkStyleContextClass.t
    type t = base class_t
    fun asIcon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new baseIcon = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr true) new_ baseIcon
    fun newWithStyleContext baseIcon context = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr true) newWithStyleContext_ (baseIcon & context)
    fun getBackgroundGicon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr false) getBackgroundGicon_ self
    fun getBackgroundIconName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getBackgroundIconName_ self
    fun getCount self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getCount_ self
    fun getLabel self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getLabel_ self
    fun getStyleContext self = (GObjectObjectClass.C.withPtr ---> GtkStyleContextClass.C.fromPtr false) getStyleContext_ self
    fun setBackgroundGicon self icon = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setBackgroundGicon_ (self & icon)
    fun setBackgroundIconName self iconName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setBackgroundIconName_ (self & iconName)
    fun setCount self count = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setCount_ (self & count)
    fun setLabel self label = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setLabel_ (self & label)
    fun setStyleContext self style = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setStyleContext_ (self & style)
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

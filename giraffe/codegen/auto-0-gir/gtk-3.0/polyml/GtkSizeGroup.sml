structure GtkSizeGroup :>
  GTK_SIZE_GROUP
    where type 'a class = 'a GtkSizeGroupClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type size_group_mode_t = GtkSizeGroupMode.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_size_group_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_size_group_new") (GtkSizeGroupMode.PolyML.cVal --> GtkSizeGroupClass.PolyML.cPtr)
      val addWidget_ = call (getSymbol "gtk_size_group_add_widget") (GtkSizeGroupClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> cVoid)
      val getIgnoreHidden_ = call (getSymbol "gtk_size_group_get_ignore_hidden") (GtkSizeGroupClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getMode_ = call (getSymbol "gtk_size_group_get_mode") (GtkSizeGroupClass.PolyML.cPtr --> GtkSizeGroupMode.PolyML.cVal)
      val removeWidget_ = call (getSymbol "gtk_size_group_remove_widget") (GtkSizeGroupClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> cVoid)
      val setIgnoreHidden_ = call (getSymbol "gtk_size_group_set_ignore_hidden") (GtkSizeGroupClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setMode_ = call (getSymbol "gtk_size_group_set_mode") (GtkSizeGroupClass.PolyML.cPtr &&> GtkSizeGroupMode.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkSizeGroupClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type size_group_mode_t = GtkSizeGroupMode.t
    type t = base class
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new mode = (GtkSizeGroupMode.FFI.withVal ---> GtkSizeGroupClass.FFI.fromPtr true) new_ mode
    fun addWidget self widget = (GtkSizeGroupClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I) addWidget_ (self & widget)
    fun getIgnoreHidden self = (GtkSizeGroupClass.FFI.withPtr false ---> GBool.FFI.fromVal) getIgnoreHidden_ self
    fun getMode self = (GtkSizeGroupClass.FFI.withPtr false ---> GtkSizeGroupMode.FFI.fromVal) getMode_ self
    fun removeWidget self widget = (GtkSizeGroupClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I) removeWidget_ (self & widget)
    fun setIgnoreHidden self ignoreHidden = (GtkSizeGroupClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setIgnoreHidden_ (self & ignoreHidden)
    fun setMode self mode = (GtkSizeGroupClass.FFI.withPtr false &&&> GtkSizeGroupMode.FFI.withVal ---> I) setMode_ (self & mode)
    local
      open Property
    in
      val ignoreHiddenProp =
        {
          get = fn x => get "ignore-hidden" boolean x,
          set = fn x => set "ignore-hidden" boolean x,
          new = fn x => new "ignore-hidden" boolean x
        }
      val modeProp =
        {
          get = fn x => get "mode" GtkSizeGroupMode.t x,
          set = fn x => set "mode" GtkSizeGroupMode.t x,
          new = fn x => new "mode" GtkSizeGroupMode.t x
        }
    end
  end

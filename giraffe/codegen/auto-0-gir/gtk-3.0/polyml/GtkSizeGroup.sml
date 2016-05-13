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
      val getType_ = call (load_sym libgtk "gtk_size_group_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_size_group_new") (GtkSizeGroupMode.PolyML.cVal --> GtkSizeGroupClass.PolyML.cPtr)
      val addWidget_ = call (load_sym libgtk "gtk_size_group_add_widget") (GtkSizeGroupClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val getIgnoreHidden_ = call (load_sym libgtk "gtk_size_group_get_ignore_hidden") (GtkSizeGroupClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getMode_ = call (load_sym libgtk "gtk_size_group_get_mode") (GtkSizeGroupClass.PolyML.cPtr --> GtkSizeGroupMode.PolyML.cVal)
      val removeWidget_ = call (load_sym libgtk "gtk_size_group_remove_widget") (GtkSizeGroupClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setIgnoreHidden_ = call (load_sym libgtk "gtk_size_group_set_ignore_hidden") (GtkSizeGroupClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setMode_ = call (load_sym libgtk "gtk_size_group_set_mode") (GtkSizeGroupClass.PolyML.cPtr &&> GtkSizeGroupMode.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkSizeGroupClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type size_group_mode_t = GtkSizeGroupMode.t
    type t = base class
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new mode = (GtkSizeGroupMode.C.withVal ---> GtkSizeGroupClass.C.fromPtr true) new_ mode
    fun addWidget self widget = (GtkSizeGroupClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> I) addWidget_ (self & widget)
    fun getIgnoreHidden self = (GtkSizeGroupClass.C.withPtr ---> FFI.Bool.C.fromVal) getIgnoreHidden_ self
    fun getMode self = (GtkSizeGroupClass.C.withPtr ---> GtkSizeGroupMode.C.fromVal) getMode_ self
    fun removeWidget self widget = (GtkSizeGroupClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> I) removeWidget_ (self & widget)
    fun setIgnoreHidden self ignoreHidden = (GtkSizeGroupClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setIgnoreHidden_ (self & ignoreHidden)
    fun setMode self mode = (GtkSizeGroupClass.C.withPtr &&&> GtkSizeGroupMode.C.withVal ---> I) setMode_ (self & mode)
    local
      open Property
    in
      val ignoreHiddenProp =
        {
          get = fn x => get "ignore-hidden" boolean x,
          set = fn x => set "ignore-hidden" boolean x
        }
      val modeProp =
        {
          get = fn x => get "mode" GtkSizeGroupMode.t x,
          set = fn x => set "mode" GtkSizeGroupMode.t x
        }
    end
  end

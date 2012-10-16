structure GtkSizeGroup :>
  GTK_SIZE_GROUP
    where type 'a class_t = 'a GtkSizeGroupClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t
    where type sizegroupmode_t = GtkSizeGroupMode.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_size_group_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_size_group_new") (GtkSizeGroupMode.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val addWidget_ = call (load_sym libgtk "gtk_size_group_add_widget") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getIgnoreHidden_ = call (load_sym libgtk "gtk_size_group_get_ignore_hidden") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getMode_ = call (load_sym libgtk "gtk_size_group_get_mode") (GObjectObjectClass.PolyML.PTR --> GtkSizeGroupMode.PolyML.VAL)
      val removeWidget_ = call (load_sym libgtk "gtk_size_group_remove_widget") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setIgnoreHidden_ = call (load_sym libgtk "gtk_size_group_set_ignore_hidden") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setMode_ = call (load_sym libgtk "gtk_size_group_set_mode") (GObjectObjectClass.PolyML.PTR &&> GtkSizeGroupMode.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkSizeGroupClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    type sizegroupmode_t = GtkSizeGroupMode.t
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new mode = (GtkSizeGroupMode.C.withVal ---> GtkSizeGroupClass.C.fromPtr true) new_ mode
    fun addWidget self widget = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) addWidget_ (self & widget)
    fun getIgnoreHidden self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getIgnoreHidden_ self
    fun getMode self = (GObjectObjectClass.C.withPtr ---> GtkSizeGroupMode.C.fromVal) getMode_ self
    fun removeWidget self widget = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) removeWidget_ (self & widget)
    fun setIgnoreHidden self ignoreHidden = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setIgnoreHidden_ (self & ignoreHidden)
    fun setMode self mode = (GObjectObjectClass.C.withPtr &&&> GtkSizeGroupMode.C.withVal ---> I) setMode_ (self & mode)
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

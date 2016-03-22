structure GtkSizeGroup :>
  GTK_SIZE_GROUP
    where type 'a class = 'a GtkSizeGroupClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type size_group_mode_t = GtkSizeGroupMode.t =
  struct
    val getType_ = _import "gtk_size_group_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_size_group_new" : GtkSizeGroupMode.C.val_ -> GtkSizeGroupClass.C.notnull GtkSizeGroupClass.C.p;
    val addWidget_ = fn x1 & x2 => (_import "gtk_size_group_add_widget" : GtkSizeGroupClass.C.notnull GtkSizeGroupClass.C.p * GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;) (x1, x2)
    val getIgnoreHidden_ = _import "gtk_size_group_get_ignore_hidden" : GtkSizeGroupClass.C.notnull GtkSizeGroupClass.C.p -> FFI.Bool.C.val_;
    val getMode_ = _import "gtk_size_group_get_mode" : GtkSizeGroupClass.C.notnull GtkSizeGroupClass.C.p -> GtkSizeGroupMode.C.val_;
    val removeWidget_ = fn x1 & x2 => (_import "gtk_size_group_remove_widget" : GtkSizeGroupClass.C.notnull GtkSizeGroupClass.C.p * GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;) (x1, x2)
    val setIgnoreHidden_ = fn x1 & x2 => (_import "gtk_size_group_set_ignore_hidden" : GtkSizeGroupClass.C.notnull GtkSizeGroupClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setMode_ = fn x1 & x2 => (_import "gtk_size_group_set_mode" : GtkSizeGroupClass.C.notnull GtkSizeGroupClass.C.p * GtkSizeGroupMode.C.val_ -> unit;) (x1, x2)
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

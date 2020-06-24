structure GtkSizeGroup :>
  GTK_SIZE_GROUP
    where type 'a class = 'a GtkSizeGroupClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type size_group_mode_t = GtkSizeGroupMode.t =
  struct
    val getType_ = _import "gtk_size_group_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_size_group_new" : GtkSizeGroupMode.FFI.val_ -> GtkSizeGroupClass.FFI.non_opt GtkSizeGroupClass.FFI.p;
    val addWidget_ = fn x1 & x2 => (_import "gtk_size_group_add_widget" : GtkSizeGroupClass.FFI.non_opt GtkSizeGroupClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val getIgnoreHidden_ = _import "gtk_size_group_get_ignore_hidden" : GtkSizeGroupClass.FFI.non_opt GtkSizeGroupClass.FFI.p -> GBool.FFI.val_;
    val getMode_ = _import "gtk_size_group_get_mode" : GtkSizeGroupClass.FFI.non_opt GtkSizeGroupClass.FFI.p -> GtkSizeGroupMode.FFI.val_;
    val removeWidget_ = fn x1 & x2 => (_import "gtk_size_group_remove_widget" : GtkSizeGroupClass.FFI.non_opt GtkSizeGroupClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setIgnoreHidden_ = fn x1 & x2 => (_import "gtk_size_group_set_ignore_hidden" : GtkSizeGroupClass.FFI.non_opt GtkSizeGroupClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setMode_ = fn x1 & x2 => (_import "gtk_size_group_set_mode" : GtkSizeGroupClass.FFI.non_opt GtkSizeGroupClass.FFI.p * GtkSizeGroupMode.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkSizeGroupClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type size_group_mode_t = GtkSizeGroupMode.t
    type t = base class
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new mode = (GtkSizeGroupMode.FFI.withVal ---> GtkSizeGroupClass.FFI.fromPtr true) new_ mode
    fun addWidget self widget = (GtkSizeGroupClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> I) addWidget_ (self & widget)
    fun getIgnoreHidden self = (GtkSizeGroupClass.FFI.withPtr ---> GBool.FFI.fromVal) getIgnoreHidden_ self
    fun getMode self = (GtkSizeGroupClass.FFI.withPtr ---> GtkSizeGroupMode.FFI.fromVal) getMode_ self
    fun removeWidget self widget = (GtkSizeGroupClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> I) removeWidget_ (self & widget)
    fun setIgnoreHidden self ignoreHidden = (GtkSizeGroupClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setIgnoreHidden_ (self & ignoreHidden)
    fun setMode self mode = (GtkSizeGroupClass.FFI.withPtr &&&> GtkSizeGroupMode.FFI.withVal ---> I) setMode_ (self & mode)
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

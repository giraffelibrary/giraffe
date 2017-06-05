structure GtkToolItemGroup :>
  GTK_TOOL_ITEM_GROUP
    where type 'a class = 'a GtkToolItemGroupClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a tool_shell_class = 'a GtkToolShellClass.class
    where type 'a tool_item_class = 'a GtkToolItemClass.class
    where type relief_style_t = GtkReliefStyle.t
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_tool_item_group_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_gtk_tool_item_group_new" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getCollapsed_ = _import "gtk_tool_item_group_get_collapsed" : GtkToolItemGroupClass.FFI.notnull GtkToolItemGroupClass.FFI.p -> GBool.FFI.val_;
    val getDropItem_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tool_item_group_get_drop_item" :
              GtkToolItemGroupClass.FFI.notnull GtkToolItemGroupClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> GtkToolItemClass.FFI.notnull GtkToolItemClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getEllipsize_ = _import "gtk_tool_item_group_get_ellipsize" : GtkToolItemGroupClass.FFI.notnull GtkToolItemGroupClass.FFI.p -> PangoEllipsizeMode.FFI.val_;
    val getHeaderRelief_ = _import "gtk_tool_item_group_get_header_relief" : GtkToolItemGroupClass.FFI.notnull GtkToolItemGroupClass.FFI.p -> GtkReliefStyle.FFI.val_;
    val getItemPosition_ = fn x1 & x2 => (_import "gtk_tool_item_group_get_item_position" : GtkToolItemGroupClass.FFI.notnull GtkToolItemGroupClass.FFI.p * GtkToolItemClass.FFI.notnull GtkToolItemClass.FFI.p -> GInt.FFI.val_;) (x1, x2)
    val getLabel_ = _import "gtk_tool_item_group_get_label" : GtkToolItemGroupClass.FFI.notnull GtkToolItemGroupClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getLabelWidget_ = _import "gtk_tool_item_group_get_label_widget" : GtkToolItemGroupClass.FFI.notnull GtkToolItemGroupClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getNItems_ = _import "gtk_tool_item_group_get_n_items" : GtkToolItemGroupClass.FFI.notnull GtkToolItemGroupClass.FFI.p -> GUInt.FFI.val_;
    val getNthItem_ = fn x1 & x2 => (_import "gtk_tool_item_group_get_nth_item" : GtkToolItemGroupClass.FFI.notnull GtkToolItemGroupClass.FFI.p * GUInt.FFI.val_ -> GtkToolItemClass.FFI.notnull GtkToolItemClass.FFI.p;) (x1, x2)
    val insert_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tool_item_group_insert" :
              GtkToolItemGroupClass.FFI.notnull GtkToolItemGroupClass.FFI.p
               * GtkToolItemClass.FFI.notnull GtkToolItemClass.FFI.p
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setCollapsed_ = fn x1 & x2 => (_import "gtk_tool_item_group_set_collapsed" : GtkToolItemGroupClass.FFI.notnull GtkToolItemGroupClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setEllipsize_ = fn x1 & x2 => (_import "gtk_tool_item_group_set_ellipsize" : GtkToolItemGroupClass.FFI.notnull GtkToolItemGroupClass.FFI.p * PangoEllipsizeMode.FFI.val_ -> unit;) (x1, x2)
    val setHeaderRelief_ = fn x1 & x2 => (_import "gtk_tool_item_group_set_header_relief" : GtkToolItemGroupClass.FFI.notnull GtkToolItemGroupClass.FFI.p * GtkReliefStyle.FFI.val_ -> unit;) (x1, x2)
    val setItemPosition_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tool_item_group_set_item_position" :
              GtkToolItemGroupClass.FFI.notnull GtkToolItemGroupClass.FFI.p
               * GtkToolItemClass.FFI.notnull GtkToolItemClass.FFI.p
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_tool_item_group_set_label" :
              GtkToolItemGroupClass.FFI.notnull GtkToolItemGroupClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setLabelWidget_ = fn x1 & x2 => (_import "gtk_tool_item_group_set_label_widget" : GtkToolItemGroupClass.FFI.notnull GtkToolItemGroupClass.FFI.p * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkToolItemGroupClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a tool_shell_class = 'a GtkToolShellClass.class
    type 'a tool_item_class = 'a GtkToolItemClass.class
    type relief_style_t = GtkReliefStyle.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asToolShell self = (GObjectObjectClass.FFI.withPtr ---> GtkToolShellClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new label = (Utf8.FFI.withPtr ---> GtkToolItemGroupClass.FFI.fromPtr false) new_ label
    fun getCollapsed self = (GtkToolItemGroupClass.FFI.withPtr ---> GBool.FFI.fromVal) getCollapsed_ self
    fun getDropItem self x y =
      (
        GtkToolItemGroupClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> GtkToolItemClass.FFI.fromPtr false
      )
        getDropItem_
        (
          self
           & x
           & y
        )
    fun getEllipsize self = (GtkToolItemGroupClass.FFI.withPtr ---> PangoEllipsizeMode.FFI.fromVal) getEllipsize_ self
    fun getHeaderRelief self = (GtkToolItemGroupClass.FFI.withPtr ---> GtkReliefStyle.FFI.fromVal) getHeaderRelief_ self
    fun getItemPosition self item = (GtkToolItemGroupClass.FFI.withPtr &&&> GtkToolItemClass.FFI.withPtr ---> GInt.FFI.fromVal) getItemPosition_ (self & item)
    fun getLabel self = (GtkToolItemGroupClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getLabel_ self
    fun getLabelWidget self = (GtkToolItemGroupClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getLabelWidget_ self
    fun getNItems self = (GtkToolItemGroupClass.FFI.withPtr ---> GUInt.FFI.fromVal) getNItems_ self
    fun getNthItem self index = (GtkToolItemGroupClass.FFI.withPtr &&&> GUInt.FFI.withVal ---> GtkToolItemClass.FFI.fromPtr false) getNthItem_ (self & index)
    fun insert self item position =
      (
        GtkToolItemGroupClass.FFI.withPtr
         &&&> GtkToolItemClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         ---> I
      )
        insert_
        (
          self
           & item
           & position
        )
    fun setCollapsed self collapsed = (GtkToolItemGroupClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setCollapsed_ (self & collapsed)
    fun setEllipsize self ellipsize = (GtkToolItemGroupClass.FFI.withPtr &&&> PangoEllipsizeMode.FFI.withVal ---> I) setEllipsize_ (self & ellipsize)
    fun setHeaderRelief self style = (GtkToolItemGroupClass.FFI.withPtr &&&> GtkReliefStyle.FFI.withVal ---> I) setHeaderRelief_ (self & style)
    fun setItemPosition self item position =
      (
        GtkToolItemGroupClass.FFI.withPtr
         &&&> GtkToolItemClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         ---> I
      )
        setItemPosition_
        (
          self
           & item
           & position
        )
    fun setLabel self label = (GtkToolItemGroupClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setLabel_ (self & label)
    fun setLabelWidget self labelWidget = (GtkToolItemGroupClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> I) setLabelWidget_ (self & labelWidget)
    local
      open Property
    in
      val collapsedProp =
        {
          get = fn x => get "collapsed" boolean x,
          set = fn x => set "collapsed" boolean x
        }
      val ellipsizeProp =
        {
          get = fn x => get "ellipsize" PangoEllipsizeMode.t x,
          set = fn x => set "ellipsize" PangoEllipsizeMode.t x
        }
      val headerReliefProp =
        {
          get = fn x => get "header-relief" GtkReliefStyle.t x,
          set = fn x => set "header-relief" GtkReliefStyle.t x
        }
      val labelProp =
        {
          get = fn x => get "label" stringOpt x,
          set = fn x => set "label" stringOpt x
        }
      val labelWidgetProp =
        {
          get = fn x => get "label-widget" GtkWidgetClass.tOpt x,
          set = fn x => set "label-widget" GtkWidgetClass.tOpt x
        }
    end
  end

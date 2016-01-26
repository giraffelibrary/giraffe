structure GtkToolItemGroup :>
  GTK_TOOL_ITEM_GROUP
    where type 'a class_t = 'a GtkToolItemGroupClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a tool_shell_class_t = 'a GtkToolShellClass.t
    where type 'a tool_item_class_t = 'a GtkToolItemClass.t
    where type relief_style_t = GtkReliefStyle.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t =
  struct
    val getType_ = _import "gtk_tool_item_group_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "mlton_gtk_tool_item_group_new" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getCollapsed_ = _import "gtk_tool_item_group_get_collapsed" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getDropItem_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tool_item_group_get_drop_item" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getEllipsize_ = _import "gtk_tool_item_group_get_ellipsize" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> PangoEllipsizeMode.C.val_;
    val getHeaderRelief_ = _import "gtk_tool_item_group_get_header_relief" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkReliefStyle.C.val_;
    val getItemPosition_ = fn x1 & x2 => (_import "gtk_tool_item_group_get_item_position" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;) (x1, x2)
    val getLabel_ = _import "gtk_tool_item_group_get_label" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getLabelWidget_ = _import "gtk_tool_item_group_get_label_widget" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getNItems_ = _import "gtk_tool_item_group_get_n_items" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt32.C.val_;
    val getNthItem_ = fn x1 & x2 => (_import "gtk_tool_item_group_get_nth_item" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt32.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val insert_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tool_item_group_insert" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setCollapsed_ = fn x1 & x2 => (_import "gtk_tool_item_group_set_collapsed" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setEllipsize_ = fn x1 & x2 => (_import "gtk_tool_item_group_set_ellipsize" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * PangoEllipsizeMode.C.val_ -> unit;) (x1, x2)
    val setHeaderRelief_ = fn x1 & x2 => (_import "gtk_tool_item_group_set_header_relief" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkReliefStyle.C.val_ -> unit;) (x1, x2)
    val setItemPosition_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tool_item_group_set_item_position" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.C.val_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setLabelWidget_ = fn x1 & x2 => (_import "gtk_tool_item_group_set_label_widget" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    type 'a class_t = 'a GtkToolItemGroupClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a tool_shell_class_t = 'a GtkToolShellClass.t
    type 'a tool_item_class_t = 'a GtkToolItemClass.t
    type relief_style_t = GtkReliefStyle.t
    type 'a widget_class_t = 'a GtkWidgetClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asToolShell self = (GObjectObjectClass.C.withPtr ---> GtkToolShellClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new label = (FFI.String.C.withConstPtr ---> GtkToolItemGroupClass.C.fromPtr false) new_ label
    fun getCollapsed self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getCollapsed_ self
    fun getDropItem self x y =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> GtkToolItemClass.C.fromPtr false
      )
        getDropItem_
        (
          self
           & x
           & y
        )
    fun getEllipsize self = (GObjectObjectClass.C.withPtr ---> PangoEllipsizeMode.C.fromVal) getEllipsize_ self
    fun getHeaderRelief self = (GObjectObjectClass.C.withPtr ---> GtkReliefStyle.C.fromVal) getHeaderRelief_ self
    fun getItemPosition self item = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getItemPosition_ (self & item)
    fun getLabel self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getLabel_ self
    fun getLabelWidget self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getLabelWidget_ self
    fun getNItems self = (GObjectObjectClass.C.withPtr ---> FFI.UInt32.C.fromVal) getNItems_ self
    fun getNthItem self index = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> GtkToolItemClass.C.fromPtr false) getNthItem_ (self & index)
    fun insert self item position =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        insert_
        (
          self
           & item
           & position
        )
    fun setCollapsed self collapsed = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setCollapsed_ (self & collapsed)
    fun setEllipsize self ellipsize = (GObjectObjectClass.C.withPtr &&&> PangoEllipsizeMode.C.withVal ---> I) setEllipsize_ (self & ellipsize)
    fun setHeaderRelief self style = (GObjectObjectClass.C.withPtr &&&> GtkReliefStyle.C.withVal ---> I) setHeaderRelief_ (self & style)
    fun setItemPosition self item position =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        setItemPosition_
        (
          self
           & item
           & position
        )
    fun setLabel self label = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setLabel_ (self & label)
    fun setLabelWidget self labelWidget = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setLabelWidget_ (self & labelWidget)
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

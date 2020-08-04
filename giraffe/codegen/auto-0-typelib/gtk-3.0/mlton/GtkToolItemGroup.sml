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
    val new_ = _import "mlton_gtk_tool_item_group_new" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getCollapsed_ = _import "gtk_tool_item_group_get_collapsed" : GtkToolItemGroupClass.FFI.non_opt GtkToolItemGroupClass.FFI.p -> GBool.FFI.val_;
    val getDropItem_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tool_item_group_get_drop_item" :
              GtkToolItemGroupClass.FFI.non_opt GtkToolItemGroupClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> GtkToolItemClass.FFI.non_opt GtkToolItemClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getEllipsize_ = _import "gtk_tool_item_group_get_ellipsize" : GtkToolItemGroupClass.FFI.non_opt GtkToolItemGroupClass.FFI.p -> PangoEllipsizeMode.FFI.val_;
    val getHeaderRelief_ = _import "gtk_tool_item_group_get_header_relief" : GtkToolItemGroupClass.FFI.non_opt GtkToolItemGroupClass.FFI.p -> GtkReliefStyle.FFI.val_;
    val getItemPosition_ = fn x1 & x2 => (_import "gtk_tool_item_group_get_item_position" : GtkToolItemGroupClass.FFI.non_opt GtkToolItemGroupClass.FFI.p * GtkToolItemClass.FFI.non_opt GtkToolItemClass.FFI.p -> GInt32.FFI.val_;) (x1, x2)
    val getLabel_ = _import "gtk_tool_item_group_get_label" : GtkToolItemGroupClass.FFI.non_opt GtkToolItemGroupClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getLabelWidget_ = _import "gtk_tool_item_group_get_label_widget" : GtkToolItemGroupClass.FFI.non_opt GtkToolItemGroupClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getNItems_ = _import "gtk_tool_item_group_get_n_items" : GtkToolItemGroupClass.FFI.non_opt GtkToolItemGroupClass.FFI.p -> GUInt32.FFI.val_;
    val getNthItem_ = fn x1 & x2 => (_import "gtk_tool_item_group_get_nth_item" : GtkToolItemGroupClass.FFI.non_opt GtkToolItemGroupClass.FFI.p * GUInt32.FFI.val_ -> GtkToolItemClass.FFI.non_opt GtkToolItemClass.FFI.p;) (x1, x2)
    val insert_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tool_item_group_insert" :
              GtkToolItemGroupClass.FFI.non_opt GtkToolItemGroupClass.FFI.p
               * GtkToolItemClass.FFI.non_opt GtkToolItemClass.FFI.p
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setCollapsed_ = fn x1 & x2 => (_import "gtk_tool_item_group_set_collapsed" : GtkToolItemGroupClass.FFI.non_opt GtkToolItemGroupClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setEllipsize_ = fn x1 & x2 => (_import "gtk_tool_item_group_set_ellipsize" : GtkToolItemGroupClass.FFI.non_opt GtkToolItemGroupClass.FFI.p * PangoEllipsizeMode.FFI.val_ -> unit;) (x1, x2)
    val setHeaderRelief_ = fn x1 & x2 => (_import "gtk_tool_item_group_set_header_relief" : GtkToolItemGroupClass.FFI.non_opt GtkToolItemGroupClass.FFI.p * GtkReliefStyle.FFI.val_ -> unit;) (x1, x2)
    val setItemPosition_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tool_item_group_set_item_position" :
              GtkToolItemGroupClass.FFI.non_opt GtkToolItemGroupClass.FFI.p
               * GtkToolItemClass.FFI.non_opt GtkToolItemClass.FFI.p
               * GInt32.FFI.val_
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
              GtkToolItemGroupClass.FFI.non_opt GtkToolItemGroupClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setLabelWidget_ = fn x1 & x2 => (_import "gtk_tool_item_group_set_label_widget" : GtkToolItemGroupClass.FFI.non_opt GtkToolItemGroupClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkToolItemGroupClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a tool_shell_class = 'a GtkToolShellClass.class
    type 'a tool_item_class = 'a GtkToolItemClass.class
    type relief_style_t = GtkReliefStyle.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asToolShell self = (GObjectObjectClass.FFI.withPtr false ---> GtkToolShellClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new label = (Utf8.FFI.withPtr 0 ---> GtkToolItemGroupClass.FFI.fromPtr false) new_ label
    fun getCollapsed self = (GtkToolItemGroupClass.FFI.withPtr false ---> GBool.FFI.fromVal) getCollapsed_ self
    fun getDropItem self (x, y) =
      (
        GtkToolItemGroupClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> GtkToolItemClass.FFI.fromPtr false
      )
        getDropItem_
        (
          self
           & x
           & y
        )
    fun getEllipsize self = (GtkToolItemGroupClass.FFI.withPtr false ---> PangoEllipsizeMode.FFI.fromVal) getEllipsize_ self
    fun getHeaderRelief self = (GtkToolItemGroupClass.FFI.withPtr false ---> GtkReliefStyle.FFI.fromVal) getHeaderRelief_ self
    fun getItemPosition self item = (GtkToolItemGroupClass.FFI.withPtr false &&&> GtkToolItemClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getItemPosition_ (self & item)
    fun getLabel self = (GtkToolItemGroupClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getLabel_ self
    fun getLabelWidget self = (GtkToolItemGroupClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getLabelWidget_ self
    fun getNItems self = (GtkToolItemGroupClass.FFI.withPtr false ---> GUInt32.FFI.fromVal) getNItems_ self
    fun getNthItem self index = (GtkToolItemGroupClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> GtkToolItemClass.FFI.fromPtr false) getNthItem_ (self & index)
    fun insert self (item, position) =
      (
        GtkToolItemGroupClass.FFI.withPtr false
         &&&> GtkToolItemClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         ---> I
      )
        insert_
        (
          self
           & item
           & position
        )
    fun setCollapsed self collapsed = (GtkToolItemGroupClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setCollapsed_ (self & collapsed)
    fun setEllipsize self ellipsize = (GtkToolItemGroupClass.FFI.withPtr false &&&> PangoEllipsizeMode.FFI.withVal ---> I) setEllipsize_ (self & ellipsize)
    fun setHeaderRelief self style = (GtkToolItemGroupClass.FFI.withPtr false &&&> GtkReliefStyle.FFI.withVal ---> I) setHeaderRelief_ (self & style)
    fun setItemPosition self (item, position) =
      (
        GtkToolItemGroupClass.FFI.withPtr false
         &&&> GtkToolItemClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         ---> I
      )
        setItemPosition_
        (
          self
           & item
           & position
        )
    fun setLabel self label = (GtkToolItemGroupClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setLabel_ (self & label)
    fun setLabelWidget self labelWidget = (GtkToolItemGroupClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I) setLabelWidget_ (self & labelWidget)
    local
      open Property
    in
      val collapsedProp =
        {
          get = fn x => get "collapsed" boolean x,
          set = fn x => set "collapsed" boolean x,
          new = fn x => new "collapsed" boolean x
        }
      val ellipsizeProp =
        {
          get = fn x => get "ellipsize" PangoEllipsizeMode.t x,
          set = fn x => set "ellipsize" PangoEllipsizeMode.t x,
          new = fn x => new "ellipsize" PangoEllipsizeMode.t x
        }
      val headerReliefProp =
        {
          get = fn x => get "header-relief" GtkReliefStyle.t x,
          set = fn x => set "header-relief" GtkReliefStyle.t x,
          new = fn x => new "header-relief" GtkReliefStyle.t x
        }
      val labelProp =
        {
          get = fn x => get "label" stringOpt x,
          set = fn x => set "label" stringOpt x,
          new = fn x => new "label" stringOpt x
        }
      val labelWidgetProp =
        {
          get = fn x => get "label-widget" GtkWidgetClass.tOpt x,
          set = fn x => set "label-widget" GtkWidgetClass.tOpt x,
          new = fn x => new "label-widget" GtkWidgetClass.tOpt x
        }
    end
  end

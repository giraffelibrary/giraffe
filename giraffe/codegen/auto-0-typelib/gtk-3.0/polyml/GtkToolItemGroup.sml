structure GtkToolItemGroup :>
  GTK_TOOL_ITEM_GROUP
    where type 'a class = 'a GtkToolItemGroupClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a tool_shell_class = 'a GtkToolShellClass.class
    where type 'a tool_item_class = 'a GtkToolItemClass.class
    where type relief_style_t = GtkReliefStyle.t
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_tool_item_group_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_tool_item_group_new") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val getCollapsed_ = call (getSymbol "gtk_tool_item_group_get_collapsed") (GtkToolItemGroupClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getDropItem_ =
        call (getSymbol "gtk_tool_item_group_get_drop_item")
          (
            GtkToolItemGroupClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> GtkToolItemClass.PolyML.cPtr
          )
      val getEllipsize_ = call (getSymbol "gtk_tool_item_group_get_ellipsize") (GtkToolItemGroupClass.PolyML.cPtr --> PangoEllipsizeMode.PolyML.cVal)
      val getHeaderRelief_ = call (getSymbol "gtk_tool_item_group_get_header_relief") (GtkToolItemGroupClass.PolyML.cPtr --> GtkReliefStyle.PolyML.cVal)
      val getItemPosition_ = call (getSymbol "gtk_tool_item_group_get_item_position") (GtkToolItemGroupClass.PolyML.cPtr &&> GtkToolItemClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getLabel_ = call (getSymbol "gtk_tool_item_group_get_label") (GtkToolItemGroupClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getLabelWidget_ = call (getSymbol "gtk_tool_item_group_get_label_widget") (GtkToolItemGroupClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getNItems_ = call (getSymbol "gtk_tool_item_group_get_n_items") (GtkToolItemGroupClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getNthItem_ = call (getSymbol "gtk_tool_item_group_get_nth_item") (GtkToolItemGroupClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> GtkToolItemClass.PolyML.cPtr)
      val insert_ =
        call (getSymbol "gtk_tool_item_group_insert")
          (
            GtkToolItemGroupClass.PolyML.cPtr
             &&> GtkToolItemClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val setCollapsed_ = call (getSymbol "gtk_tool_item_group_set_collapsed") (GtkToolItemGroupClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setEllipsize_ = call (getSymbol "gtk_tool_item_group_set_ellipsize") (GtkToolItemGroupClass.PolyML.cPtr &&> PangoEllipsizeMode.PolyML.cVal --> cVoid)
      val setHeaderRelief_ = call (getSymbol "gtk_tool_item_group_set_header_relief") (GtkToolItemGroupClass.PolyML.cPtr &&> GtkReliefStyle.PolyML.cVal --> cVoid)
      val setItemPosition_ =
        call (getSymbol "gtk_tool_item_group_set_item_position")
          (
            GtkToolItemGroupClass.PolyML.cPtr
             &&> GtkToolItemClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val setLabel_ = call (getSymbol "gtk_tool_item_group_set_label") (GtkToolItemGroupClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setLabelWidget_ = call (getSymbol "gtk_tool_item_group_set_label_widget") (GtkToolItemGroupClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> cVoid)
    end
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
    fun getEllipsize self = (GtkToolItemGroupClass.FFI.withPtr ---> PangoEllipsizeMode.FFI.fromVal) getEllipsize_ self
    fun getHeaderRelief self = (GtkToolItemGroupClass.FFI.withPtr ---> GtkReliefStyle.FFI.fromVal) getHeaderRelief_ self
    fun getItemPosition self item = (GtkToolItemGroupClass.FFI.withPtr &&&> GtkToolItemClass.FFI.withPtr ---> GInt32.FFI.fromVal) getItemPosition_ (self & item)
    fun getLabel self = (GtkToolItemGroupClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getLabel_ self
    fun getLabelWidget self = (GtkToolItemGroupClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getLabelWidget_ self
    fun getNItems self = (GtkToolItemGroupClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getNItems_ self
    fun getNthItem self index = (GtkToolItemGroupClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> GtkToolItemClass.FFI.fromPtr false) getNthItem_ (self & index)
    fun insert self item position =
      (
        GtkToolItemGroupClass.FFI.withPtr
         &&&> GtkToolItemClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
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
         &&&> GInt32.FFI.withVal
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

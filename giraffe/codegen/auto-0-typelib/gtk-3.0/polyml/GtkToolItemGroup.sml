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
      open ValueAccessor
    in
      val collapsedProp =
        {
          name = "collapsed",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val ellipsizeProp =
        {
          name = "ellipsize",
          gtype = fn () => C.gtype PangoEllipsizeMode.t (),
          get = fn x => fn () => C.get PangoEllipsizeMode.t x,
          set = fn x => C.set PangoEllipsizeMode.t x,
          init = fn x => C.set PangoEllipsizeMode.t x
        }
      val headerReliefProp =
        {
          name = "header-relief",
          gtype = fn () => C.gtype GtkReliefStyle.t (),
          get = fn x => fn () => C.get GtkReliefStyle.t x,
          set = fn x => C.set GtkReliefStyle.t x,
          init = fn x => C.set GtkReliefStyle.t x
        }
      val labelProp =
        {
          name = "label",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val labelWidgetProp =
        {
          name = "label-widget",
          gtype = fn () => C.gtype GtkWidgetClass.tOpt (),
          get = fn x => fn () => C.get GtkWidgetClass.tOpt x,
          set = fn x => C.set GtkWidgetClass.tOpt x,
          init = fn x => C.set GtkWidgetClass.tOpt x
        }
    end
  end

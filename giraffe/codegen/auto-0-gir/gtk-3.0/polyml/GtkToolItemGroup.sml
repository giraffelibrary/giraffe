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
      val getType_ = call (load_sym libgtk "gtk_tool_item_group_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_tool_item_group_new") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val getCollapsed_ = call (load_sym libgtk "gtk_tool_item_group_get_collapsed") (GtkToolItemGroupClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getDropItem_ =
        call (load_sym libgtk "gtk_tool_item_group_get_drop_item")
          (
            GtkToolItemGroupClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             --> GtkToolItemClass.PolyML.cPtr
          )
      val getEllipsize_ = call (load_sym libgtk "gtk_tool_item_group_get_ellipsize") (GtkToolItemGroupClass.PolyML.cPtr --> PangoEllipsizeMode.PolyML.cVal)
      val getHeaderRelief_ = call (load_sym libgtk "gtk_tool_item_group_get_header_relief") (GtkToolItemGroupClass.PolyML.cPtr --> GtkReliefStyle.PolyML.cVal)
      val getItemPosition_ = call (load_sym libgtk "gtk_tool_item_group_get_item_position") (GtkToolItemGroupClass.PolyML.cPtr &&> GtkToolItemClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getLabel_ = call (load_sym libgtk "gtk_tool_item_group_get_label") (GtkToolItemGroupClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getLabelWidget_ = call (load_sym libgtk "gtk_tool_item_group_get_label_widget") (GtkToolItemGroupClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getNItems_ = call (load_sym libgtk "gtk_tool_item_group_get_n_items") (GtkToolItemGroupClass.PolyML.cPtr --> FFI.UInt.PolyML.cVal)
      val getNthItem_ = call (load_sym libgtk "gtk_tool_item_group_get_nth_item") (GtkToolItemGroupClass.PolyML.cPtr &&> FFI.UInt.PolyML.cVal --> GtkToolItemClass.PolyML.cPtr)
      val insert_ =
        call (load_sym libgtk "gtk_tool_item_group_insert")
          (
            GtkToolItemGroupClass.PolyML.cPtr
             &&> GtkToolItemClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setCollapsed_ = call (load_sym libgtk "gtk_tool_item_group_set_collapsed") (GtkToolItemGroupClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setEllipsize_ = call (load_sym libgtk "gtk_tool_item_group_set_ellipsize") (GtkToolItemGroupClass.PolyML.cPtr &&> PangoEllipsizeMode.PolyML.cVal --> PolyMLFFI.cVoid)
      val setHeaderRelief_ = call (load_sym libgtk "gtk_tool_item_group_set_header_relief") (GtkToolItemGroupClass.PolyML.cPtr &&> GtkReliefStyle.PolyML.cVal --> PolyMLFFI.cVoid)
      val setItemPosition_ =
        call (load_sym libgtk "gtk_tool_item_group_set_item_position")
          (
            GtkToolItemGroupClass.PolyML.cPtr
             &&> GtkToolItemClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setLabel_ = call (load_sym libgtk "gtk_tool_item_group_set_label") (GtkToolItemGroupClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setLabelWidget_ = call (load_sym libgtk "gtk_tool_item_group_set_label_widget") (GtkToolItemGroupClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkToolItemGroupClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a tool_shell_class = 'a GtkToolShellClass.class
    type 'a tool_item_class = 'a GtkToolItemClass.class
    type relief_style_t = GtkReliefStyle.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asToolShell self = (GObjectObjectClass.C.withPtr ---> GtkToolShellClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new label = (Utf8.C.withPtr ---> GtkToolItemGroupClass.C.fromPtr false) new_ label
    fun getCollapsed self = (GtkToolItemGroupClass.C.withPtr ---> FFI.Bool.C.fromVal) getCollapsed_ self
    fun getDropItem self x y =
      (
        GtkToolItemGroupClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> GtkToolItemClass.C.fromPtr false
      )
        getDropItem_
        (
          self
           & x
           & y
        )
    fun getEllipsize self = (GtkToolItemGroupClass.C.withPtr ---> PangoEllipsizeMode.C.fromVal) getEllipsize_ self
    fun getHeaderRelief self = (GtkToolItemGroupClass.C.withPtr ---> GtkReliefStyle.C.fromVal) getHeaderRelief_ self
    fun getItemPosition self item = (GtkToolItemGroupClass.C.withPtr &&&> GtkToolItemClass.C.withPtr ---> FFI.Int.C.fromVal) getItemPosition_ (self & item)
    fun getLabel self = (GtkToolItemGroupClass.C.withPtr ---> Utf8.C.fromPtr false) getLabel_ self
    fun getLabelWidget self = (GtkToolItemGroupClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getLabelWidget_ self
    fun getNItems self = (GtkToolItemGroupClass.C.withPtr ---> FFI.UInt.C.fromVal) getNItems_ self
    fun getNthItem self index = (GtkToolItemGroupClass.C.withPtr &&&> FFI.UInt.C.withVal ---> GtkToolItemClass.C.fromPtr false) getNthItem_ (self & index)
    fun insert self item position =
      (
        GtkToolItemGroupClass.C.withPtr
         &&&> GtkToolItemClass.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> I
      )
        insert_
        (
          self
           & item
           & position
        )
    fun setCollapsed self collapsed = (GtkToolItemGroupClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setCollapsed_ (self & collapsed)
    fun setEllipsize self ellipsize = (GtkToolItemGroupClass.C.withPtr &&&> PangoEllipsizeMode.C.withVal ---> I) setEllipsize_ (self & ellipsize)
    fun setHeaderRelief self style = (GtkToolItemGroupClass.C.withPtr &&&> GtkReliefStyle.C.withVal ---> I) setHeaderRelief_ (self & style)
    fun setItemPosition self item position =
      (
        GtkToolItemGroupClass.C.withPtr
         &&&> GtkToolItemClass.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> I
      )
        setItemPosition_
        (
          self
           & item
           & position
        )
    fun setLabel self label = (GtkToolItemGroupClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setLabel_ (self & label)
    fun setLabelWidget self labelWidget = (GtkToolItemGroupClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> I) setLabelWidget_ (self & labelWidget)
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

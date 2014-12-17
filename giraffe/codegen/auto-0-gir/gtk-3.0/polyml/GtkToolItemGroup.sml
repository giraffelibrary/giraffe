structure GtkToolItemGroup :>
  GTK_TOOL_ITEM_GROUP
    where type 'a class_t = 'a GtkToolItemGroupClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a toolshellclass_t = 'a GtkToolShellClass.t
    where type 'a toolitemclass_t = 'a GtkToolItemClass.t
    where type reliefstyle_t = GtkReliefStyle.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_tool_item_group_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_tool_item_group_new") (FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val getCollapsed_ = call (load_sym libgtk "gtk_tool_item_group_get_collapsed") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getDropItem_ =
        call (load_sym libgtk "gtk_tool_item_group_get_drop_item")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             --> GObjectObjectClass.PolyML.PTR
          )
      val getEllipsize_ = call (load_sym libgtk "gtk_tool_item_group_get_ellipsize") (GObjectObjectClass.PolyML.PTR --> PangoEllipsizeMode.PolyML.VAL)
      val getHeaderRelief_ = call (load_sym libgtk "gtk_tool_item_group_get_header_relief") (GObjectObjectClass.PolyML.PTR --> GtkReliefStyle.PolyML.VAL)
      val getItemPosition_ = call (load_sym libgtk "gtk_tool_item_group_get_item_position") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val getLabel_ = call (load_sym libgtk "gtk_tool_item_group_get_label") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getLabelWidget_ = call (load_sym libgtk "gtk_tool_item_group_get_label_widget") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getNItems_ = call (load_sym libgtk "gtk_tool_item_group_get_n_items") (GObjectObjectClass.PolyML.PTR --> FFI.UInt.PolyML.VAL)
      val getNthItem_ = call (load_sym libgtk "gtk_tool_item_group_get_nth_item") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val insert_ =
        call (load_sym libgtk "gtk_tool_item_group_insert")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setCollapsed_ = call (load_sym libgtk "gtk_tool_item_group_set_collapsed") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setEllipsize_ = call (load_sym libgtk "gtk_tool_item_group_set_ellipsize") (GObjectObjectClass.PolyML.PTR &&> PangoEllipsizeMode.PolyML.VAL --> FFI.PolyML.VOID)
      val setHeaderRelief_ = call (load_sym libgtk "gtk_tool_item_group_set_header_relief") (GObjectObjectClass.PolyML.PTR &&> GtkReliefStyle.PolyML.VAL --> FFI.PolyML.VOID)
      val setItemPosition_ =
        call (load_sym libgtk "gtk_tool_item_group_set_item_position")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setLabel_ = call (load_sym libgtk "gtk_tool_item_group_set_label") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setLabelWidget_ = call (load_sym libgtk "gtk_tool_item_group_set_label_widget") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkToolItemGroupClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a toolshellclass_t = 'a GtkToolShellClass.t
    type 'a toolitemclass_t = 'a GtkToolItemClass.t
    type reliefstyle_t = GtkReliefStyle.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
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
    fun getEllipsize self = (GObjectObjectClass.C.withPtr ---> PangoEllipsizeMode.C.fromVal) getEllipsize_ self
    fun getHeaderRelief self = (GObjectObjectClass.C.withPtr ---> GtkReliefStyle.C.fromVal) getHeaderRelief_ self
    fun getItemPosition self item = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getItemPosition_ (self & item)
    fun getLabel self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getLabel_ self
    fun getLabelWidget self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getLabelWidget_ self
    fun getNItems self = (GObjectObjectClass.C.withPtr ---> FFI.UInt.C.fromVal) getNItems_ self
    fun getNthItem self index = (GObjectObjectClass.C.withPtr &&&> FFI.UInt.C.withVal ---> GtkToolItemClass.C.fromPtr false) getNthItem_ (self & index)
    fun insert self item position =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
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
         &&&> FFI.Int.C.withVal
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

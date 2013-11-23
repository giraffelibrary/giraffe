structure GtkToolPalette :>
  GTK_TOOL_PALETTE
    where type 'a class_t = 'a GtkToolPaletteClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a orientableclass_t = 'a GtkOrientableClass.t
    where type 'a scrollableclass_t = 'a GtkScrollableClass.t
    where type targetentryrecord_t = GtkTargetEntryRecord.t
    where type destdefaults_t = GtkDestDefaults.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t
    where type selectiondatarecord_t = GtkSelectionDataRecord.t
    where type 'a toolitemclass_t = 'a GtkToolItemClass.t
    where type toolpalettedragtargets_t = GtkToolPaletteDragTargets.t
    where type 'a toolitemgroupclass_t = 'a GtkToolItemGroupClass.t
    where type iconsize_t = GtkIconSize.t
    where type toolbarstyle_t = GtkToolbarStyle.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_tool_palette_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_tool_palette_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getDragTargetGroup_ = call (load_sym libgtk "gtk_tool_palette_get_drag_target_group") (FFI.PolyML.VOID --> GtkTargetEntryRecord.PolyML.PTR)
      val getDragTargetItem_ = call (load_sym libgtk "gtk_tool_palette_get_drag_target_item") (FFI.PolyML.VOID --> GtkTargetEntryRecord.PolyML.PTR)
      val addDragDest_ =
        call (load_sym libgtk "gtk_tool_palette_add_drag_dest")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GtkDestDefaults.PolyML.VAL
             &&> GtkToolPaletteDragTargets.PolyML.VAL
             &&> GdkDragAction.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val getDragItem_ = call (load_sym libgtk "gtk_tool_palette_get_drag_item") (GObjectObjectClass.PolyML.PTR &&> GtkSelectionDataRecord.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getDropGroup_ =
        call (load_sym libgtk "gtk_tool_palette_get_drop_group")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             --> GObjectObjectClass.PolyML.PTR
          )
      val getDropItem_ =
        call (load_sym libgtk "gtk_tool_palette_get_drop_item")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             --> GObjectObjectClass.PolyML.PTR
          )
      val getExclusive_ = call (load_sym libgtk "gtk_tool_palette_get_exclusive") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getExpand_ = call (load_sym libgtk "gtk_tool_palette_get_expand") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getGroupPosition_ = call (load_sym libgtk "gtk_tool_palette_get_group_position") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val getIconSize_ = call (load_sym libgtk "gtk_tool_palette_get_icon_size") (GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val getStyle_ = call (load_sym libgtk "gtk_tool_palette_get_style") (GObjectObjectClass.PolyML.PTR --> GtkToolbarStyle.PolyML.VAL)
      val setDragSource_ = call (load_sym libgtk "gtk_tool_palette_set_drag_source") (GObjectObjectClass.PolyML.PTR &&> GtkToolPaletteDragTargets.PolyML.VAL --> FFI.PolyML.VOID)
      val setExclusive_ =
        call (load_sym libgtk "gtk_tool_palette_set_exclusive")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Bool.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setExpand_ =
        call (load_sym libgtk "gtk_tool_palette_set_expand")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Bool.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setGroupPosition_ =
        call (load_sym libgtk "gtk_tool_palette_set_group_position")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setIconSize_ = call (load_sym libgtk "gtk_tool_palette_set_icon_size") (GObjectObjectClass.PolyML.PTR &&> FFI.Int.PolyML.VAL --> FFI.PolyML.VOID)
      val setStyle_ = call (load_sym libgtk "gtk_tool_palette_set_style") (GObjectObjectClass.PolyML.PTR &&> GtkToolbarStyle.PolyML.VAL --> FFI.PolyML.VOID)
      val unsetIconSize_ = call (load_sym libgtk "gtk_tool_palette_unset_icon_size") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val unsetStyle_ = call (load_sym libgtk "gtk_tool_palette_unset_style") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkToolPaletteClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a orientableclass_t = 'a GtkOrientableClass.t
    type 'a scrollableclass_t = 'a GtkScrollableClass.t
    type targetentryrecord_t = GtkTargetEntryRecord.t
    type destdefaults_t = GtkDestDefaults.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    type selectiondatarecord_t = GtkSelectionDataRecord.t
    type 'a toolitemclass_t = 'a GtkToolItemClass.t
    type toolpalettedragtargets_t = GtkToolPaletteDragTargets.t
    type 'a toolitemgroupclass_t = 'a GtkToolItemGroupClass.t
    type iconsize_t = GtkIconSize.t
    type toolbarstyle_t = GtkToolbarStyle.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.C.withPtr ---> GtkScrollableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkToolPaletteClass.C.fromPtr false) new_ ()
    fun getDragTargetGroup () = (I ---> GtkTargetEntryRecord.C.fromPtr false) getDragTargetGroup_ ()
    fun getDragTargetItem () = (I ---> GtkTargetEntryRecord.C.fromPtr false) getDragTargetItem_ ()
    fun addDragDest self widget flags targets actions =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GtkDestDefaults.C.withVal
         &&&> GtkToolPaletteDragTargets.C.withVal
         &&&> GdkDragAction.C.withVal
         ---> I
      )
        addDragDest_
        (
          self
           & widget
           & flags
           & targets
           & actions
        )
    fun getDragItem self selection = (GObjectObjectClass.C.withPtr &&&> GtkSelectionDataRecord.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getDragItem_ (self & selection)
    fun getDropGroup self x y =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> GtkToolItemGroupClass.C.fromPtr false
      )
        getDropGroup_
        (
          self
           & x
           & y
        )
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
    fun getExclusive self group = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getExclusive_ (self & group)
    fun getExpand self group = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getExpand_ (self & group)
    fun getGroupPosition self group = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getGroupPosition_ (self & group)
    fun getIconSize self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getIconSize_ self
    fun getStyle self = (GObjectObjectClass.C.withPtr ---> GtkToolbarStyle.C.fromVal) getStyle_ self
    fun setDragSource self targets = (GObjectObjectClass.C.withPtr &&&> GtkToolPaletteDragTargets.C.withVal ---> I) setDragSource_ (self & targets)
    fun setExclusive self group exclusive =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        setExclusive_
        (
          self
           & group
           & exclusive
        )
    fun setExpand self group expand =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        setExpand_
        (
          self
           & group
           & expand
        )
    fun setGroupPosition self group position =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> I
      )
        setGroupPosition_
        (
          self
           & group
           & position
        )
    fun setIconSize self iconSize = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setIconSize_ (self & iconSize)
    fun setStyle self style = (GObjectObjectClass.C.withPtr &&&> GtkToolbarStyle.C.withVal ---> I) setStyle_ (self & style)
    fun unsetIconSize self = (GObjectObjectClass.C.withPtr ---> I) unsetIconSize_ self
    fun unsetStyle self = (GObjectObjectClass.C.withPtr ---> I) unsetStyle_ self
    local
      open Property
    in
      val iconSizeProp =
        {
          get = fn x => get "icon-size" GtkIconSize.t x,
          set = fn x => set "icon-size" GtkIconSize.t x
        }
      val iconSizeSetProp =
        {
          get = fn x => get "icon-size-set" boolean x,
          set = fn x => set "icon-size-set" boolean x
        }
      val toolbarStyleProp =
        {
          get = fn x => get "toolbar-style" GtkToolbarStyle.t x,
          set = fn x => set "toolbar-style" GtkToolbarStyle.t x
        }
    end
  end

structure GtkToolPalette :>
  GTK_TOOL_PALETTE
    where type 'a class = 'a GtkToolPaletteClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type 'a scrollable_class = 'a GtkScrollableClass.class
    where type target_entry_t = GtkTargetEntryRecord.t
    where type dest_defaults_t = GtkDestDefaults.t
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type selection_data_t = GtkSelectionDataRecord.t
    where type 'a tool_item_class = 'a GtkToolItemClass.class
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class
    where type tool_palette_drag_targets_t = GtkToolPaletteDragTargets.t
    where type 'a tool_item_group_class = 'a GtkToolItemGroupClass.class
    where type icon_size_t = GtkIconSize.t
    where type toolbar_style_t = GtkToolbarStyle.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_tool_palette_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_tool_palette_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val getDragTargetGroup_ = call (getSymbol "gtk_tool_palette_get_drag_target_group") (cVoid --> GtkTargetEntryRecord.PolyML.cPtr)
      val getDragTargetItem_ = call (getSymbol "gtk_tool_palette_get_drag_target_item") (cVoid --> GtkTargetEntryRecord.PolyML.cPtr)
      val addDragDest_ =
        call (getSymbol "gtk_tool_palette_add_drag_dest")
          (
            GtkToolPaletteClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GtkDestDefaults.PolyML.cVal
             &&> GtkToolPaletteDragTargets.PolyML.cVal
             &&> GdkDragAction.PolyML.cVal
             --> cVoid
          )
      val getDragItem_ = call (getSymbol "gtk_tool_palette_get_drag_item") (GtkToolPaletteClass.PolyML.cPtr &&> GtkSelectionDataRecord.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getDropGroup_ =
        call (getSymbol "gtk_tool_palette_get_drop_group")
          (
            GtkToolPaletteClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> GtkToolItemGroupClass.PolyML.cOptPtr
          )
      val getDropItem_ =
        call (getSymbol "gtk_tool_palette_get_drop_item")
          (
            GtkToolPaletteClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> GtkToolItemClass.PolyML.cOptPtr
          )
      val getExclusive_ = call (getSymbol "gtk_tool_palette_get_exclusive") (GtkToolPaletteClass.PolyML.cPtr &&> GtkToolItemGroupClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getExpand_ = call (getSymbol "gtk_tool_palette_get_expand") (GtkToolPaletteClass.PolyML.cPtr &&> GtkToolItemGroupClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getGroupPosition_ = call (getSymbol "gtk_tool_palette_get_group_position") (GtkToolPaletteClass.PolyML.cPtr &&> GtkToolItemGroupClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getHadjustment_ = call (getSymbol "gtk_tool_palette_get_hadjustment") (GtkToolPaletteClass.PolyML.cPtr --> GtkAdjustmentClass.PolyML.cPtr)
      val getIconSize_ = call (getSymbol "gtk_tool_palette_get_icon_size") (GtkToolPaletteClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getStyle_ = call (getSymbol "gtk_tool_palette_get_style") (GtkToolPaletteClass.PolyML.cPtr --> GtkToolbarStyle.PolyML.cVal)
      val getVadjustment_ = call (getSymbol "gtk_tool_palette_get_vadjustment") (GtkToolPaletteClass.PolyML.cPtr --> GtkAdjustmentClass.PolyML.cPtr)
      val setDragSource_ = call (getSymbol "gtk_tool_palette_set_drag_source") (GtkToolPaletteClass.PolyML.cPtr &&> GtkToolPaletteDragTargets.PolyML.cVal --> cVoid)
      val setExclusive_ =
        call (getSymbol "gtk_tool_palette_set_exclusive")
          (
            GtkToolPaletteClass.PolyML.cPtr
             &&> GtkToolItemGroupClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val setExpand_ =
        call (getSymbol "gtk_tool_palette_set_expand")
          (
            GtkToolPaletteClass.PolyML.cPtr
             &&> GtkToolItemGroupClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val setGroupPosition_ =
        call (getSymbol "gtk_tool_palette_set_group_position")
          (
            GtkToolPaletteClass.PolyML.cPtr
             &&> GtkToolItemGroupClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val setIconSize_ = call (getSymbol "gtk_tool_palette_set_icon_size") (GtkToolPaletteClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setStyle_ = call (getSymbol "gtk_tool_palette_set_style") (GtkToolPaletteClass.PolyML.cPtr &&> GtkToolbarStyle.PolyML.cVal --> cVoid)
      val unsetIconSize_ = call (getSymbol "gtk_tool_palette_unset_icon_size") (GtkToolPaletteClass.PolyML.cPtr --> cVoid)
      val unsetStyle_ = call (getSymbol "gtk_tool_palette_unset_style") (GtkToolPaletteClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkToolPaletteClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type 'a scrollable_class = 'a GtkScrollableClass.class
    type target_entry_t = GtkTargetEntryRecord.t
    type dest_defaults_t = GtkDestDefaults.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type selection_data_t = GtkSelectionDataRecord.t
    type 'a tool_item_class = 'a GtkToolItemClass.class
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type tool_palette_drag_targets_t = GtkToolPaletteDragTargets.t
    type 'a tool_item_group_class = 'a GtkToolItemGroupClass.class
    type icon_size_t = GtkIconSize.t
    type toolbar_style_t = GtkToolbarStyle.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr false ---> GtkOrientableClass.FFI.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.FFI.withPtr false ---> GtkScrollableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkToolPaletteClass.FFI.fromPtr false) new_ ()
    fun getDragTargetGroup () = (I ---> GtkTargetEntryRecord.FFI.fromPtr false) getDragTargetGroup_ ()
    fun getDragTargetItem () = (I ---> GtkTargetEntryRecord.FFI.fromPtr false) getDragTargetItem_ ()
    fun addDragDest
      self
      (
        widget,
        flags,
        targets,
        actions
      ) =
      (
        GtkToolPaletteClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GtkDestDefaults.FFI.withVal
         &&&> GtkToolPaletteDragTargets.FFI.withVal
         &&&> GdkDragAction.FFI.withVal
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
    fun getDragItem self selection = (GtkToolPaletteClass.FFI.withPtr false &&&> GtkSelectionDataRecord.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getDragItem_ (self & selection)
    fun getDropGroup self (x, y) =
      (
        GtkToolPaletteClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> GtkToolItemGroupClass.FFI.fromOptPtr false
      )
        getDropGroup_
        (
          self
           & x
           & y
        )
    fun getDropItem self (x, y) =
      (
        GtkToolPaletteClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> GtkToolItemClass.FFI.fromOptPtr false
      )
        getDropItem_
        (
          self
           & x
           & y
        )
    fun getExclusive self group = (GtkToolPaletteClass.FFI.withPtr false &&&> GtkToolItemGroupClass.FFI.withPtr false ---> GBool.FFI.fromVal) getExclusive_ (self & group)
    fun getExpand self group = (GtkToolPaletteClass.FFI.withPtr false &&&> GtkToolItemGroupClass.FFI.withPtr false ---> GBool.FFI.fromVal) getExpand_ (self & group)
    fun getGroupPosition self group = (GtkToolPaletteClass.FFI.withPtr false &&&> GtkToolItemGroupClass.FFI.withPtr false ---> GInt.FFI.fromVal) getGroupPosition_ (self & group)
    fun getHadjustment self = (GtkToolPaletteClass.FFI.withPtr false ---> GtkAdjustmentClass.FFI.fromPtr false) getHadjustment_ self
    fun getIconSize self = (GtkToolPaletteClass.FFI.withPtr false ---> GInt.FFI.fromVal) getIconSize_ self
    fun getStyle self = (GtkToolPaletteClass.FFI.withPtr false ---> GtkToolbarStyle.FFI.fromVal) getStyle_ self
    fun getVadjustment self = (GtkToolPaletteClass.FFI.withPtr false ---> GtkAdjustmentClass.FFI.fromPtr false) getVadjustment_ self
    fun setDragSource self targets = (GtkToolPaletteClass.FFI.withPtr false &&&> GtkToolPaletteDragTargets.FFI.withVal ---> I) setDragSource_ (self & targets)
    fun setExclusive self (group, exclusive) =
      (
        GtkToolPaletteClass.FFI.withPtr false
         &&&> GtkToolItemGroupClass.FFI.withPtr false
         &&&> GBool.FFI.withVal
         ---> I
      )
        setExclusive_
        (
          self
           & group
           & exclusive
        )
    fun setExpand self (group, expand) =
      (
        GtkToolPaletteClass.FFI.withPtr false
         &&&> GtkToolItemGroupClass.FFI.withPtr false
         &&&> GBool.FFI.withVal
         ---> I
      )
        setExpand_
        (
          self
           & group
           & expand
        )
    fun setGroupPosition self (group, position) =
      (
        GtkToolPaletteClass.FFI.withPtr false
         &&&> GtkToolItemGroupClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         ---> I
      )
        setGroupPosition_
        (
          self
           & group
           & position
        )
    fun setIconSize self iconSize = (GtkToolPaletteClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setIconSize_ (self & iconSize)
    fun setStyle self style = (GtkToolPaletteClass.FFI.withPtr false &&&> GtkToolbarStyle.FFI.withVal ---> I) setStyle_ (self & style)
    fun unsetIconSize self = (GtkToolPaletteClass.FFI.withPtr false ---> I) unsetIconSize_ self
    fun unsetStyle self = (GtkToolPaletteClass.FFI.withPtr false ---> I) unsetStyle_ self
    local
      open Property
    in
      val iconSizeProp =
        {
          get = fn x => get "icon-size" GtkIconSize.t x,
          set = fn x => set "icon-size" GtkIconSize.t x,
          new = fn x => new "icon-size" GtkIconSize.t x
        }
      val iconSizeSetProp =
        {
          get = fn x => get "icon-size-set" boolean x,
          set = fn x => set "icon-size-set" boolean x,
          new = fn x => new "icon-size-set" boolean x
        }
      val toolbarStyleProp =
        {
          get = fn x => get "toolbar-style" GtkToolbarStyle.t x,
          set = fn x => set "toolbar-style" GtkToolbarStyle.t x,
          new = fn x => new "toolbar-style" GtkToolbarStyle.t x
        }
    end
  end

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
    val getType_ = _import "gtk_tool_palette_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_tool_palette_new" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getDragTargetGroup_ = _import "gtk_tool_palette_get_drag_target_group" : unit -> GtkTargetEntryRecord.FFI.notnull GtkTargetEntryRecord.FFI.p;
    val getDragTargetItem_ = _import "gtk_tool_palette_get_drag_target_item" : unit -> GtkTargetEntryRecord.FFI.notnull GtkTargetEntryRecord.FFI.p;
    val addDragDest_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_tool_palette_add_drag_dest" :
              GtkToolPaletteClass.FFI.notnull GtkToolPaletteClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GtkDestDefaults.FFI.val_
               * GtkToolPaletteDragTargets.FFI.val_
               * GdkDragAction.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getDragItem_ = fn x1 & x2 => (_import "gtk_tool_palette_get_drag_item" : GtkToolPaletteClass.FFI.notnull GtkToolPaletteClass.FFI.p * GtkSelectionDataRecord.FFI.notnull GtkSelectionDataRecord.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;) (x1, x2)
    val getDropGroup_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tool_palette_get_drop_group" :
              GtkToolPaletteClass.FFI.notnull GtkToolPaletteClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> unit GtkToolItemGroupClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getDropItem_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tool_palette_get_drop_item" :
              GtkToolPaletteClass.FFI.notnull GtkToolPaletteClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> unit GtkToolItemClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getExclusive_ = fn x1 & x2 => (_import "gtk_tool_palette_get_exclusive" : GtkToolPaletteClass.FFI.notnull GtkToolPaletteClass.FFI.p * GtkToolItemGroupClass.FFI.notnull GtkToolItemGroupClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getExpand_ = fn x1 & x2 => (_import "gtk_tool_palette_get_expand" : GtkToolPaletteClass.FFI.notnull GtkToolPaletteClass.FFI.p * GtkToolItemGroupClass.FFI.notnull GtkToolItemGroupClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getGroupPosition_ = fn x1 & x2 => (_import "gtk_tool_palette_get_group_position" : GtkToolPaletteClass.FFI.notnull GtkToolPaletteClass.FFI.p * GtkToolItemGroupClass.FFI.notnull GtkToolItemGroupClass.FFI.p -> GInt.FFI.val_;) (x1, x2)
    val getHadjustment_ = _import "gtk_tool_palette_get_hadjustment" : GtkToolPaletteClass.FFI.notnull GtkToolPaletteClass.FFI.p -> GtkAdjustmentClass.FFI.notnull GtkAdjustmentClass.FFI.p;
    val getIconSize_ = _import "gtk_tool_palette_get_icon_size" : GtkToolPaletteClass.FFI.notnull GtkToolPaletteClass.FFI.p -> GInt.FFI.val_;
    val getStyle_ = _import "gtk_tool_palette_get_style" : GtkToolPaletteClass.FFI.notnull GtkToolPaletteClass.FFI.p -> GtkToolbarStyle.FFI.val_;
    val getVadjustment_ = _import "gtk_tool_palette_get_vadjustment" : GtkToolPaletteClass.FFI.notnull GtkToolPaletteClass.FFI.p -> GtkAdjustmentClass.FFI.notnull GtkAdjustmentClass.FFI.p;
    val setDragSource_ = fn x1 & x2 => (_import "gtk_tool_palette_set_drag_source" : GtkToolPaletteClass.FFI.notnull GtkToolPaletteClass.FFI.p * GtkToolPaletteDragTargets.FFI.val_ -> unit;) (x1, x2)
    val setExclusive_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tool_palette_set_exclusive" :
              GtkToolPaletteClass.FFI.notnull GtkToolPaletteClass.FFI.p
               * GtkToolItemGroupClass.FFI.notnull GtkToolItemGroupClass.FFI.p
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setExpand_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tool_palette_set_expand" :
              GtkToolPaletteClass.FFI.notnull GtkToolPaletteClass.FFI.p
               * GtkToolItemGroupClass.FFI.notnull GtkToolItemGroupClass.FFI.p
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setGroupPosition_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tool_palette_set_group_position" :
              GtkToolPaletteClass.FFI.notnull GtkToolPaletteClass.FFI.p
               * GtkToolItemGroupClass.FFI.notnull GtkToolItemGroupClass.FFI.p
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setIconSize_ = fn x1 & x2 => (_import "gtk_tool_palette_set_icon_size" : GtkToolPaletteClass.FFI.notnull GtkToolPaletteClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setStyle_ = fn x1 & x2 => (_import "gtk_tool_palette_set_style" : GtkToolPaletteClass.FFI.notnull GtkToolPaletteClass.FFI.p * GtkToolbarStyle.FFI.val_ -> unit;) (x1, x2)
    val unsetIconSize_ = _import "gtk_tool_palette_unset_icon_size" : GtkToolPaletteClass.FFI.notnull GtkToolPaletteClass.FFI.p -> unit;
    val unsetStyle_ = _import "gtk_tool_palette_unset_style" : GtkToolPaletteClass.FFI.notnull GtkToolPaletteClass.FFI.p -> unit;
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
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr ---> GtkOrientableClass.FFI.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.FFI.withPtr ---> GtkScrollableClass.FFI.fromPtr false) I self
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
        GtkToolPaletteClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
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
    fun getDragItem self selection = (GtkToolPaletteClass.FFI.withPtr &&&> GtkSelectionDataRecord.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getDragItem_ (self & selection)
    fun getDropGroup self (x, y) =
      (
        GtkToolPaletteClass.FFI.withPtr
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
        GtkToolPaletteClass.FFI.withPtr
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
    fun getExclusive self group = (GtkToolPaletteClass.FFI.withPtr &&&> GtkToolItemGroupClass.FFI.withPtr ---> GBool.FFI.fromVal) getExclusive_ (self & group)
    fun getExpand self group = (GtkToolPaletteClass.FFI.withPtr &&&> GtkToolItemGroupClass.FFI.withPtr ---> GBool.FFI.fromVal) getExpand_ (self & group)
    fun getGroupPosition self group = (GtkToolPaletteClass.FFI.withPtr &&&> GtkToolItemGroupClass.FFI.withPtr ---> GInt.FFI.fromVal) getGroupPosition_ (self & group)
    fun getHadjustment self = (GtkToolPaletteClass.FFI.withPtr ---> GtkAdjustmentClass.FFI.fromPtr false) getHadjustment_ self
    fun getIconSize self = (GtkToolPaletteClass.FFI.withPtr ---> GInt.FFI.fromVal) getIconSize_ self
    fun getStyle self = (GtkToolPaletteClass.FFI.withPtr ---> GtkToolbarStyle.FFI.fromVal) getStyle_ self
    fun getVadjustment self = (GtkToolPaletteClass.FFI.withPtr ---> GtkAdjustmentClass.FFI.fromPtr false) getVadjustment_ self
    fun setDragSource self targets = (GtkToolPaletteClass.FFI.withPtr &&&> GtkToolPaletteDragTargets.FFI.withVal ---> I) setDragSource_ (self & targets)
    fun setExclusive self (group, exclusive) =
      (
        GtkToolPaletteClass.FFI.withPtr
         &&&> GtkToolItemGroupClass.FFI.withPtr
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
        GtkToolPaletteClass.FFI.withPtr
         &&&> GtkToolItemGroupClass.FFI.withPtr
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
        GtkToolPaletteClass.FFI.withPtr
         &&&> GtkToolItemGroupClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         ---> I
      )
        setGroupPosition_
        (
          self
           & group
           & position
        )
    fun setIconSize self iconSize = (GtkToolPaletteClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setIconSize_ (self & iconSize)
    fun setStyle self style = (GtkToolPaletteClass.FFI.withPtr &&&> GtkToolbarStyle.FFI.withVal ---> I) setStyle_ (self & style)
    fun unsetIconSize self = (GtkToolPaletteClass.FFI.withPtr ---> I) unsetIconSize_ self
    fun unsetStyle self = (GtkToolPaletteClass.FFI.withPtr ---> I) unsetStyle_ self
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

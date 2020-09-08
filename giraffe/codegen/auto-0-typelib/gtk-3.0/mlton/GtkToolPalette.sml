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
    val new_ = _import "gtk_tool_palette_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getDragTargetGroup_ = _import "gtk_tool_palette_get_drag_target_group" : unit -> GtkTargetEntryRecord.FFI.non_opt GtkTargetEntryRecord.FFI.p;
    val getDragTargetItem_ = _import "gtk_tool_palette_get_drag_target_item" : unit -> GtkTargetEntryRecord.FFI.non_opt GtkTargetEntryRecord.FFI.p;
    val addDragDest_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_tool_palette_add_drag_dest" :
              GtkToolPaletteClass.FFI.non_opt GtkToolPaletteClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
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
    val getDragItem_ = fn x1 & x2 => (_import "gtk_tool_palette_get_drag_item" : GtkToolPaletteClass.FFI.non_opt GtkToolPaletteClass.FFI.p * GtkSelectionDataRecord.FFI.non_opt GtkSelectionDataRecord.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;) (x1, x2)
    val getDropGroup_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tool_palette_get_drop_group" :
              GtkToolPaletteClass.FFI.non_opt GtkToolPaletteClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> GtkToolItemGroupClass.FFI.opt GtkToolItemGroupClass.FFI.p;
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
              GtkToolPaletteClass.FFI.non_opt GtkToolPaletteClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> GtkToolItemClass.FFI.opt GtkToolItemClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getExclusive_ = fn x1 & x2 => (_import "gtk_tool_palette_get_exclusive" : GtkToolPaletteClass.FFI.non_opt GtkToolPaletteClass.FFI.p * GtkToolItemGroupClass.FFI.non_opt GtkToolItemGroupClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getExpand_ = fn x1 & x2 => (_import "gtk_tool_palette_get_expand" : GtkToolPaletteClass.FFI.non_opt GtkToolPaletteClass.FFI.p * GtkToolItemGroupClass.FFI.non_opt GtkToolItemGroupClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getGroupPosition_ = fn x1 & x2 => (_import "gtk_tool_palette_get_group_position" : GtkToolPaletteClass.FFI.non_opt GtkToolPaletteClass.FFI.p * GtkToolItemGroupClass.FFI.non_opt GtkToolItemGroupClass.FFI.p -> GInt32.FFI.val_;) (x1, x2)
    val getHadjustment_ = _import "gtk_tool_palette_get_hadjustment" : GtkToolPaletteClass.FFI.non_opt GtkToolPaletteClass.FFI.p -> GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p;
    val getIconSize_ = _import "gtk_tool_palette_get_icon_size" : GtkToolPaletteClass.FFI.non_opt GtkToolPaletteClass.FFI.p -> GInt32.FFI.val_;
    val getStyle_ = _import "gtk_tool_palette_get_style" : GtkToolPaletteClass.FFI.non_opt GtkToolPaletteClass.FFI.p -> GtkToolbarStyle.FFI.val_;
    val getVadjustment_ = _import "gtk_tool_palette_get_vadjustment" : GtkToolPaletteClass.FFI.non_opt GtkToolPaletteClass.FFI.p -> GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p;
    val setDragSource_ = fn x1 & x2 => (_import "gtk_tool_palette_set_drag_source" : GtkToolPaletteClass.FFI.non_opt GtkToolPaletteClass.FFI.p * GtkToolPaletteDragTargets.FFI.val_ -> unit;) (x1, x2)
    val setExclusive_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tool_palette_set_exclusive" :
              GtkToolPaletteClass.FFI.non_opt GtkToolPaletteClass.FFI.p
               * GtkToolItemGroupClass.FFI.non_opt GtkToolItemGroupClass.FFI.p
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
              GtkToolPaletteClass.FFI.non_opt GtkToolPaletteClass.FFI.p
               * GtkToolItemGroupClass.FFI.non_opt GtkToolItemGroupClass.FFI.p
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
              GtkToolPaletteClass.FFI.non_opt GtkToolPaletteClass.FFI.p
               * GtkToolItemGroupClass.FFI.non_opt GtkToolItemGroupClass.FFI.p
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setIconSize_ = fn x1 & x2 => (_import "gtk_tool_palette_set_icon_size" : GtkToolPaletteClass.FFI.non_opt GtkToolPaletteClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setStyle_ = fn x1 & x2 => (_import "gtk_tool_palette_set_style" : GtkToolPaletteClass.FFI.non_opt GtkToolPaletteClass.FFI.p * GtkToolbarStyle.FFI.val_ -> unit;) (x1, x2)
    val unsetIconSize_ = _import "gtk_tool_palette_unset_icon_size" : GtkToolPaletteClass.FFI.non_opt GtkToolPaletteClass.FFI.p -> unit;
    val unsetStyle_ = _import "gtk_tool_palette_unset_style" : GtkToolPaletteClass.FFI.non_opt GtkToolPaletteClass.FFI.p -> unit;
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
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
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
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
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
    fun getGroupPosition self group = (GtkToolPaletteClass.FFI.withPtr false &&&> GtkToolItemGroupClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getGroupPosition_ (self & group)
    fun getHadjustment self = (GtkToolPaletteClass.FFI.withPtr false ---> GtkAdjustmentClass.FFI.fromPtr false) getHadjustment_ self
    fun getIconSize self = (GtkToolPaletteClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getIconSize_ self
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
         &&&> GInt32.FFI.withVal
         ---> I
      )
        setGroupPosition_
        (
          self
           & group
           & position
        )
    fun setIconSize self iconSize = (GtkToolPaletteClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setIconSize_ (self & iconSize)
    fun setStyle self style = (GtkToolPaletteClass.FFI.withPtr false &&&> GtkToolbarStyle.FFI.withVal ---> I) setStyle_ (self & style)
    fun unsetIconSize self = (GtkToolPaletteClass.FFI.withPtr false ---> I) unsetIconSize_ self
    fun unsetStyle self = (GtkToolPaletteClass.FFI.withPtr false ---> I) unsetStyle_ self
    local
      open ValueAccessor
    in
      val iconSizeProp =
        {
          name = "icon-size",
          gtype = fn () => C.gtype GtkIconSize.t (),
          get = fn x => fn () => C.get GtkIconSize.t x,
          set = fn x => C.set GtkIconSize.t x,
          init = fn x => C.set GtkIconSize.t x
        }
      val iconSizeSetProp =
        {
          name = "icon-size-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val toolbarStyleProp =
        {
          name = "toolbar-style",
          gtype = fn () => C.gtype GtkToolbarStyle.t (),
          get = fn x => fn () => C.get GtkToolbarStyle.t x,
          set = fn x => C.set GtkToolbarStyle.t x,
          init = fn x => C.set GtkToolbarStyle.t x
        }
    end
  end

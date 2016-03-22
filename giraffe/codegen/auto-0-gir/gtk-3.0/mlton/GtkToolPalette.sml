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
    where type tool_palette_drag_targets_t = GtkToolPaletteDragTargets.t
    where type 'a tool_item_group_class = 'a GtkToolItemGroupClass.class
    where type icon_size_t = GtkIconSize.t
    where type toolbar_style_t = GtkToolbarStyle.t =
  struct
    val getType_ = _import "gtk_tool_palette_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_tool_palette_new" : unit -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getDragTargetGroup_ = _import "gtk_tool_palette_get_drag_target_group" : unit -> GtkTargetEntryRecord.C.notnull GtkTargetEntryRecord.C.p;
    val getDragTargetItem_ = _import "gtk_tool_palette_get_drag_target_item" : unit -> GtkTargetEntryRecord.C.notnull GtkTargetEntryRecord.C.p;
    val addDragDest_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_tool_palette_add_drag_dest" :
              GtkToolPaletteClass.C.notnull GtkToolPaletteClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * GtkDestDefaults.C.val_
               * GtkToolPaletteDragTargets.C.val_
               * GdkDragAction.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getDragItem_ = fn x1 & x2 => (_import "gtk_tool_palette_get_drag_item" : GtkToolPaletteClass.C.notnull GtkToolPaletteClass.C.p * GtkSelectionDataRecord.C.notnull GtkSelectionDataRecord.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;) (x1, x2)
    val getDropGroup_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tool_palette_get_drop_group" :
              GtkToolPaletteClass.C.notnull GtkToolPaletteClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> GtkToolItemGroupClass.C.notnull GtkToolItemGroupClass.C.p;
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
              GtkToolPaletteClass.C.notnull GtkToolPaletteClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> GtkToolItemClass.C.notnull GtkToolItemClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getExclusive_ = fn x1 & x2 => (_import "gtk_tool_palette_get_exclusive" : GtkToolPaletteClass.C.notnull GtkToolPaletteClass.C.p * GtkToolItemGroupClass.C.notnull GtkToolItemGroupClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val getExpand_ = fn x1 & x2 => (_import "gtk_tool_palette_get_expand" : GtkToolPaletteClass.C.notnull GtkToolPaletteClass.C.p * GtkToolItemGroupClass.C.notnull GtkToolItemGroupClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val getGroupPosition_ = fn x1 & x2 => (_import "gtk_tool_palette_get_group_position" : GtkToolPaletteClass.C.notnull GtkToolPaletteClass.C.p * GtkToolItemGroupClass.C.notnull GtkToolItemGroupClass.C.p -> FFI.Int.C.val_;) (x1, x2)
    val getIconSize_ = _import "gtk_tool_palette_get_icon_size" : GtkToolPaletteClass.C.notnull GtkToolPaletteClass.C.p -> FFI.Int.C.val_;
    val getStyle_ = _import "gtk_tool_palette_get_style" : GtkToolPaletteClass.C.notnull GtkToolPaletteClass.C.p -> GtkToolbarStyle.C.val_;
    val setDragSource_ = fn x1 & x2 => (_import "gtk_tool_palette_set_drag_source" : GtkToolPaletteClass.C.notnull GtkToolPaletteClass.C.p * GtkToolPaletteDragTargets.C.val_ -> unit;) (x1, x2)
    val setExclusive_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tool_palette_set_exclusive" :
              GtkToolPaletteClass.C.notnull GtkToolPaletteClass.C.p
               * GtkToolItemGroupClass.C.notnull GtkToolItemGroupClass.C.p
               * FFI.Bool.C.val_
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
              GtkToolPaletteClass.C.notnull GtkToolPaletteClass.C.p
               * GtkToolItemGroupClass.C.notnull GtkToolItemGroupClass.C.p
               * FFI.Bool.C.val_
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
              GtkToolPaletteClass.C.notnull GtkToolPaletteClass.C.p
               * GtkToolItemGroupClass.C.notnull GtkToolItemGroupClass.C.p
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setIconSize_ = fn x1 & x2 => (_import "gtk_tool_palette_set_icon_size" : GtkToolPaletteClass.C.notnull GtkToolPaletteClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setStyle_ = fn x1 & x2 => (_import "gtk_tool_palette_set_style" : GtkToolPaletteClass.C.notnull GtkToolPaletteClass.C.p * GtkToolbarStyle.C.val_ -> unit;) (x1, x2)
    val unsetIconSize_ = _import "gtk_tool_palette_unset_icon_size" : GtkToolPaletteClass.C.notnull GtkToolPaletteClass.C.p -> unit;
    val unsetStyle_ = _import "gtk_tool_palette_unset_style" : GtkToolPaletteClass.C.notnull GtkToolPaletteClass.C.p -> unit;
    type 'a class = 'a GtkToolPaletteClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type 'a scrollable_class = 'a GtkScrollableClass.class
    type target_entry_t = GtkTargetEntryRecord.t
    type dest_defaults_t = GtkDestDefaults.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type selection_data_t = GtkSelectionDataRecord.t
    type 'a tool_item_class = 'a GtkToolItemClass.class
    type tool_palette_drag_targets_t = GtkToolPaletteDragTargets.t
    type 'a tool_item_group_class = 'a GtkToolItemGroupClass.class
    type icon_size_t = GtkIconSize.t
    type toolbar_style_t = GtkToolbarStyle.t
    type t = base class
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
        GtkToolPaletteClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
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
    fun getDragItem self selection = (GtkToolPaletteClass.C.withPtr &&&> GtkSelectionDataRecord.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getDragItem_ (self & selection)
    fun getDropGroup self x y =
      (
        GtkToolPaletteClass.C.withPtr
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
        GtkToolPaletteClass.C.withPtr
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
    fun getExclusive self group = (GtkToolPaletteClass.C.withPtr &&&> GtkToolItemGroupClass.C.withPtr ---> FFI.Bool.C.fromVal) getExclusive_ (self & group)
    fun getExpand self group = (GtkToolPaletteClass.C.withPtr &&&> GtkToolItemGroupClass.C.withPtr ---> FFI.Bool.C.fromVal) getExpand_ (self & group)
    fun getGroupPosition self group = (GtkToolPaletteClass.C.withPtr &&&> GtkToolItemGroupClass.C.withPtr ---> FFI.Int.C.fromVal) getGroupPosition_ (self & group)
    fun getIconSize self = (GtkToolPaletteClass.C.withPtr ---> FFI.Int.C.fromVal) getIconSize_ self
    fun getStyle self = (GtkToolPaletteClass.C.withPtr ---> GtkToolbarStyle.C.fromVal) getStyle_ self
    fun setDragSource self targets = (GtkToolPaletteClass.C.withPtr &&&> GtkToolPaletteDragTargets.C.withVal ---> I) setDragSource_ (self & targets)
    fun setExclusive self group exclusive =
      (
        GtkToolPaletteClass.C.withPtr
         &&&> GtkToolItemGroupClass.C.withPtr
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
        GtkToolPaletteClass.C.withPtr
         &&&> GtkToolItemGroupClass.C.withPtr
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
        GtkToolPaletteClass.C.withPtr
         &&&> GtkToolItemGroupClass.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> I
      )
        setGroupPosition_
        (
          self
           & group
           & position
        )
    fun setIconSize self iconSize = (GtkToolPaletteClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setIconSize_ (self & iconSize)
    fun setStyle self style = (GtkToolPaletteClass.C.withPtr &&&> GtkToolbarStyle.C.withVal ---> I) setStyle_ (self & style)
    fun unsetIconSize self = (GtkToolPaletteClass.C.withPtr ---> I) unsetIconSize_ self
    fun unsetStyle self = (GtkToolPaletteClass.C.withPtr ---> I) unsetStyle_ self
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

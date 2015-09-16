signature GTK_TOOL_PALETTE =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a orientable_class_t
    type 'a scrollable_class_t
    type target_entry_record_t
    type dest_defaults_t
    type 'a widget_class_t
    type selection_data_record_t
    type 'a tool_item_class_t
    type tool_palette_drag_targets_t
    type 'a tool_item_group_class_t
    type icon_size_t
    type toolbar_style_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val asOrientable : 'a class_t -> base orientable_class_t
    val asScrollable : 'a class_t -> base scrollable_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getDragTargetGroup : unit -> target_entry_record_t
    val getDragTargetItem : unit -> target_entry_record_t
    val addDragDest :
      'a class_t
       -> 'b widget_class_t
       -> dest_defaults_t
       -> tool_palette_drag_targets_t
       -> Gdk.DragAction.t
       -> unit
    val getDragItem :
      'a class_t
       -> selection_data_record_t
       -> base widget_class_t
    val getDropGroup :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> base tool_item_group_class_t
    val getDropItem :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> base tool_item_class_t
    val getExclusive :
      'a class_t
       -> 'b tool_item_group_class_t
       -> bool
    val getExpand :
      'a class_t
       -> 'b tool_item_group_class_t
       -> bool
    val getGroupPosition :
      'a class_t
       -> 'b tool_item_group_class_t
       -> LargeInt.int
    val getIconSize : 'a class_t -> LargeInt.int
    val getStyle : 'a class_t -> toolbar_style_t
    val setDragSource :
      'a class_t
       -> tool_palette_drag_targets_t
       -> unit
    val setExclusive :
      'a class_t
       -> 'b tool_item_group_class_t
       -> bool
       -> unit
    val setExpand :
      'a class_t
       -> 'b tool_item_group_class_t
       -> bool
       -> unit
    val setGroupPosition :
      'a class_t
       -> 'b tool_item_group_class_t
       -> LargeInt.int
       -> unit
    val setIconSize :
      'a class_t
       -> LargeInt.int
       -> unit
    val setStyle :
      'a class_t
       -> toolbar_style_t
       -> unit
    val unsetIconSize : 'a class_t -> unit
    val unsetStyle : 'a class_t -> unit
    val iconSizeProp : ('a class_t, icon_size_t, icon_size_t) Property.readwrite
    val iconSizeSetProp : ('a class_t, bool, bool) Property.readwrite
    val toolbarStyleProp : ('a class_t, toolbar_style_t, toolbar_style_t) Property.readwrite
  end

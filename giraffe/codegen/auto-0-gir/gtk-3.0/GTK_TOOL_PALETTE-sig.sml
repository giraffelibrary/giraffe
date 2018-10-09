signature GTK_TOOL_PALETTE =
  sig
    type 'a class
    type 'a buildable_class
    type 'a orientable_class
    type 'a scrollable_class
    type target_entry_t
    type dest_defaults_t
    type 'a widget_class
    type selection_data_t
    type 'a tool_item_class
    type 'a adjustment_class
    type tool_palette_drag_targets_t
    type 'a tool_item_group_class
    type icon_size_t
    type toolbar_style_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asOrientable : 'a class -> base orientable_class
    val asScrollable : 'a class -> base scrollable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getDragTargetGroup : unit -> target_entry_t
    val getDragTargetItem : unit -> target_entry_t
    val addDragDest :
      'a class
       -> 'b widget_class
           * dest_defaults_t
           * tool_palette_drag_targets_t
           * Gdk.DragAction.t
       -> unit
    val getDragItem :
      'a class
       -> selection_data_t
       -> base widget_class
    val getDropGroup :
      'a class
       -> LargeInt.int * LargeInt.int
       -> base tool_item_group_class option
    val getDropItem :
      'a class
       -> LargeInt.int * LargeInt.int
       -> base tool_item_class option
    val getExclusive :
      'a class
       -> 'b tool_item_group_class
       -> bool
    val getExpand :
      'a class
       -> 'b tool_item_group_class
       -> bool
    val getGroupPosition :
      'a class
       -> 'b tool_item_group_class
       -> LargeInt.int
    val getHadjustment : 'a class -> base adjustment_class
    val getIconSize : 'a class -> LargeInt.int
    val getStyle : 'a class -> toolbar_style_t
    val getVadjustment : 'a class -> base adjustment_class
    val setDragSource :
      'a class
       -> tool_palette_drag_targets_t
       -> unit
    val setExclusive :
      'a class
       -> 'b tool_item_group_class * bool
       -> unit
    val setExpand :
      'a class
       -> 'b tool_item_group_class * bool
       -> unit
    val setGroupPosition :
      'a class
       -> 'b tool_item_group_class * LargeInt.int
       -> unit
    val setIconSize :
      'a class
       -> LargeInt.int
       -> unit
    val setStyle :
      'a class
       -> toolbar_style_t
       -> unit
    val unsetIconSize : 'a class -> unit
    val unsetStyle : 'a class -> unit
    val iconSizeProp :
      {
        get : 'a class -> icon_size_t,
        set :
          icon_size_t
           -> 'a class
           -> unit,
        new : icon_size_t -> 'a class Property.t
      }
    val iconSizeSetProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val toolbarStyleProp :
      {
        get : 'a class -> toolbar_style_t,
        set :
          toolbar_style_t
           -> 'a class
           -> unit,
        new : toolbar_style_t -> 'a class Property.t
      }
  end

signature GTK_TOOL_PALETTE =
  sig
    type 'a class_t
    type toolbarstyle_t
    type iconsize_t
    type 'a toolitemgroupclass_t
    type toolpalettedragtargets_t
    type 'a toolitemclass_t
    type selectiondatarecord_t
    type 'a widgetclass_t
    type destdefaults_t
    type targetentryrecord_t
    type 'a scrollableclass_t
    type 'a orientableclass_t
    type 'a buildableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asOrientable : 'a class_t -> base orientableclass_t
    val asScrollable : 'a class_t -> base scrollableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getDragTargetGroup : unit -> targetentryrecord_t
    val getDragTargetItem : unit -> targetentryrecord_t
    val addDragDest :
      'a class_t
       -> 'b widgetclass_t
       -> destdefaults_t
       -> toolpalettedragtargets_t
       -> Gdk.DragAction.t
       -> unit
    val getDragItem :
      'a class_t
       -> selectiondatarecord_t
       -> base widgetclass_t
    val getDropGroup :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> base toolitemgroupclass_t
    val getDropItem :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> base toolitemclass_t
    val getExclusive :
      'a class_t
       -> 'b toolitemgroupclass_t
       -> bool
    val getExpand :
      'a class_t
       -> 'b toolitemgroupclass_t
       -> bool
    val getGroupPosition :
      'a class_t
       -> 'b toolitemgroupclass_t
       -> LargeInt.int
    val getIconSize : 'a class_t -> LargeInt.int
    val getStyle : 'a class_t -> toolbarstyle_t
    val setDragSource :
      'a class_t
       -> toolpalettedragtargets_t
       -> unit
    val setExclusive :
      'a class_t
       -> 'b toolitemgroupclass_t
       -> bool
       -> unit
    val setExpand :
      'a class_t
       -> 'b toolitemgroupclass_t
       -> bool
       -> unit
    val setGroupPosition :
      'a class_t
       -> 'b toolitemgroupclass_t
       -> LargeInt.int
       -> unit
    val setIconSize :
      'a class_t
       -> LargeInt.int
       -> unit
    val setStyle :
      'a class_t
       -> toolbarstyle_t
       -> unit
    val unsetIconSize : 'a class_t -> unit
    val unsetStyle : 'a class_t -> unit
    val iconSizeProp : ('a class_t, iconsize_t, iconsize_t) Property.readwrite
    val iconSizeSetProp : ('a class_t, bool, bool) Property.readwrite
    val toolbarStyleProp : ('a class_t, toolbarstyle_t, toolbarstyle_t) Property.readwrite
  end

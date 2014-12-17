signature GTK_ICON_VIEW =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type 'a celllayoutclass_t
    type 'a scrollableclass_t
    type treeiterrecord_t
    type iconviewdropposition_t
    type 'a cellrendererclass_t
    type 'a tooltipclass_t
    type treepathrecord_t
    type movementstep_t
    type 'a cellareaclass_t
    type orientation_t
    type 'a treemodelclass_t
    type selectionmode_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asCellLayout : 'a class_t -> base celllayoutclass_t
    val asScrollable : 'a class_t -> base scrollableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newWithArea : 'a cellareaclass_t -> base class_t
    val newWithModel : 'a treemodelclass_t -> base class_t
    val convertWidgetToBinWindowCoords :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int * LargeInt.int
    val createDragIcon :
      'a class_t
       -> treepathrecord_t
       -> Cairo.SurfaceRecord.t
    val getColumnSpacing : 'a class_t -> LargeInt.int
    val getColumns : 'a class_t -> LargeInt.int
    val getCursor : 'a class_t -> (treepathrecord_t * base cellrendererclass_t) option
    val getDestItemAtPos :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> (treepathrecord_t * iconviewdropposition_t) option
    val getDragDestItem : 'a class_t -> treepathrecord_t * iconviewdropposition_t
    val getItemAtPos :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> (treepathrecord_t * base cellrendererclass_t) option
    val getItemColumn :
      'a class_t
       -> treepathrecord_t
       -> LargeInt.int
    val getItemOrientation : 'a class_t -> orientation_t
    val getItemPadding : 'a class_t -> LargeInt.int
    val getItemRow :
      'a class_t
       -> treepathrecord_t
       -> LargeInt.int
    val getItemWidth : 'a class_t -> LargeInt.int
    val getMargin : 'a class_t -> LargeInt.int
    val getMarkupColumn : 'a class_t -> LargeInt.int
    val getModel : 'a class_t -> base treemodelclass_t
    val getPathAtPos :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> treepathrecord_t
    val getPixbufColumn : 'a class_t -> LargeInt.int
    val getReorderable : 'a class_t -> bool
    val getRowSpacing : 'a class_t -> LargeInt.int
    val getSelectionMode : 'a class_t -> selectionmode_t
    val getSpacing : 'a class_t -> LargeInt.int
    val getTextColumn : 'a class_t -> LargeInt.int
    val getTooltipColumn : 'a class_t -> LargeInt.int
    val getTooltipContext :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> bool
       -> (base treemodelclass_t
            * treepathrecord_t
            * treeiterrecord_t)
            option
           * LargeInt.int
           * LargeInt.int
    val getVisibleRange : 'a class_t -> (treepathrecord_t * treepathrecord_t) option
    val itemActivated :
      'a class_t
       -> treepathrecord_t
       -> unit
    val pathIsSelected :
      'a class_t
       -> treepathrecord_t
       -> bool
    val scrollToPath :
      'a class_t
       -> treepathrecord_t
       -> bool
       -> real
       -> real
       -> unit
    val selectAll : 'a class_t -> unit
    val selectPath :
      'a class_t
       -> treepathrecord_t
       -> unit
    val setColumnSpacing :
      'a class_t
       -> LargeInt.int
       -> unit
    val setColumns :
      'a class_t
       -> LargeInt.int
       -> unit
    val setCursor :
      'a class_t
       -> treepathrecord_t
       -> 'b cellrendererclass_t option
       -> bool
       -> unit
    val setDragDestItem :
      'a class_t
       -> treepathrecord_t option
       -> iconviewdropposition_t
       -> unit
    val setItemOrientation :
      'a class_t
       -> orientation_t
       -> unit
    val setItemPadding :
      'a class_t
       -> LargeInt.int
       -> unit
    val setItemWidth :
      'a class_t
       -> LargeInt.int
       -> unit
    val setMargin :
      'a class_t
       -> LargeInt.int
       -> unit
    val setMarkupColumn :
      'a class_t
       -> LargeInt.int
       -> unit
    val setModel :
      'a class_t
       -> 'b treemodelclass_t option
       -> unit
    val setPixbufColumn :
      'a class_t
       -> LargeInt.int
       -> unit
    val setReorderable :
      'a class_t
       -> bool
       -> unit
    val setRowSpacing :
      'a class_t
       -> LargeInt.int
       -> unit
    val setSelectionMode :
      'a class_t
       -> selectionmode_t
       -> unit
    val setSpacing :
      'a class_t
       -> LargeInt.int
       -> unit
    val setTextColumn :
      'a class_t
       -> LargeInt.int
       -> unit
    val setTooltipCell :
      'a class_t
       -> 'b tooltipclass_t
       -> treepathrecord_t
       -> 'c cellrendererclass_t option
       -> unit
    val setTooltipColumn :
      'a class_t
       -> LargeInt.int
       -> unit
    val setTooltipItem :
      'a class_t
       -> 'b tooltipclass_t
       -> treepathrecord_t
       -> unit
    val unselectAll : 'a class_t -> unit
    val unselectPath :
      'a class_t
       -> treepathrecord_t
       -> unit
    val unsetModelDragDest : 'a class_t -> unit
    val unsetModelDragSource : 'a class_t -> unit
    val activateCursorItemSig : (unit -> bool) -> 'a class_t Signal.signal
    val itemActivatedSig : (treepathrecord_t -> unit) -> 'a class_t Signal.signal
    val moveCursorSig :
      (movementstep_t
        -> LargeInt.int
        -> bool)
       -> 'a class_t Signal.signal
    val selectAllSig : (unit -> unit) -> 'a class_t Signal.signal
    val selectCursorItemSig : (unit -> unit) -> 'a class_t Signal.signal
    val selectionChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val toggleCursorItemSig : (unit -> unit) -> 'a class_t Signal.signal
    val unselectAllSig : (unit -> unit) -> 'a class_t Signal.signal
    val cellAreaProp : ('a class_t, base cellareaclass_t option, 'b cellareaclass_t option) Property.readwrite
    val columnSpacingProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val columnsProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val itemOrientationProp : ('a class_t, orientation_t, orientation_t) Property.readwrite
    val itemPaddingProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val itemWidthProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val marginProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val markupColumnProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val modelProp : ('a class_t, base treemodelclass_t option, 'b treemodelclass_t option) Property.readwrite
    val pixbufColumnProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val reorderableProp : ('a class_t, bool, bool) Property.readwrite
    val rowSpacingProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val selectionModeProp : ('a class_t, selectionmode_t, selectionmode_t) Property.readwrite
    val spacingProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val textColumnProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val tooltipColumnProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end

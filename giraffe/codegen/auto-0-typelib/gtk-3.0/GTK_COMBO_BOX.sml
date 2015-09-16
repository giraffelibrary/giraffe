signature GTK_COMBO_BOX =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a cell_editable_class_t
    type 'a cell_layout_class_t
    type tree_iter_record_t
    type scroll_type_t
    type sensitivity_type_t
    type 'a cell_area_class_t
    type 'a tree_model_class_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val asCellEditable : 'a class_t -> base cell_editable_class_t
    val asCellLayout : 'a class_t -> base cell_layout_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newWithArea : 'a cell_area_class_t -> base class_t
    val newWithAreaAndEntry : 'a cell_area_class_t -> base class_t
    val newWithEntry : unit -> base class_t
    val newWithModel : 'a tree_model_class_t -> base class_t
    val newWithModelAndEntry : 'a tree_model_class_t -> base class_t
    val getActive : 'a class_t -> LargeInt.int
    val getActiveId : 'a class_t -> string
    val getActiveIter : 'a class_t -> tree_iter_record_t option
    val getAddTearoffs : 'a class_t -> bool
    val getButtonSensitivity : 'a class_t -> sensitivity_type_t
    val getColumnSpanColumn : 'a class_t -> LargeInt.int
    val getEntryTextColumn : 'a class_t -> LargeInt.int
    val getFocusOnClick : 'a class_t -> bool
    val getHasEntry : 'a class_t -> bool
    val getIdColumn : 'a class_t -> LargeInt.int
    val getModel : 'a class_t -> base tree_model_class_t
    val getPopupAccessible : 'a class_t -> base Atk.ObjectClass.t
    val getPopupFixedWidth : 'a class_t -> bool
    val getRowSpanColumn : 'a class_t -> LargeInt.int
    val getTitle : 'a class_t -> string
    val getWrapWidth : 'a class_t -> LargeInt.int
    val popdown : 'a class_t -> unit
    val popup : 'a class_t -> unit
    val popupForDevice :
      'a class_t
       -> 'b Gdk.DeviceClass.t
       -> unit
    val setActive :
      'a class_t
       -> LargeInt.int
       -> unit
    val setActiveId :
      'a class_t
       -> string option
       -> bool
    val setActiveIter :
      'a class_t
       -> tree_iter_record_t option
       -> unit
    val setAddTearoffs :
      'a class_t
       -> bool
       -> unit
    val setButtonSensitivity :
      'a class_t
       -> sensitivity_type_t
       -> unit
    val setColumnSpanColumn :
      'a class_t
       -> LargeInt.int
       -> unit
    val setEntryTextColumn :
      'a class_t
       -> LargeInt.int
       -> unit
    val setFocusOnClick :
      'a class_t
       -> bool
       -> unit
    val setIdColumn :
      'a class_t
       -> LargeInt.int
       -> unit
    val setModel :
      'a class_t
       -> 'b tree_model_class_t option
       -> unit
    val setPopupFixedWidth :
      'a class_t
       -> bool
       -> unit
    val setRowSpanColumn :
      'a class_t
       -> LargeInt.int
       -> unit
    val setTitle :
      'a class_t
       -> string
       -> unit
    val setWrapWidth :
      'a class_t
       -> LargeInt.int
       -> unit
    val changedSig : (unit -> unit) -> 'a class_t Signal.signal
    val moveActiveSig : (scroll_type_t -> unit) -> 'a class_t Signal.signal
    val popdownSig : (unit -> bool) -> 'a class_t Signal.signal
    val popupSig : (unit -> unit) -> 'a class_t Signal.signal
    val activeProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val activeIdProp : ('a class_t, string option, string option) Property.readwrite
    val addTearoffsProp : ('a class_t, bool, bool) Property.readwrite
    val buttonSensitivityProp : ('a class_t, sensitivity_type_t, sensitivity_type_t) Property.readwrite
    val cellAreaProp : ('a class_t, base cell_area_class_t option, 'b cell_area_class_t option) Property.readwrite
    val columnSpanColumnProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val entryTextColumnProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val focusOnClickProp : ('a class_t, bool, bool) Property.readwrite
    val hasEntryProp : ('a class_t, bool, bool) Property.readwrite
    val hasFrameProp : ('a class_t, bool, bool) Property.readwrite
    val idColumnProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val modelProp : ('a class_t, base tree_model_class_t option, 'b tree_model_class_t option) Property.readwrite
    val popupFixedWidthProp : ('a class_t, bool, bool) Property.readwrite
    val popupShownProp : ('a class_t, bool) Property.readonly
    val rowSpanColumnProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val tearoffTitleProp : ('a class_t, string option, string option) Property.readwrite
    val wrapWidthProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end

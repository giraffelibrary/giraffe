signature GTK_COMBO_BOX =
  sig
    type 'a class
    type 'a buildable_class
    type 'a cell_editable_class
    type 'a cell_layout_class
    type tree_iter_t
    type scroll_type_t
    type sensitivity_type_t
    type 'a cell_area_class
    type 'a tree_model_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asCellEditable : 'a class -> base cell_editable_class
    val asCellLayout : 'a class -> base cell_layout_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newWithArea : 'a cell_area_class -> base class
    val newWithAreaAndEntry : 'a cell_area_class -> base class
    val newWithEntry : unit -> base class
    val newWithModel : 'a tree_model_class -> base class
    val newWithModelAndEntry : 'a tree_model_class -> base class
    val getActive : 'a class -> LargeInt.int
    val getActiveId : 'a class -> string option
    val getActiveIter : 'a class -> tree_iter_t option
    val getAddTearoffs : 'a class -> bool
    val getButtonSensitivity : 'a class -> sensitivity_type_t
    val getColumnSpanColumn : 'a class -> LargeInt.int
    val getEntryTextColumn : 'a class -> LargeInt.int
    val getFocusOnClick : 'a class -> bool
    val getHasEntry : 'a class -> bool
    val getIdColumn : 'a class -> LargeInt.int
    val getModel : 'a class -> base tree_model_class
    val getPopupAccessible : 'a class -> base Atk.ObjectClass.class
    val getPopupFixedWidth : 'a class -> bool
    val getRowSpanColumn : 'a class -> LargeInt.int
    val getTitle : 'a class -> string
    val getWrapWidth : 'a class -> LargeInt.int
    val popdown : 'a class -> unit
    val popup : 'a class -> unit
    val popupForDevice :
      'a class
       -> 'b Gdk.DeviceClass.class
       -> unit
    val setActive :
      'a class
       -> LargeInt.int
       -> unit
    val setActiveId :
      'a class
       -> string option
       -> bool
    val setActiveIter :
      'a class
       -> tree_iter_t option
       -> unit
    val setAddTearoffs :
      'a class
       -> bool
       -> unit
    val setButtonSensitivity :
      'a class
       -> sensitivity_type_t
       -> unit
    val setColumnSpanColumn :
      'a class
       -> LargeInt.int
       -> unit
    val setEntryTextColumn :
      'a class
       -> LargeInt.int
       -> unit
    val setFocusOnClick :
      'a class
       -> bool
       -> unit
    val setIdColumn :
      'a class
       -> LargeInt.int
       -> unit
    val setModel :
      'a class
       -> 'b tree_model_class option
       -> unit
    val setPopupFixedWidth :
      'a class
       -> bool
       -> unit
    val setRowSpanColumn :
      'a class
       -> LargeInt.int
       -> unit
    val setTitle :
      'a class
       -> string
       -> unit
    val setWrapWidth :
      'a class
       -> LargeInt.int
       -> unit
    val changedSig : (unit -> unit) -> 'a class Signal.t
    val formatEntryTextSig : (string -> string) -> 'a class Signal.t
    val moveActiveSig : (scroll_type_t -> unit) -> 'a class Signal.t
    val popdownSig : (unit -> bool) -> 'a class Signal.t
    val popupSig : (unit -> unit) -> 'a class Signal.t
    val activeProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val activeIdProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val addTearoffsProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val buttonSensitivityProp : ('a class, unit -> sensitivity_type_t, sensitivity_type_t -> unit, sensitivity_type_t -> unit) Property.t
    val cellAreaProp : ('a class, unit -> base cell_area_class option, unit, 'b cell_area_class option -> unit) Property.t
    val columnSpanColumnProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val entryTextColumnProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val hasEntryProp : ('a class, unit -> bool, unit, bool -> unit) Property.t
    val hasFrameProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val idColumnProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val modelProp : ('a class, unit -> base tree_model_class option, 'b tree_model_class option -> unit, 'b tree_model_class option -> unit) Property.t
    val popupFixedWidthProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val popupShownProp : ('a class, unit -> bool, unit, unit) Property.t
    val rowSpanColumnProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val tearoffTitleProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val wrapWidthProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
  end

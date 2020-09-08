signature GTK_CELL_VIEW =
  sig
    type 'a class
    type 'a buildable_class
    type 'a cell_layout_class
    type 'a orientable_class
    type requisition_t
    type tree_path_t
    type 'a cell_area_class
    type 'a cell_area_context_class
    type 'a tree_model_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asCellLayout : 'a class -> base cell_layout_class
    val asOrientable : 'a class -> base orientable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newWithContext : 'a cell_area_class * 'b cell_area_context_class -> base class
    val newWithMarkup : string -> base class
    val newWithPixbuf : 'a GdkPixbuf.PixbufClass.class -> base class
    val newWithText : string -> base class
    val getDisplayedRow : 'a class -> tree_path_t option
    val getDrawSensitive : 'a class -> bool
    val getFitModel : 'a class -> bool
    val getModel : 'a class -> base tree_model_class option
    val getSizeOfRow :
      'a class
       -> tree_path_t
       -> requisition_t option
    val setBackgroundColor :
      'a class
       -> Gdk.ColorRecord.t
       -> unit
    val setBackgroundRgba :
      'a class
       -> Gdk.RgbaRecord.t
       -> unit
    val setDisplayedRow :
      'a class
       -> tree_path_t option
       -> unit
    val setDrawSensitive :
      'a class
       -> bool
       -> unit
    val setFitModel :
      'a class
       -> bool
       -> unit
    val setModel :
      'a class
       -> 'b tree_model_class option
       -> unit
    val backgroundProp : ('a class, unit, string option -> unit, string option -> unit) Property.t
    val backgroundGdkProp : ('a class, unit -> Gdk.ColorRecord.t option, Gdk.ColorRecord.t option -> unit, Gdk.ColorRecord.t option -> unit) Property.t
    val backgroundRgbaProp : ('a class, unit -> Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option -> unit, Gdk.RgbaRecord.t option -> unit) Property.t
    val backgroundSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val cellAreaProp : ('a class, unit -> base cell_area_class option, unit, 'b cell_area_class option -> unit) Property.t
    val cellAreaContextProp : ('a class, unit -> base cell_area_context_class option, unit, 'b cell_area_context_class option -> unit) Property.t
    val drawSensitiveProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val fitModelProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val modelProp : ('a class, unit -> base tree_model_class option, 'b tree_model_class option -> unit, 'b tree_model_class option -> unit) Property.t
  end

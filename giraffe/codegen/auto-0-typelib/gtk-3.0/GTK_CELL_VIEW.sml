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
    val getDisplayedRow : 'a class -> tree_path_t
    val getDrawSensitive : 'a class -> bool
    val getFitModel : 'a class -> bool
    val getModel : 'a class -> base tree_model_class
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
    val backgroundProp : ('a class, string option) Property.writeonly
    val backgroundGdkProp : ('a class, Gdk.ColorRecord.t option, Gdk.ColorRecord.t option) Property.readwrite
    val backgroundRgbaProp : ('a class, Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option) Property.readwrite
    val backgroundSetProp : ('a class, bool, bool) Property.readwrite
    val cellAreaProp : ('a class, base cell_area_class option, 'b cell_area_class option) Property.readwrite
    val cellAreaContextProp : ('a class, base cell_area_context_class option, 'b cell_area_context_class option) Property.readwrite
    val drawSensitiveProp : ('a class, bool, bool) Property.readwrite
    val fitModelProp : ('a class, bool, bool) Property.readwrite
    val modelProp : ('a class, base tree_model_class option, 'b tree_model_class option) Property.readwrite
  end

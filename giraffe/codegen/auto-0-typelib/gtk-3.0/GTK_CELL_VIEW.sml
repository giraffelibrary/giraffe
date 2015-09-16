signature GTK_CELL_VIEW =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a cell_layout_class_t
    type 'a orientable_class_t
    type tree_path_record_t
    type 'a cell_area_class_t
    type 'a cell_area_context_class_t
    type 'a tree_model_class_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val asCellLayout : 'a class_t -> base cell_layout_class_t
    val asOrientable : 'a class_t -> base orientable_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newWithContext :
      'a cell_area_class_t
       -> 'b cell_area_context_class_t
       -> base class_t
    val newWithMarkup : string -> base class_t
    val newWithPixbuf : 'a GdkPixbuf.PixbufClass.t -> base class_t
    val newWithText : string -> base class_t
    val getDisplayedRow : 'a class_t -> tree_path_record_t
    val getDrawSensitive : 'a class_t -> bool
    val getFitModel : 'a class_t -> bool
    val getModel : 'a class_t -> base tree_model_class_t
    val setBackgroundColor :
      'a class_t
       -> Gdk.ColorRecord.t
       -> unit
    val setBackgroundRgba :
      'a class_t
       -> Gdk.RgbaRecord.t
       -> unit
    val setDisplayedRow :
      'a class_t
       -> tree_path_record_t option
       -> unit
    val setDrawSensitive :
      'a class_t
       -> bool
       -> unit
    val setFitModel :
      'a class_t
       -> bool
       -> unit
    val setModel :
      'a class_t
       -> 'b tree_model_class_t option
       -> unit
    val backgroundProp : ('a class_t, string option) Property.writeonly
    val backgroundGdkProp : ('a class_t, Gdk.ColorRecord.t option, Gdk.ColorRecord.t option) Property.readwrite
    val backgroundRgbaProp : ('a class_t, Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option) Property.readwrite
    val backgroundSetProp : ('a class_t, bool, bool) Property.readwrite
    val cellAreaProp : ('a class_t, base cell_area_class_t option, 'b cell_area_class_t option) Property.readwrite
    val cellAreaContextProp : ('a class_t, base cell_area_context_class_t option, 'b cell_area_context_class_t option) Property.readwrite
    val drawSensitiveProp : ('a class_t, bool, bool) Property.readwrite
    val fitModelProp : ('a class_t, bool, bool) Property.readwrite
    val modelProp : ('a class_t, base tree_model_class_t option, 'b tree_model_class_t option) Property.readwrite
  end

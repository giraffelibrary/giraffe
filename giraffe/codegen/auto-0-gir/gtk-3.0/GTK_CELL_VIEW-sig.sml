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
    val backgroundProp :
      {
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val backgroundGdkProp :
      {
        get : 'a class -> Gdk.ColorRecord.t option,
        set :
          Gdk.ColorRecord.t option
           -> 'a class
           -> unit,
        new : Gdk.ColorRecord.t option -> 'a class Property.t
      }
    val backgroundRgbaProp :
      {
        get : 'a class -> Gdk.RgbaRecord.t option,
        set :
          Gdk.RgbaRecord.t option
           -> 'a class
           -> unit,
        new : Gdk.RgbaRecord.t option -> 'a class Property.t
      }
    val backgroundSetProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val cellAreaProp :
      {
        get : 'a class -> base cell_area_class option,
        new : 'b cell_area_class option -> 'a class Property.t
      }
    val cellAreaContextProp :
      {
        get : 'a class -> base cell_area_context_class option,
        new : 'b cell_area_context_class option -> 'a class Property.t
      }
    val drawSensitiveProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val fitModelProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val modelProp :
      {
        get : 'a class -> base tree_model_class option,
        set :
          'b tree_model_class option
           -> 'a class
           -> unit,
        new : 'b tree_model_class option -> 'a class Property.t
      }
  end

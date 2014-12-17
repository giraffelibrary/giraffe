signature GTK_CELL_VIEW =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type 'a celllayoutclass_t
    type 'a orientableclass_t
    type treepathrecord_t
    type 'a cellareaclass_t
    type 'a cellareacontextclass_t
    type 'a treemodelclass_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asCellLayout : 'a class_t -> base celllayoutclass_t
    val asOrientable : 'a class_t -> base orientableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newWithContext :
      'a cellareaclass_t
       -> 'b cellareacontextclass_t
       -> base class_t
    val newWithMarkup : string -> base class_t
    val newWithPixbuf : 'a GdkPixbuf.PixbufClass.t -> base class_t
    val newWithText : string -> base class_t
    val getDisplayedRow : 'a class_t -> treepathrecord_t
    val getDrawSensitive : 'a class_t -> bool
    val getFitModel : 'a class_t -> bool
    val getModel : 'a class_t -> base treemodelclass_t
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
       -> treepathrecord_t option
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
       -> 'b treemodelclass_t option
       -> unit
    val backgroundProp : ('a class_t, string option) Property.writeonly
    val backgroundGdkProp : ('a class_t, Gdk.ColorRecord.t option, Gdk.ColorRecord.t option) Property.readwrite
    val backgroundRgbaProp : ('a class_t, Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option) Property.readwrite
    val backgroundSetProp : ('a class_t, bool, bool) Property.readwrite
    val cellAreaProp : ('a class_t, base cellareaclass_t option, 'b cellareaclass_t option) Property.readwrite
    val cellAreaContextProp : ('a class_t, base cellareacontextclass_t option, 'b cellareacontextclass_t option) Property.readwrite
    val drawSensitiveProp : ('a class_t, bool, bool) Property.readwrite
    val fitModelProp : ('a class_t, bool, bool) Property.readwrite
    val modelProp : ('a class_t, base treemodelclass_t option, 'b treemodelclass_t option) Property.readwrite
  end

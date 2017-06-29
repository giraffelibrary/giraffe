structure GtkDrawingArea :>
  GTK_DRAWING_AREA
    where type 'a class = 'a GtkDrawingAreaClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_drawing_area_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_drawing_area_new") (PolyMLFFI.cVoid --> GtkWidgetClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkDrawingAreaClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkDrawingAreaClass.FFI.fromPtr false) new_ ()
  end

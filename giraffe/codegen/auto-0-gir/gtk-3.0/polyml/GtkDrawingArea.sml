structure GtkDrawingArea :>
  GTK_DRAWING_AREA
    where type 'a class_t = 'a GtkDrawingAreaClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_drawing_area_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_drawing_area_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
    end
    type 'a class_t = 'a GtkDrawingAreaClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkDrawingAreaClass.C.fromPtr false) new_ ()
  end

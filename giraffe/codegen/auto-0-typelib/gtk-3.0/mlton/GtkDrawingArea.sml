structure GtkDrawingArea :>
  GTK_DRAWING_AREA
    where type 'a class_t = 'a GtkDrawingAreaClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t =
  struct
    val getType_ = _import "gtk_drawing_area_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_drawing_area_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class_t = 'a GtkDrawingAreaClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkDrawingAreaClass.C.fromPtr false) new_ ()
  end

structure GtkHScrollbar :>
  GTK_H_SCROLLBAR
    where type 'a class_t = 'a GtkHScrollbarClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a orientable_class_t = 'a GtkOrientableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_hscrollbar_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class_t = 'a GtkHScrollbarClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a orientable_class_t = 'a GtkOrientableClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end

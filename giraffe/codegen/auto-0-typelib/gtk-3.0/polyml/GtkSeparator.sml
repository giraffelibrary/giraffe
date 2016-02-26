structure GtkSeparator :>
  GTK_SEPARATOR
    where type 'a class_t = 'a GtkSeparatorClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a orientable_class_t = 'a GtkOrientableClass.t
    where type orientation_t = GtkOrientation.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_separator_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_separator_new") (GtkOrientation.PolyML.cVal --> GObjectObjectClass.PolyML.cPtr)
    end
    type 'a class_t = 'a GtkSeparatorClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a orientable_class_t = 'a GtkOrientableClass.t
    type orientation_t = GtkOrientation.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new orientation = (GtkOrientation.C.withVal ---> GtkSeparatorClass.C.fromPtr false) new_ orientation
  end

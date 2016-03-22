structure GtkSeparator :>
  GTK_SEPARATOR
    where type 'a class = 'a GtkSeparatorClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type orientation_t = GtkOrientation.t =
  struct
    val getType_ = _import "gtk_separator_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_separator_new" : GtkOrientation.C.val_ -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    type 'a class = 'a GtkSeparatorClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type orientation_t = GtkOrientation.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new orientation = (GtkOrientation.C.withVal ---> GtkSeparatorClass.C.fromPtr false) new_ orientation
  end

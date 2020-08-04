structure GtkHPaned :>
  GTK_H_PANED
    where type 'a class = 'a GtkHPanedClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class =
  struct
    val getType_ = _import "gtk_hpaned_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_hpaned_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    type 'a class = 'a GtkHPanedClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr false ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkHPanedClass.FFI.fromPtr false) new_ ()
  end

structure GtkHBox :>
  GTK_H_BOX
    where type 'a class = 'a GtkHBoxClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_hbox_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_hbox_new") (GBool.PolyML.cVal &&> GInt32.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkHBoxClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (homogeneous, spacing) = (GBool.FFI.withVal &&&> GInt32.FFI.withVal ---> GtkHBoxClass.FFI.fromPtr false) new_ (homogeneous & spacing)
  end

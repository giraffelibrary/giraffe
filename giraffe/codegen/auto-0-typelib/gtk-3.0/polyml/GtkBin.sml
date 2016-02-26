structure GtkBin :>
  GTK_BIN
    where type 'a class_t = 'a GtkBinClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_bin_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getChild_ = call (load_sym libgtk "gtk_bin_get_child") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
    end
    type 'a class_t = 'a GtkBinClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a widget_class_t = 'a GtkWidgetClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getChild self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getChild_ self
  end

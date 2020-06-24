structure GtkBin :>
  GTK_BIN
    where type 'a class = 'a GtkBinClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_bin_get_type" : unit -> GObjectType.FFI.val_;
    val getChild_ = _import "gtk_bin_get_child" : GtkBinClass.FFI.non_opt GtkBinClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    type 'a class = 'a GtkBinClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getChild self = (GtkBinClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getChild_ self
  end

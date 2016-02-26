structure GtkVolumeButton :>
  GTK_VOLUME_BUTTON
    where type 'a class_t = 'a GtkVolumeButtonClass.t
    where type 'a activatable_class_t = 'a GtkActivatableClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a orientable_class_t = 'a GtkOrientableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_volume_button_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_volume_button_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
    end
    type 'a class_t = 'a GtkVolumeButtonClass.t
    type 'a activatable_class_t = 'a GtkActivatableClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a orientable_class_t = 'a GtkOrientableClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkVolumeButtonClass.C.fromPtr false) new_ ()
    local
      open Property
    in
      val useSymbolicProp =
        {
          get = fn x => get "use-symbolic" boolean x,
          set = fn x => set "use-symbolic" boolean x
        }
    end
  end

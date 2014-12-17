signature GTK_TOOL_SHELL =
  sig
    type 'a class_t
    type reliefstyle_t
    type toolbarstyle_t
    type orientation_t
    type 'a sizegroupclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getEllipsizeMode : 'a class_t -> Pango.EllipsizeMode.t
    val getIconSize : 'a class_t -> LargeInt.int
    val getOrientation : 'a class_t -> orientation_t
    val getReliefStyle : 'a class_t -> reliefstyle_t
    val getStyle : 'a class_t -> toolbarstyle_t
    val getTextAlignment : 'a class_t -> real
    val getTextOrientation : 'a class_t -> orientation_t
    val getTextSizeGroup : 'a class_t -> base sizegroupclass_t
    val rebuildMenu : 'a class_t -> unit
  end

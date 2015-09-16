signature GTK_TOOL_SHELL =
  sig
    type 'a class_t
    type relief_style_t
    type toolbar_style_t
    type orientation_t
    type 'a size_group_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getEllipsizeMode : 'a class_t -> Pango.EllipsizeMode.t
    val getIconSize : 'a class_t -> LargeInt.int
    val getOrientation : 'a class_t -> orientation_t
    val getReliefStyle : 'a class_t -> relief_style_t
    val getStyle : 'a class_t -> toolbar_style_t
    val getTextAlignment : 'a class_t -> real
    val getTextOrientation : 'a class_t -> orientation_t
    val getTextSizeGroup : 'a class_t -> base size_group_class_t
    val rebuildMenu : 'a class_t -> unit
  end

signature GTK_TOOL_SHELL =
  sig
    type 'a class
    type relief_style_t
    type toolbar_style_t
    type orientation_t
    type 'a size_group_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getEllipsizeMode : 'a class -> Pango.EllipsizeMode.t
    val getIconSize : 'a class -> LargeInt.int
    val getOrientation : 'a class -> orientation_t
    val getReliefStyle : 'a class -> relief_style_t
    val getStyle : 'a class -> toolbar_style_t
    val getTextAlignment : 'a class -> real
    val getTextOrientation : 'a class -> orientation_t
    val getTextSizeGroup : 'a class -> base size_group_class
    val rebuildMenu : 'a class -> unit
  end

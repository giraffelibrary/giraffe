signature GTK_SCALE_BUTTON_ACCESSIBLE =
  sig
    type 'a class
    type t = base class
    val asAction : 'a class -> base Atk.ActionClass.class
    val asComponent : 'a class -> base Atk.ComponentClass.class
    val asImage : 'a class -> base Atk.ImageClass.class
    val asValue : 'a class -> base Atk.ValueClass.class
    val getType : unit -> GObject.Type.t
  end

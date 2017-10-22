signature GTK_IMAGE_ACCESSIBLE =
  sig
    type 'a class
    type t = base class
    val asComponent : 'a class -> base Atk.ComponentClass.class
    val asImage : 'a class -> base Atk.ImageClass.class
    val getType : unit -> GObject.Type.t
  end

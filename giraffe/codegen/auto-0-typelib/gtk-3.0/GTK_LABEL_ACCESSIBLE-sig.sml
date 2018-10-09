signature GTK_LABEL_ACCESSIBLE =
  sig
    type 'a class
    type t = base class
    val asComponent : 'a class -> base Atk.ComponentClass.class
    val asHypertext : 'a class -> base Atk.HypertextClass.class
    val asText : 'a class -> base Atk.TextClass.class
    val getType : unit -> GObject.Type.t
  end

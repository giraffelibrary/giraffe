signature GTK_RENDERER_CELL_ACCESSIBLE =
  sig
    type 'a class
    type 'a cell_renderer_class
    type t = base class
    val asAction : 'a class -> base Atk.ActionClass.class
    val asComponent : 'a class -> base Atk.ComponentClass.class
    val getType : unit -> GObject.Type.t
    val new : 'a cell_renderer_class -> base class
    val rendererProp :
      {
        get : 'a class -> base cell_renderer_class option,
        new : 'b cell_renderer_class option -> 'a class Property.t
      }
  end
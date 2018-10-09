signature GTK_TEXT_VIEW_ACCESSIBLE =
  sig
    type 'a class
    type t = base class
    val asComponent : 'a class -> base Atk.ComponentClass.class
    val asEditableText : 'a class -> base Atk.EditableTextClass.class
    val asStreamableContent : 'a class -> base Atk.StreamableContentClass.class
    val asText : 'a class -> base Atk.TextClass.class
    val getType : unit -> GObject.Type.t
  end

structure GtkTextViewAccessible :>
  GTK_TEXT_VIEW_ACCESSIBLE
    where type 'a class = 'a GtkTextViewAccessibleClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_text_view_accessible_get_type") (cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class = 'a GtkTextViewAccessibleClass.class
    type t = base class
    fun asComponent self = (GObjectObjectClass.FFI.withPtr ---> AtkComponentClass.FFI.fromPtr false) I self
    fun asEditableText self = (GObjectObjectClass.FFI.withPtr ---> AtkEditableTextClass.FFI.fromPtr false) I self
    fun asStreamableContent self = (GObjectObjectClass.FFI.withPtr ---> AtkStreamableContentClass.FFI.fromPtr false) I self
    fun asText self = (GObjectObjectClass.FFI.withPtr ---> AtkTextClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end

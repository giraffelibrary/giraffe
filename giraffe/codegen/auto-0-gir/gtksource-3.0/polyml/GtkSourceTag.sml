structure GtkSourceTag :>
  GTK_SOURCE_TAG
    where type 'a class = 'a GtkSourceTagClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_tag_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_source_tag_new") (Utf8.PolyML.cInOptPtr --> GtkTextTagClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkSourceTagClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new name = (Utf8.FFI.withOptPtr 0 ---> GtkSourceTagClass.FFI.fromPtr true) new_ name
    local
      open ValueAccessor
    in
      val drawSpacesProp =
        {
          name = "draw-spaces",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val drawSpacesSetProp =
        {
          name = "draw-spaces-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end

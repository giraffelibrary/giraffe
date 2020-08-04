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
      open Property
    in
      val drawSpacesProp =
        {
          get = fn x => get "draw-spaces" boolean x,
          set = fn x => set "draw-spaces" boolean x,
          new = fn x => new "draw-spaces" boolean x
        }
      val drawSpacesSetProp =
        {
          get = fn x => get "draw-spaces-set" boolean x,
          set = fn x => set "draw-spaces-set" boolean x,
          new = fn x => new "draw-spaces-set" boolean x
        }
    end
  end

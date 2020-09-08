structure GtkSourceTag :>
  GTK_SOURCE_TAG
    where type 'a class = 'a GtkSourceTagClass.class =
  struct
    val getType_ = _import "gtk_source_tag_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_gtk_source_tag_new" : Utf8.MLton.p1 * Utf8.FFI.opt Utf8.MLton.p2 -> GtkTextTagClass.FFI.non_opt GtkTextTagClass.FFI.p;
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

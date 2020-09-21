signature GTK_GRADIENT =
  sig
    type t
    type symbolic_color_t
    type 'a style_properties_class
    type 'a style_context_class
    val getType : unit -> GObject.Type.t
    val newLinear :
      real
       * real
       * real
       * real
       -> t
    val newRadial :
      real
       * real
       * real
       * real
       * real
       * real
       -> t
    val addColorStop :
      t
       -> real * symbolic_color_t
       -> unit
    val resolve :
      t
       -> 'a style_properties_class
       -> Cairo.PatternRecord.t option
    val resolveForContext :
      t
       -> 'a style_context_class
       -> Cairo.PatternRecord.t
    val toString : t -> string
  end

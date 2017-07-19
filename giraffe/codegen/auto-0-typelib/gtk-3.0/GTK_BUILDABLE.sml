signature GTK_BUILDABLE =
  sig
    type 'a class
    type 'a builder_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val addChild :
      'a class
       -> 'b builder_class
           * 'c GObject.ObjectClass.class
           * string option
       -> unit
    val constructChild :
      'a class
       -> 'b builder_class * string
       -> base GObject.ObjectClass.class
    val getInternalChild :
      'a class
       -> 'b builder_class * string
       -> base GObject.ObjectClass.class
    val getName : 'a class -> string
    val parserFinished :
      'a class
       -> 'b builder_class
       -> unit
    val setBuildableProperty :
      'a class
       -> 'b builder_class
           * string
           * GObject.ValueRecord.t
       -> unit
    val setName :
      'a class
       -> string
       -> unit
  end

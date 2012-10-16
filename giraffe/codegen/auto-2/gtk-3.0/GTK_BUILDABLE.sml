signature GTK_BUILDABLE =
  sig
    type 'a class_t
    type 'a builderclass_t
    val getType : unit -> GObject.Type.t
    val addChild :
      'a class_t
       -> 'b builderclass_t
       -> 'c GObject.ObjectClass.t
       -> string option
       -> unit
    val constructChild :
      'a class_t
       -> 'b builderclass_t
       -> string
       -> base GObject.ObjectClass.t
    val customFinished :
      'a class_t
       -> 'b builderclass_t
       -> 'c GObject.ObjectClass.t option
       -> string
       -> unit
    val customTagEnd :
      'a class_t
       -> 'b builderclass_t
       -> 'c GObject.ObjectClass.t option
       -> string
       -> unit
    val getInternalChild :
      'a class_t
       -> 'b builderclass_t
       -> string
       -> base GObject.ObjectClass.t
    val getName : 'a class_t -> string
    val parserFinished :
      'a class_t
       -> 'b builderclass_t
       -> unit
    val setBuildableProperty :
      'a class_t
       -> 'b builderclass_t
       -> string
       -> GObject.ValueRecord.t
       -> unit
    val setName :
      'a class_t
       -> string
       -> unit
  end

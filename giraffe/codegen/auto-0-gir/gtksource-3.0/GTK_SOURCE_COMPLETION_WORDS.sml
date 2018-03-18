signature GTK_SOURCE_COMPLETION_WORDS =
  sig
    type 'a class
    type 'a completion_provider_class
    type completion_activation_t
    type t = base class
    val asCompletionProvider : 'a class -> base completion_provider_class
    val getType : unit -> GObject.Type.t
    val new : string option * 'a GdkPixbuf.PixbufClass.class option -> base class
    val register :
      'a class
       -> 'b Gtk.TextBufferClass.class
       -> unit
    val unregister :
      'a class
       -> 'b Gtk.TextBufferClass.class
       -> unit
    val activationProp :
      {
        get : 'a class -> completion_activation_t,
        set :
          completion_activation_t
           -> 'a class
           -> unit,
        new : completion_activation_t -> 'a class Property.t
      }
    val iconProp :
      {
        get : 'a class -> base GdkPixbuf.PixbufClass.class option,
        set :
          'b GdkPixbuf.PixbufClass.class option
           -> 'a class
           -> unit,
        new : 'b GdkPixbuf.PixbufClass.class option -> 'a class Property.t
      }
    val interactiveDelayProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val minimumWordSizeProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val nameProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val priorityProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val proposalsBatchSizeProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val scanBatchSizeProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
  end

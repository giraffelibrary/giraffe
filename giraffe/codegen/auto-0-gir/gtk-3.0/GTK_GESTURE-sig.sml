signature GTK_GESTURE =
  sig
    type 'a class
    type event_sequence_state_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val getBoundingBox : 'a class -> Gdk.RectangleRecord.t option
    val getBoundingBoxCenter : 'a class -> (real * real) option
    val getDevice : 'a class -> base Gdk.DeviceClass.class option
    val getLastEvent :
      'a class
       -> Gdk.EventSequenceRecord.t
       -> base Gdk.Event.union option
    val getLastUpdatedSequence : 'a class -> Gdk.EventSequenceRecord.t option
    val getPoint :
      'a class
       -> Gdk.EventSequenceRecord.t option
       -> (real * real) option
    val getSequenceState :
      'a class
       -> Gdk.EventSequenceRecord.t
       -> event_sequence_state_t
    val getWindow : 'a class -> base Gdk.WindowClass.class option
    val group :
      'a class
       -> 'b class
       -> unit
    val handlesSequence :
      'a class
       -> Gdk.EventSequenceRecord.t option
       -> bool
    val isActive : 'a class -> bool
    val isGroupedWith :
      'a class
       -> 'b class
       -> bool
    val isRecognized : 'a class -> bool
    val setSequenceState :
      'a class
       -> Gdk.EventSequenceRecord.t * event_sequence_state_t
       -> bool
    val setState :
      'a class
       -> event_sequence_state_t
       -> bool
    val setWindow :
      'a class
       -> 'b Gdk.WindowClass.class option
       -> unit
    val ungroup : 'a class -> unit
    val beginSig : (Gdk.EventSequenceRecord.t -> unit) -> 'a class Signal.t
    val cancelSig : (Gdk.EventSequenceRecord.t -> unit) -> 'a class Signal.t
    val endSig : (Gdk.EventSequenceRecord.t -> unit) -> 'a class Signal.t
    val sequenceStateChangedSig : (Gdk.EventSequenceRecord.t * event_sequence_state_t -> unit) -> 'a class Signal.t
    val updateSig : (Gdk.EventSequenceRecord.t -> unit) -> 'a class Signal.t
    val nPointsProp :
      {
        get : 'a class -> LargeInt.int,
        new : LargeInt.int -> 'a class Property.t
      }
    val windowProp :
      {
        get : 'a class -> base Gdk.WindowClass.class option,
        set :
          'b Gdk.WindowClass.class option
           -> 'a class
           -> unit,
        new : 'b Gdk.WindowClass.class option -> 'a class Property.t
      }
  end

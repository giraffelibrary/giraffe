signature GDK_DEVICE_PAD =
  sig
    type 'a class
    type device_pad_feature_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val getFeatureGroup :
      'a class
       -> device_pad_feature_t * LargeInt.int
       -> LargeInt.int
    val getGroupNModes :
      'a class
       -> LargeInt.int
       -> LargeInt.int
    val getNFeatures :
      'a class
       -> device_pad_feature_t
       -> LargeInt.int
    val getNGroups : 'a class -> LargeInt.int
  end

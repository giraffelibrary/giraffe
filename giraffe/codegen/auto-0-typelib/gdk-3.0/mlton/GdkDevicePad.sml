structure GdkDevicePad :>
  GDK_DEVICE_PAD
    where type 'a class = 'a GdkDevicePadClass.class
    where type device_pad_feature_t = GdkDevicePadFeature.t =
  struct
    val getType_ = _import "gdk_device_pad_get_type" : unit -> GObjectType.FFI.val_;
    val getFeatureGroup_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_device_pad_get_feature_group" :
              GdkDevicePadClass.FFI.notnull GdkDevicePadClass.FFI.p
               * GdkDevicePadFeature.FFI.val_
               * GInt32.FFI.val_
               -> GInt32.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getGroupNModes_ = fn x1 & x2 => (_import "gdk_device_pad_get_group_n_modes" : GdkDevicePadClass.FFI.notnull GdkDevicePadClass.FFI.p * GInt32.FFI.val_ -> GInt32.FFI.val_;) (x1, x2)
    val getNFeatures_ = fn x1 & x2 => (_import "gdk_device_pad_get_n_features" : GdkDevicePadClass.FFI.notnull GdkDevicePadClass.FFI.p * GdkDevicePadFeature.FFI.val_ -> GInt32.FFI.val_;) (x1, x2)
    val getNGroups_ = _import "gdk_device_pad_get_n_groups" : GdkDevicePadClass.FFI.notnull GdkDevicePadClass.FFI.p -> GInt32.FFI.val_;
    type 'a class = 'a GdkDevicePadClass.class
    type device_pad_feature_t = GdkDevicePadFeature.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getFeatureGroup self (feature, featureIdx) =
      (
        GdkDevicePadClass.FFI.withPtr
         &&&> GdkDevicePadFeature.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> GInt32.FFI.fromVal
      )
        getFeatureGroup_
        (
          self
           & feature
           & featureIdx
        )
    fun getGroupNModes self groupIdx = (GdkDevicePadClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> GInt32.FFI.fromVal) getGroupNModes_ (self & groupIdx)
    fun getNFeatures self feature = (GdkDevicePadClass.FFI.withPtr &&&> GdkDevicePadFeature.FFI.withVal ---> GInt32.FFI.fromVal) getNFeatures_ (self & feature)
    fun getNGroups self = (GdkDevicePadClass.FFI.withPtr ---> GInt32.FFI.fromVal) getNGroups_ self
  end

structure GdkDevicePad :>
  GDK_DEVICE_PAD
    where type 'a class = 'a GdkDevicePadClass.class
    where type device_pad_feature_t = GdkDevicePadFeature.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_device_pad_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getFeatureGroup_ =
        call (getSymbol "gdk_device_pad_get_feature_group")
          (
            GdkDevicePadClass.PolyML.cPtr
             &&> GdkDevicePadFeature.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> GInt32.PolyML.cVal
          )
      val getGroupNModes_ = call (getSymbol "gdk_device_pad_get_group_n_modes") (GdkDevicePadClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> GInt32.PolyML.cVal)
      val getNFeatures_ = call (getSymbol "gdk_device_pad_get_n_features") (GdkDevicePadClass.PolyML.cPtr &&> GdkDevicePadFeature.PolyML.cVal --> GInt32.PolyML.cVal)
      val getNGroups_ = call (getSymbol "gdk_device_pad_get_n_groups") (GdkDevicePadClass.PolyML.cPtr --> GInt32.PolyML.cVal)
    end
    type 'a class = 'a GdkDevicePadClass.class
    type device_pad_feature_t = GdkDevicePadFeature.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getFeatureGroup self (feature, featureIdx) =
      (
        GdkDevicePadClass.FFI.withPtr false
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
    fun getGroupNModes self groupIdx = (GdkDevicePadClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> GInt32.FFI.fromVal) getGroupNModes_ (self & groupIdx)
    fun getNFeatures self feature = (GdkDevicePadClass.FFI.withPtr false &&&> GdkDevicePadFeature.FFI.withVal ---> GInt32.FFI.fromVal) getNFeatures_ (self & feature)
    fun getNGroups self = (GdkDevicePadClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getNGroups_ self
  end

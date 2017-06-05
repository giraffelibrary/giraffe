structure Gio : GIO =
  struct
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    structure GUInt8CVectorNType =
      CValueCVectorNType(
        structure CElemType = GUInt8Type
        structure ElemSequence = MonoVectorSequence(Word8Vector)
      )
    structure GUInt8CVectorN = CVectorN(GUInt8CVectorNType)
    structure ActionGroupClass = GioActionGroupClass
    structure AppInfoClass = GioAppInfoClass
    structure AppLaunchContextClass = GioAppLaunchContextClass
    structure ApplicationClass = GioApplicationClass
    structure ApplicationCommandLineClass = GioApplicationCommandLineClass
    structure ApplicationFlags = GioApplicationFlags
    structure AsyncResultClass = GioAsyncResultClass
    structure CancellableClass = GioCancellableClass
    structure EmblemedIconClass = GioEmblemedIconClass
    structure FileClass = GioFileClass
    structure IconClass = GioIconClass
    structure InitableClass = GioInitableClass
    structure InputStreamClass = GioInputStreamClass
    structure MountOperationClass = GioMountOperationClass
    structure OutputStreamClass = GioOutputStreamClass
    structure PermissionClass = GioPermissionClass
    structure Application = GioApplication
  end

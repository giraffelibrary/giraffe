signature GTK_ABOUT_DIALOG =
  sig
    type 'a class_t
    type license_t
    type 'a buildableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getComments : 'a class_t -> string
    val getCopyright : 'a class_t -> string
    val getLicense : 'a class_t -> string
    val getLicenseType : 'a class_t -> license_t
    val getLogo : 'a class_t -> base GdkPixbuf.PixbufClass.t
    val getLogoIconName : 'a class_t -> string
    val getProgramName : 'a class_t -> string
    val getTranslatorCredits : 'a class_t -> string
    val getVersion : 'a class_t -> string
    val getWebsite : 'a class_t -> string
    val getWebsiteLabel : 'a class_t -> string
    val getWrapLicense : 'a class_t -> bool
    val setComments :
      'a class_t
       -> string option
       -> unit
    val setCopyright :
      'a class_t
       -> string
       -> unit
    val setLicense :
      'a class_t
       -> string option
       -> unit
    val setLicenseType :
      'a class_t
       -> license_t
       -> unit
    val setLogo :
      'a class_t
       -> 'b GdkPixbuf.PixbufClass.t option
       -> unit
    val setLogoIconName :
      'a class_t
       -> string option
       -> unit
    val setProgramName :
      'a class_t
       -> string
       -> unit
    val setTranslatorCredits :
      'a class_t
       -> string option
       -> unit
    val setVersion :
      'a class_t
       -> string option
       -> unit
    val setWebsite :
      'a class_t
       -> string option
       -> unit
    val setWebsiteLabel :
      'a class_t
       -> string
       -> unit
    val setWrapLicense :
      'a class_t
       -> bool
       -> unit
    val activateLinkSig : (string -> bool) -> 'a class_t Signal.signal
    val commentsProp : ('a class_t, string option, string option) Property.readwrite
    val copyrightProp : ('a class_t, string option, string option) Property.readwrite
    val licenseProp : ('a class_t, string option, string option) Property.readwrite
    val licenseTypeProp : ('a class_t, license_t, license_t) Property.readwrite
    val logoProp : ('a class_t, base GdkPixbuf.PixbufClass.t option, 'b GdkPixbuf.PixbufClass.t option) Property.readwrite
    val logoIconNameProp : ('a class_t, string option, string option) Property.readwrite
    val programNameProp : ('a class_t, string option, string option) Property.readwrite
    val translatorCreditsProp : ('a class_t, string option, string option) Property.readwrite
    val versionProp : ('a class_t, string option, string option) Property.readwrite
    val websiteProp : ('a class_t, string option, string option) Property.readwrite
    val websiteLabelProp : ('a class_t, string option, string option) Property.readwrite
    val wrapLicenseProp : ('a class_t, bool, bool) Property.readwrite
  end

signature GTK_ABOUT_DIALOG =
  sig
    type 'a class
    type 'a buildable_class
    type license_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getComments : 'a class -> string
    val getCopyright : 'a class -> string
    val getLicense : 'a class -> string
    val getLicenseType : 'a class -> license_t
    val getLogo : 'a class -> base GdkPixbuf.PixbufClass.class
    val getLogoIconName : 'a class -> string
    val getProgramName : 'a class -> string
    val getTranslatorCredits : 'a class -> string
    val getVersion : 'a class -> string
    val getWebsite : 'a class -> string
    val getWebsiteLabel : 'a class -> string
    val getWrapLicense : 'a class -> bool
    val setComments :
      'a class
       -> string option
       -> unit
    val setCopyright :
      'a class
       -> string
       -> unit
    val setLicense :
      'a class
       -> string option
       -> unit
    val setLicenseType :
      'a class
       -> license_t
       -> unit
    val setLogo :
      'a class
       -> 'b GdkPixbuf.PixbufClass.class option
       -> unit
    val setLogoIconName :
      'a class
       -> string option
       -> unit
    val setProgramName :
      'a class
       -> string
       -> unit
    val setTranslatorCredits :
      'a class
       -> string option
       -> unit
    val setVersion :
      'a class
       -> string option
       -> unit
    val setWebsite :
      'a class
       -> string option
       -> unit
    val setWebsiteLabel :
      'a class
       -> string
       -> unit
    val setWrapLicense :
      'a class
       -> bool
       -> unit
    val activateLinkSig : (string -> bool) -> 'a class Signal.signal
    val commentsProp : ('a class, string option, string option) Property.readwrite
    val copyrightProp : ('a class, string option, string option) Property.readwrite
    val licenseProp : ('a class, string option, string option) Property.readwrite
    val licenseTypeProp : ('a class, license_t, license_t) Property.readwrite
    val logoProp : ('a class, base GdkPixbuf.PixbufClass.class option, 'b GdkPixbuf.PixbufClass.class option) Property.readwrite
    val logoIconNameProp : ('a class, string option, string option) Property.readwrite
    val programNameProp : ('a class, string option, string option) Property.readwrite
    val translatorCreditsProp : ('a class, string option, string option) Property.readwrite
    val versionProp : ('a class, string option, string option) Property.readwrite
    val websiteProp : ('a class, string option, string option) Property.readwrite
    val websiteLabelProp : ('a class, string option, string option) Property.readwrite
    val wrapLicenseProp : ('a class, bool, bool) Property.readwrite
  end

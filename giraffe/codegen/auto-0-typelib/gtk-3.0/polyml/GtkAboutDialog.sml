structure GtkAboutDialog :>
  GTK_ABOUT_DIALOG
    where type 'a class = 'a GtkAboutDialogClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type license_t = GtkLicense.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_about_dialog_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_about_dialog_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val getComments_ = call (load_sym libgtk "gtk_about_dialog_get_comments") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getCopyright_ = call (load_sym libgtk "gtk_about_dialog_get_copyright") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getLicense_ = call (load_sym libgtk "gtk_about_dialog_get_license") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getLicenseType_ = call (load_sym libgtk "gtk_about_dialog_get_license_type") (GObjectObjectClass.PolyML.cPtr --> GtkLicense.PolyML.cVal)
      val getLogo_ = call (load_sym libgtk "gtk_about_dialog_get_logo") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getLogoIconName_ = call (load_sym libgtk "gtk_about_dialog_get_logo_icon_name") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getProgramName_ = call (load_sym libgtk "gtk_about_dialog_get_program_name") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getTranslatorCredits_ = call (load_sym libgtk "gtk_about_dialog_get_translator_credits") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getVersion_ = call (load_sym libgtk "gtk_about_dialog_get_version") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getWebsite_ = call (load_sym libgtk "gtk_about_dialog_get_website") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getWebsiteLabel_ = call (load_sym libgtk "gtk_about_dialog_get_website_label") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getWrapLicense_ = call (load_sym libgtk "gtk_about_dialog_get_wrap_license") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setComments_ = call (load_sym libgtk "gtk_about_dialog_set_comments") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
      val setCopyright_ = call (load_sym libgtk "gtk_about_dialog_set_copyright") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setLicense_ = call (load_sym libgtk "gtk_about_dialog_set_license") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
      val setLicenseType_ = call (load_sym libgtk "gtk_about_dialog_set_license_type") (GObjectObjectClass.PolyML.cPtr &&> GtkLicense.PolyML.cVal --> FFI.PolyML.cVoid)
      val setLogo_ = call (load_sym libgtk "gtk_about_dialog_set_logo") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setLogoIconName_ = call (load_sym libgtk "gtk_about_dialog_set_logo_icon_name") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
      val setProgramName_ = call (load_sym libgtk "gtk_about_dialog_set_program_name") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setTranslatorCredits_ = call (load_sym libgtk "gtk_about_dialog_set_translator_credits") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
      val setVersion_ = call (load_sym libgtk "gtk_about_dialog_set_version") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
      val setWebsite_ = call (load_sym libgtk "gtk_about_dialog_set_website") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
      val setWebsiteLabel_ = call (load_sym libgtk "gtk_about_dialog_set_website_label") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setWrapLicense_ = call (load_sym libgtk "gtk_about_dialog_set_wrap_license") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkAboutDialogClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type license_t = GtkLicense.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkAboutDialogClass.C.fromPtr false) new_ ()
    fun getComments self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getComments_ self
    fun getCopyright self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getCopyright_ self
    fun getLicense self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getLicense_ self
    fun getLicenseType self = (GObjectObjectClass.C.withPtr ---> GtkLicense.C.fromVal) getLicenseType_ self
    fun getLogo self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getLogo_ self
    fun getLogoIconName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getLogoIconName_ self
    fun getProgramName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getProgramName_ self
    fun getTranslatorCredits self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getTranslatorCredits_ self
    fun getVersion self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getVersion_ self
    fun getWebsite self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getWebsite_ self
    fun getWebsiteLabel self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getWebsiteLabel_ self
    fun getWrapLicense self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getWrapLicense_ self
    fun setComments self comments = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setComments_ (self & comments)
    fun setCopyright self copyright = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setCopyright_ (self & copyright)
    fun setLicense self license = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setLicense_ (self & license)
    fun setLicenseType self licenseType = (GObjectObjectClass.C.withPtr &&&> GtkLicense.C.withVal ---> I) setLicenseType_ (self & licenseType)
    fun setLogo self logo = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setLogo_ (self & logo)
    fun setLogoIconName self iconName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setLogoIconName_ (self & iconName)
    fun setProgramName self name = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setProgramName_ (self & name)
    fun setTranslatorCredits self translatorCredits = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setTranslatorCredits_ (self & translatorCredits)
    fun setVersion self version = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setVersion_ (self & version)
    fun setWebsite self website = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setWebsite_ (self & website)
    fun setWebsiteLabel self websiteLabel = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setWebsiteLabel_ (self & websiteLabel)
    fun setWrapLicense self wrapLicense = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setWrapLicense_ (self & wrapLicense)
    local
      open ClosureMarshal Signal
    in
      fun activateLinkSig f = signal "activate-link" (get 0w1 string ---> ret boolean) f
    end
    local
      open Property
    in
      val commentsProp =
        {
          get = fn x => get "comments" stringOpt x,
          set = fn x => set "comments" stringOpt x
        }
      val copyrightProp =
        {
          get = fn x => get "copyright" stringOpt x,
          set = fn x => set "copyright" stringOpt x
        }
      val licenseProp =
        {
          get = fn x => get "license" stringOpt x,
          set = fn x => set "license" stringOpt x
        }
      val licenseTypeProp =
        {
          get = fn x => get "license-type" GtkLicense.t x,
          set = fn x => set "license-type" GtkLicense.t x
        }
      val logoProp =
        {
          get = fn x => get "logo" GdkPixbufPixbufClass.tOpt x,
          set = fn x => set "logo" GdkPixbufPixbufClass.tOpt x
        }
      val logoIconNameProp =
        {
          get = fn x => get "logo-icon-name" stringOpt x,
          set = fn x => set "logo-icon-name" stringOpt x
        }
      val programNameProp =
        {
          get = fn x => get "program-name" stringOpt x,
          set = fn x => set "program-name" stringOpt x
        }
      val translatorCreditsProp =
        {
          get = fn x => get "translator-credits" stringOpt x,
          set = fn x => set "translator-credits" stringOpt x
        }
      val versionProp =
        {
          get = fn x => get "version" stringOpt x,
          set = fn x => set "version" stringOpt x
        }
      val websiteProp =
        {
          get = fn x => get "website" stringOpt x,
          set = fn x => set "website" stringOpt x
        }
      val websiteLabelProp =
        {
          get = fn x => get "website-label" stringOpt x,
          set = fn x => set "website-label" stringOpt x
        }
      val wrapLicenseProp =
        {
          get = fn x => get "wrap-license" boolean x,
          set = fn x => set "wrap-license" boolean x
        }
    end
  end

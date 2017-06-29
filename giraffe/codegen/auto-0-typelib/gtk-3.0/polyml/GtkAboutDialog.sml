structure GtkAboutDialog :>
  GTK_ABOUT_DIALOG
    where type 'a class = 'a GtkAboutDialogClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type license_t = GtkLicense.t =
  struct
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_about_dialog_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_about_dialog_new") (PolyMLFFI.cVoid --> GtkWidgetClass.PolyML.cPtr)
      val getArtists_ = call (getSymbol "gtk_about_dialog_get_artists") (GtkAboutDialogClass.PolyML.cPtr --> Utf8CVector.PolyML.cOutPtr)
      val getAuthors_ = call (getSymbol "gtk_about_dialog_get_authors") (GtkAboutDialogClass.PolyML.cPtr --> Utf8CVector.PolyML.cOutPtr)
      val getComments_ = call (getSymbol "gtk_about_dialog_get_comments") (GtkAboutDialogClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getCopyright_ = call (getSymbol "gtk_about_dialog_get_copyright") (GtkAboutDialogClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getDocumenters_ = call (getSymbol "gtk_about_dialog_get_documenters") (GtkAboutDialogClass.PolyML.cPtr --> Utf8CVector.PolyML.cOutPtr)
      val getLicense_ = call (getSymbol "gtk_about_dialog_get_license") (GtkAboutDialogClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getLicenseType_ = call (getSymbol "gtk_about_dialog_get_license_type") (GtkAboutDialogClass.PolyML.cPtr --> GtkLicense.PolyML.cVal)
      val getLogo_ = call (getSymbol "gtk_about_dialog_get_logo") (GtkAboutDialogClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
      val getLogoIconName_ = call (getSymbol "gtk_about_dialog_get_logo_icon_name") (GtkAboutDialogClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getProgramName_ = call (getSymbol "gtk_about_dialog_get_program_name") (GtkAboutDialogClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getTranslatorCredits_ = call (getSymbol "gtk_about_dialog_get_translator_credits") (GtkAboutDialogClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getVersion_ = call (getSymbol "gtk_about_dialog_get_version") (GtkAboutDialogClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getWebsite_ = call (getSymbol "gtk_about_dialog_get_website") (GtkAboutDialogClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getWebsiteLabel_ = call (getSymbol "gtk_about_dialog_get_website_label") (GtkAboutDialogClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getWrapLicense_ = call (getSymbol "gtk_about_dialog_get_wrap_license") (GtkAboutDialogClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setArtists_ = call (getSymbol "gtk_about_dialog_set_artists") (GtkAboutDialogClass.PolyML.cPtr &&> Utf8CVector.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setAuthors_ = call (getSymbol "gtk_about_dialog_set_authors") (GtkAboutDialogClass.PolyML.cPtr &&> Utf8CVector.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setComments_ = call (getSymbol "gtk_about_dialog_set_comments") (GtkAboutDialogClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> PolyMLFFI.cVoid)
      val setCopyright_ = call (getSymbol "gtk_about_dialog_set_copyright") (GtkAboutDialogClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setDocumenters_ = call (getSymbol "gtk_about_dialog_set_documenters") (GtkAboutDialogClass.PolyML.cPtr &&> Utf8CVector.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setLicense_ = call (getSymbol "gtk_about_dialog_set_license") (GtkAboutDialogClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> PolyMLFFI.cVoid)
      val setLicenseType_ = call (getSymbol "gtk_about_dialog_set_license_type") (GtkAboutDialogClass.PolyML.cPtr &&> GtkLicense.PolyML.cVal --> PolyMLFFI.cVoid)
      val setLogo_ = call (getSymbol "gtk_about_dialog_set_logo") (GtkAboutDialogClass.PolyML.cPtr &&> GdkPixbufPixbufClass.PolyML.cOptPtr --> PolyMLFFI.cVoid)
      val setLogoIconName_ = call (getSymbol "gtk_about_dialog_set_logo_icon_name") (GtkAboutDialogClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> PolyMLFFI.cVoid)
      val setProgramName_ = call (getSymbol "gtk_about_dialog_set_program_name") (GtkAboutDialogClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setTranslatorCredits_ = call (getSymbol "gtk_about_dialog_set_translator_credits") (GtkAboutDialogClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> PolyMLFFI.cVoid)
      val setVersion_ = call (getSymbol "gtk_about_dialog_set_version") (GtkAboutDialogClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> PolyMLFFI.cVoid)
      val setWebsite_ = call (getSymbol "gtk_about_dialog_set_website") (GtkAboutDialogClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> PolyMLFFI.cVoid)
      val setWebsiteLabel_ = call (getSymbol "gtk_about_dialog_set_website_label") (GtkAboutDialogClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setWrapLicense_ = call (getSymbol "gtk_about_dialog_set_wrap_license") (GtkAboutDialogClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkAboutDialogClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type license_t = GtkLicense.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkAboutDialogClass.FFI.fromPtr false) new_ ()
    fun getArtists self = (GtkAboutDialogClass.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 0) getArtists_ self
    fun getAuthors self = (GtkAboutDialogClass.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 0) getAuthors_ self
    fun getComments self = (GtkAboutDialogClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getComments_ self
    fun getCopyright self = (GtkAboutDialogClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getCopyright_ self
    fun getDocumenters self = (GtkAboutDialogClass.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 0) getDocumenters_ self
    fun getLicense self = (GtkAboutDialogClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getLicense_ self
    fun getLicenseType self = (GtkAboutDialogClass.FFI.withPtr ---> GtkLicense.FFI.fromVal) getLicenseType_ self
    fun getLogo self = (GtkAboutDialogClass.FFI.withPtr ---> GdkPixbufPixbufClass.FFI.fromPtr false) getLogo_ self
    fun getLogoIconName self = (GtkAboutDialogClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getLogoIconName_ self
    fun getProgramName self = (GtkAboutDialogClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getProgramName_ self
    fun getTranslatorCredits self = (GtkAboutDialogClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getTranslatorCredits_ self
    fun getVersion self = (GtkAboutDialogClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getVersion_ self
    fun getWebsite self = (GtkAboutDialogClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getWebsite_ self
    fun getWebsiteLabel self = (GtkAboutDialogClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getWebsiteLabel_ self
    fun getWrapLicense self = (GtkAboutDialogClass.FFI.withPtr ---> GBool.FFI.fromVal) getWrapLicense_ self
    fun setArtists self artists = (GtkAboutDialogClass.FFI.withPtr &&&> Utf8CVector.FFI.withPtr ---> I) setArtists_ (self & artists)
    fun setAuthors self authors = (GtkAboutDialogClass.FFI.withPtr &&&> Utf8CVector.FFI.withPtr ---> I) setAuthors_ (self & authors)
    fun setComments self comments = (GtkAboutDialogClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setComments_ (self & comments)
    fun setCopyright self copyright = (GtkAboutDialogClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setCopyright_ (self & copyright)
    fun setDocumenters self documenters = (GtkAboutDialogClass.FFI.withPtr &&&> Utf8CVector.FFI.withPtr ---> I) setDocumenters_ (self & documenters)
    fun setLicense self license = (GtkAboutDialogClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setLicense_ (self & license)
    fun setLicenseType self licenseType = (GtkAboutDialogClass.FFI.withPtr &&&> GtkLicense.FFI.withVal ---> I) setLicenseType_ (self & licenseType)
    fun setLogo self logo = (GtkAboutDialogClass.FFI.withPtr &&&> GdkPixbufPixbufClass.FFI.withOptPtr ---> I) setLogo_ (self & logo)
    fun setLogoIconName self iconName = (GtkAboutDialogClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setLogoIconName_ (self & iconName)
    fun setProgramName self name = (GtkAboutDialogClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setProgramName_ (self & name)
    fun setTranslatorCredits self translatorCredits = (GtkAboutDialogClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setTranslatorCredits_ (self & translatorCredits)
    fun setVersion self version = (GtkAboutDialogClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setVersion_ (self & version)
    fun setWebsite self website = (GtkAboutDialogClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setWebsite_ (self & website)
    fun setWebsiteLabel self websiteLabel = (GtkAboutDialogClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setWebsiteLabel_ (self & websiteLabel)
    fun setWrapLicense self wrapLicense = (GtkAboutDialogClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setWrapLicense_ (self & wrapLicense)
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

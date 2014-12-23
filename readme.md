
	Lazarus Android Module Wizard: Form Designer and Components development model! 
		
	"A wizard to create JNI Android loadable module (.so) in Lazarus/Free Pascal using 
	[datamodule like] Form Designer and Components!" 

	Author: Jose Marques Pessoa : jmpessoa__hotmail_com

		https://github.com/jmpessoa/lazandroidmodulewizard
		http://forum.lazarus.freepascal.org/index.php/topic,21919.0.html

	Acknowledgements: 
              
		-Eny and Phil for the Project wizard hints...
		http://forum.lazarus.freepascal.org/index.php/topic,20763.msg120823.html#msg120823

		-Felipe for the Android support...

		-TrueTom for the Laz4Android Package

			Date:2014-10-18
			FPC: 2.7.1 SVN 28863  win32/arm-android/i386-android/jvm-android
			Lazarus:1.3 trunk svn 46592
			Android NDK: r10c (arm-linux-androideabi-4.6 + x86-4.6)
			http://sourceforge.net/projects/laz4android/files/?source=navbar
			:To Install, please, read the "Laz4Android_readme.txt"

      		-Simonsayz for the great work on Android [GUI] Controls
			Simon,Choi / Choi,Won-sik
			simonsayz@naver.com
			http://blog.naver.com/simonsayz
			http://forum.lazarus.freepascal.org/index.php/topic,22079.0.html

			-warning:	
				.We use a modified and expanded version of Simonsayz's "Controls.java" 
				.We use a modified and expanded version of Simonsayz's "App.java" 

		-Leledumbo - Many collaborations and suggestions!

		-Stephano  - Many collaborations and suggestions!

		-x2nie for Lazarus 1.3 patch [No LCL form design!] 
			http://github.com/x2nie/LiteZarus

                -Fatih KILI� - How To Install!       
                  http://www.youtube.com/watch?v=sQnFYJyltwY&list=UUkQrLhaIXrKY4eq9zTymxpQ

		-Thierry Dijoux - Late: Apk Expert Tools [Build, Install, ...]

		
		-Lazarus forum community!

		
	References:

		Ant	http://ant.apache.org/bindownload.cgi 
			Simply extract the zip file to a convenient location...

                                
Version 0.6 - rev. 10 - 21 December 2014 -

	Important Code Reorganization: A sugestion by Leledumbo [Thank you very much Leledumbo!]

	Significantly reducing the final size of "controls.so"  [just about half!]

	.....................................
	Typical example:

	TAndroidModule1 = class(jForm)
		jButton1: jButton;
		jEditText1: jEditText;
		jListView1: jListView;
		jSpinner1: jSpinner;
		jTextView1: jTextView;
      		procedure jButton1Click(Sender: TObject);
	private
	      	{private declarations}
	public
      		{public declarations}
	end;
	..............................

	Before:
		controls.so  --------- 2768 KB 

	After code reorganization:
		controls.so ---------- 1371 KB


Version 0.6 - rev. 09 - 20 December 2014 -

	NEW! Improve/Add support to ../res/drawable to [many] components:

					.jListView [method]
						ex. jListView1.SetImageByIndex('ic_launcher',0);

					.jImageFileManager [method] 
						ex. jImageFileManager1.LoadFromResources('ic_launcher');

					.jBitmap [property]
						ex. jBitmap1.ImageIdentifier:= 'ic_launcher';

					.jImageView [property]
						ex. jImageView1.ImageIdentifier:= 'ic_launcher';

					.jImageBtn [properties]
						ex. jImageBtn1.ImageDownIdentifier:= 'ic_down';
						ex. jImageBtn1.ImageUpIdentifier:= 'ic_up';

					.jCustomDialog [property]
						ex. jCustomDialog1.IconIdentifier:='ic_launcher';	

					.jActionBarTab1 [property: TStrings]	
						ex. jActionBarTab1.IconIdentifiers

					.jMenu [property: TStrings]	
						ex. jMenu1.IconIdentifiers

					.jContextMenu [property]
						ex. jContextMenu1.HeaderIconIdentifier:= 'ic_launcher';

Version 0.6 - rev. 08 - 15 December 2014 -

	NEW! Add Support to build release Apk! 
		[win  -->> build-release.bat]
		[linux ->> build-release.sh]

		Please, look for:
			readme.txt [Project Folder]
			readme-keytool-input.txt [Project Folder]

	IMPROVEMENTS: 

	Component "jSqliteDataAccess" [.pas]
		
		News Methods:

			SetForeignKeyConstraintsEnabled;
			SetDefaultLocale;

			DeleteDatabase;    		
			CheckDataBaseExistsByName

			InsertIntoTableBatch
			UpdateTableBatch	
			UpdateImageBatch

	Class "jSqliteDataAccess" [java wrapper]

	Added Safe operation:

 		beginTransaction();
			....
		setTransactionSuccessful()
			....
		endTransaction();

	NEW!	App Demo: AppSqliteDemo2

	FIXs	Some minor fixs!
		
Version 0.6 - rev. 07 - 07 December 2014 -

		
	NEW!	.jCustomDialog component [Android Bridges Extra]  <<---- A suggestion and request by Leledumbo

			NEW! Demo: AppCustomDialogDemo1
			ref. image: 
				https://jmpessoa.opendrive.com/files?Ml83MDgwNTQxMl9jTEJkcA
				

Version 0.6 - rev. 06 - 03 December 2014 -
		
	NEW!
		.Add sub entry "Resource Editor" ["Android Module Wizard" to Lazarus IDE "Tools" menu] <<---- by Thierry Dijoux 
		.LATE [IDE Tools]: Improve logcat support:
			--> "TAG Filter" log
			--> "Run Time Error" log
		
	NEW!	.jContextMenu component [Android Bridges Extra]  -->> Improve the support to Android Menus....
		.jMenu - Improve support --> Icons and ActionBar support!

			UPDATE Demo: AppMenuDemo 
			ref. images: 
				https://jmpessoa.opendrive.com/files?Ml82OTk0MjAzNV9VekM1dA
				https://jmpessoa.opendrive.com/files?Ml82OTk0MjE2MF9QS1dTaQ
				https://jmpessoa.opendrive.com/files?Ml82OTk0MjI2OF9jU3ZwSg

		.jActionBarTab component [Android Bridges Extra] - ActionBar TAB Support!

			NEW! Demo: AppActionBarTabDemo1 - 
			ref. Images:
				https://jmpessoa.opendrive.com/files?Ml82OTk0MjM4OV9jRklmaw
				https://jmpessoa.opendrive.com/files?Ml82OTk0MjQ3Ml96N1ZTMg
				https://jmpessoa.opendrive.com/files?Ml82OTk0MjU5MF82VlRrNA

		.Add new methods to jForm  [ActionBar Support!]:
		
			GetActionBar;    
			HideActionBar;
			ShowActionBar;
			ShowTitleActionBar;
			HideLogoActionBar;
			SetTitleActionBar;
			SetSubTitleActionBar;
			SetIconActionBar;
			RemoveAllTabsActionBar();

			SetTabNavigationModeActionBar;  --- Need for ActionBar TAB Support!


		WARNING: Action bar was introduced in Android 3.0 (API level 11)
		[Set targetSdkVersion to >= 14, then test your app on Android 4.0]

		.Others improvements and fixs by Leledumbo!


Version 0.6 - rev. 05 - 13 November 2014 -

	NEW! Lazarus Package "amw_ide_tools.lpk" (*) [..\LazAndroidWizard\ide_tools]

		.Add entry  <<--- by Thierry Dijoux! 
		ref. image: https://jmpessoa.opendrive.com/files?Ml82Nzg4MzAyNF9leGVIVg

		.Add sub entry "Late: Apk Expert Tools [Build, Install, ...]" <<---- by Thierry Dijoux! 
		ref. image: https://jmpessoa.opendrive.com/files?Ml82Nzg4MzA2N184VWZaWg

			:: Improves and automates the "Ant" support!

			:: WARNING: [Build Android Apk]: If you got "[echo] Resolving Build Target for..."
				ref image https://jmpessoa.opendrive.com/files?Ml82Nzk0NzM1N19taU1QUg

				.Please, Open ["build.xml"] {notepad like editor...}

				.Change this line:
					"<property name="target"  value="android-14"/>"
					to another [target] supported by your SDK installation.
					 ex: value="android-17"
				

		.Add sub entry "Upgrade Code Templates [*.lpr, *.java]" 
		ref. image: https://jmpessoa.opendrive.com/files?Ml82Nzg4MzA3Ml80MFVjSQ

			:: Yes, Now became easy to keep the [olds] projects in sync with the new AMW version-revision!	

		.Add sub entry "Path Settings [JDK, SDK, NDK, ...]" <<--- Stephano's sugestion! (**)
		ref. image: https://jmpessoa.opendrive.com/files?Ml82Nzg4MzA1OF9yVVU3RA

			:: WARNING: I recommend that "new" User start here: Set Paths to JDK, SDK, NDK, ...
		
		(*)Please, look for [and install it!] "amw_ide_tools.lpk" in folder ..\LazAndroidWizard\ide_tools 

		(**) Yes, this paths configuration was removed from prompt dialog of "Android Module Wizard"
		ref. image: https://jmpessoa.opendrive.com/files?Ml82Nzg4MzE0Nl9LczBuTQ
		
		WARNING! Windows Users: Please, update to [new] TrueTom Laz4Android [or some more advanced!]
		 ref. http://sourceforge.net/projects/laz4android/files/?source=navbar
		:To Install, please, read the "Laz4Android_readme.txt"

	NEW!	.jShareFile component [Android Bridges Extra]
		.jImageFileManager component [Android Bridges Extra]

		.Add new methods to jForm:
									
			CopyFile;
			DeleteFile;
			CreateDir;
			LoadFromAssets; //<-- result the full path to app internal storage
			
			GetEnvironmentDirectoryPath;
			GetInternalAppStoragePath;
							
			IsSdCardMounted;								
			IsExternalStorageEmulated;
			IsExternalStorageRemovable;

			IsWifiEnabled;
			SetWifiEnabled;

	NEW! DEMO AppShareFileDemo1 [Eclipse Project] 
		-->> jShareFile, jTexFileManager and jImageFileManager
																									
	FIX! Improves/fix the support to Project Compiler Options ... Thanks to Stephano! 

Version 0.6 - rev. 04 - 23 October 2014 -

	NEW! Add support to [jApp] plurals and locale. [thanks to Thierrydijoux]
	NEW! Add support to string resource. [thanks to Thierrydijoux]

	NEW! Add Api [jApp] GetControlsVersionFeatures ...
	NEW! Add Api [jApp] GetControlsVersionInfo ...

	Fix! Enable default android's theme. [thanks to Thierrydijoux]
	Fix! fix formWorkspace tab order and added android target 19.[thanks to Thierrydijoux]

Version 0.6 - rev. 03 - 22 October 2014 -
									   
	UNDOES rev. 02: a new approach/solution for missing ".so" in Lazarus rev < 46598 [just windows!] 
	FIX the [absolut] output file paths! [Thanks to Stephano!]

	NEW! Simplifies navigation in dialog 2: "select java source"

Version 0.6 - rev. 02 - 20 October 2014 -

	NEW! [Dialog config paths ...] Add Checkbox to configure output files path 
	NEW! [Dialog config paths ...] Add Checkbox to add ".so" suffix

Version 0.6 - rev. 01 - 20 October 2014 -

	NEW! Added Support to Laz4Android [by TrueTom]: 
		Lazarus:1.3 trunk svn 46592 +  
		FPC: 2.7.1 SVN 28863  win32/arm-android/i386-android/jvm-android
		http://sourceforge.net/projects/laz4android/files/?source=navbar

Version 0.6 - 15 October 2014 -

	1. NEW !!

		-->> Android Widgets Fom Designer! //<<--- thanks to LiteZarus by x2nie! 

                      form1 design : https://jmpessoa.opendrive.com/files?Ml82NTQ0NDMxNl9CV292dg
                      form1 Screen : https://jmpessoa.opendrive.com/files?Ml82NTQ0NDM2OV9SUVJ1NA

                      form2 design : https://jmpessoa.opendrive.com/files?Ml82NTQ0Nzk5N19RbXFjVw
                      form2 Screen : https://jmpessoa.opendrive.com/files?Ml82NTQ0NzQ3NF9wMGhHcQ

		WARNING! Windows Users: Please, update to [new] TrueTom Laz4Android [or some more advanced!]
			ref. http://sourceforge.net/projects/laz4android/files/?source=navbar
			:To Install, please, read the "Laz4Android_readme.txt"

			1. From Laz4Android IDE - Install Wizard Packages

			1.1 Package -> Open Package -> "tfpandroidbridge_pack.lpk"  [Android Components Bridges!]
				Ref. image: https://www.opendrive.com/files?Ml8zNjMwNDQ3NF83SzhsZg

			1.1.1 From Package Wizard
				- Compile
				- Use -> Install
 			1.2 Package -> Open Package -> "lazandroidwizardpack.lpk"
   			1.2.1 From Package Wizard
				- Compile
				- Use -> Install  
  
 			1.3 Package -> Open Package -> "amw_ide_tools.lpk"  [folder: ..\LazAndroidWizard\ide_tools]
   			1.3.1 From Package Wizard
				- Compile
				- Use -> Install    
				- ref. https://jmpessoa.opendrive.com/files?Ml82NzAyMTYwMl9pUDV3RQ 

			HINT: to compile/install/reinstall a package in Laz4Android,
				please, open a "dummy" windows project.... you always MUST close the cross compile project!  
			
		-->> Linux Users: Get Lazarus 1.3 rev >= 45216,45217 ... and fpc 2.7.1 cross /arm/x86/android ... etc.
     

	2. NEW !! 

		-->> AppTest1 [eclipse project] :: jPanel and form close/callback demo...

		-->> AppTest2 [eclipse project]::Present direct/hack JNI access and a new component implementation
						model "laz_and_jni_controls.pas" [not java wrapper at all!] 
						[--->> A suggestion and request by Stephano]
                    
		-->> AppAntDemo1 [Ant project] was adjusted/updated !  
		-->> All Apps Demos [Eclipse projects] was adjusted/updated !  
		-->> All project now support Ant "build.*" "intall.*" etc..
			:warning: if needed change this files according to your system! 	

	3. Guide line for "Old" Projects [Collateral Effects]

		-->> Some TAndroidModule Form properties was supressed!
                -->> Some jComponents properties was supressed!

			Please, no panic! When prompt "Read error" [Unknown Property] just choice "Continue Loading" !

		-->> Components conteiners behavior [jPanel e jScrollView] :  remove and put [again] yours controls into them!
                 
		-->> Now adjust yours widgets, the concept continue the same: 

			.LayoutParamWidth/LayoutParamHeight
			.Anchor
			.PosRelativeToAnchor
			.PosRelativeToParent

			WARNING: android's "wildcards" [WrapContent and lpMatchParent] overlaps the design vision!
					and more: if this properties values are achieved the "Object Inspector" will "freeze"
					this value! To "unfreeze" not just change by design, you will need
					change the value in OI by hand to any other value, so it will adjust correctly! 

		-->> Add new "AndroidWidget" unit to uses clauses [*.lpr/*.pas]

	4. How to use the Demos:

		Change this information to correct one!

		"C:\adt32\ndk7"   -- just my system NDK path
		"C:\adt32\eclipse\workspace"  -- just my system eclipse workspace 

		1. Go to Lazarus IDE

			->Project

			->Project -> Option

			->Path

			change/modify paths according to your system ..

			-->Others

			change/modify paths according to your system ..

		2. If needed: open/edit the "controls.lpi" [...\jni],  you can use Notepad like editor....

		Modify some [piece] of path information like:

		[C:\adt32\eclipse\workspace] 
		[C:\adt32\ndk7]

		according to your system ..
	                                
	5.FIXs [BUGS]    

		-->> The form *.lfm parse now is OK !!!

		---> jListView bug fix[check/not checkd] 
			and new added properties: "HighLightSelectedItem" [True/False] and "HighLightSelectedItemColor" 
			                          
Version 0.5 - rev. 03 - 17 august 2014 -

	:: New jLocation Component: Add Partial Support for Location Object //<<---- A suggestion and request by Fatih KILI�
	:: New jPreference Component: Add Partial Support for Preferences Object //<<---- A suggestion and request by Fatih KILI�
	:: NEW AppLocationDemo [Eclipse Project] 

Version 0.5 - rev. 02 - 14 june 2014 -

	:: New Add Partial Support for Spinner Object //<<---- A suggestion and request by Leledumbo
	:: NEW AppSpinerDemo [Eclipse Project] 
	:: NEW AppSListViewDemo [Eclipse Project] :: fix RadioButton behavior...//<<---- A suggestion and request by Leledumbo
	:: Warning: Bluetooth support yet unfinished! [BUG?]!

Version 0.5 - rev. 01 - 06 May 2014 -

	:: NEW Add Partial Support for Menu Object [Option Menu/SubMenu and Context Menu]! 
	:: NEW jMenu Component [Android Bridges EXtra]
	:: NEW AppMenuDemo [Eclipse Project]

Version 0.5 - 05 May 2014 -

	:: NEW Add Component Create Wizard!
		:: It Now offers two new aid/assistance to increase the productivity of coding.

		1.You can now produce a almost complete pascal component code from a java wrapper class!
		2.You can now get assistance for produce the java warapper class!
		:: Please, read "how_to_create_new_components.txt"

	:: New Components[Android Bridges Extra] and Demos [Eclipse Projects]: 

		jMyHello	[AppTryCode1] 
		jMediaPlayer	[AppTryCode2]
 
		jTextFileManager, jDumpJavaMethods [AppTryCode3]
 

version 0.4 - revision: 05 - 02 March - 2014 -

	:: Added NEW method GetText to jListView [and minor bug fix]
	:: Update [Eclipse] AppDemo1 [List View Demo]

version 0.4 - revision: 04 - 01 March - 2014 -

	:: New Add Custom Row Support to jListView
	:: Update [Eclipse] AppDemo1 [List View Demo]

version 0.4 - revision: 03 - 19 February - 2014 -

	:: New Add Image/BLOB Support to SQLite: jSqliteDataAccess, jSqliteCursor

version 0.4 - revision: 02 - 17 February - 2014 - Minor update...

version 0.4 - revision: 01 - 16 February - 2014 -

	:: New Add [Partial] Support to SQLite: jSqliteDataAccess, jSqliteCursor
		Supported FIELD_TYPE: [INTEGER, STRING, FLOAT] 
        ::New Eclipse project demo:  AppSqliteDemo1

version 0.4 - 08 February - 2014 -

 	:: NEW! Add Support for Android API > 13. 
         	1.A new code architecture! 
		2.A lot of code lines was fix/changed/Add!
	:: Fix BackButton issue. Now all Forms close correctly. [See AppDemo1]  	
	
	:: warning: compatibility issue:  
       		1. jForm: 
			no more has the property "BackButton". 
			no more has the property "MainActivity".

                  	[Indeed, now there is property "ActivityMode": (actMain, actSplash, actDisposable, actRecyclable)]
			Please,  edit/modify you *.lfm before loading your old project 

                                        
		2. jEditText: no more has the property "SingleLine". 
			Please,  edit/modify you *.lfm before loading your old project 
		3. jView: the Canvas property  now is a component property. 
			Please, drop the new jCanvas component and set/configure it.[See AppDemo1]
	:: known issues: 
		jEditText1: the "InputTypeEx" property at the moment is just "dummy". 
			Indeed, it is hard coded as "itxMultiLine", others values crash app! Why? 
            
	:: The [Projects] Demos were updated. 

	:: known issues: 
		AppDemo1: jCanvasES2 demo: [2D an 3D]: the draw disappear on the [second] button click after the BackButton pressed...
                                            

version 0.3 - revision 0.3 - 30 December 2013 -

	:: New! Add Option to Select Android Platform 

version 0.3 - revision 0.2 - 29 December 2013 -

	:: New! Support for Linux! Thanks to Leledumbo! 
		by Leledumbo for Linux users:
		1. Build all libraries in the  ../LazAndroidWizard/linux/dummylibs
		2. Put it somewhere ldconfig can find (or just run ldconfig with their directories as arguments)

		"The idea of this is just to make the package installable in the [Lazarus for Linux] IDE,
			applications will still use the android version of the libraries."
  
		ref. http://forum.lazarus.freepascal.org/index.php/topic,21919.msg137216/topicseen.html
       

version 0.3 - revision 0.1 - 28 December 2013 -

 	:: New! Introduces Support for multi build modes [ArmV6, ArmV7a, x86]
                
version 0.3 - 22 December 2013 

	:: NEW! Introduces Support to Ant Project  

		ref. http://ant.apache.org/bindownload.cgi 
			Then simply extract the zip file to a convenient location...

version 0.2 - 14 December 2013 -

	:: NEW! Introduces Android [GUI] Android Components Bridges - Based on Simonsayz's controls 

version 0.1 - revision 0.1 - 09 September - 2013 -	 

	:: Bugs fixs!

version 0.1 - August 2013 -

	:: Warning: at the moment this code is just a *proof-of-concept*
              
II.  Ant Projec Development: please, read "install_tutorial_ant_users.txt"

III. Eclipse Project Development: please, read "install_tutorial_eclipse_users.txt"

IV. Technical Notes: dependencies on laz4android [win32] IDE cross compiler: 
    
	--> About Package, Components, LCL  and NDK libs: *.so 

1. About Package creation: just LCLBase is permitted! not "LCL"! 

	- You will nedd  LCLBase Required Package for register procedure.
	- yes, other No GUI stuff is permitted.

2. Abou Component creation
   
	2.1. If you will use custom icon then you will need two files: the first to compoment(s) code
		and the second for Register procedure code.

        example:

	2.1.1. File 1 - foo.pas - component code - here no LCL dependency at all!

	unit foo;

	{$mode objfpc}{$H+}

	interface	

	uses
	  Classes, SysUtils;

	type

	TFoo = class(TComponent)
  	private
	{ Private declarations }
	protected
	{ Protected declarations }
	public
	{ Public declarations }
	published
	{ Published declarations }
	end;


	implementation

  
	end.
        
	2.1.2. File 2 - regtfoo.pas - register component code -  here you will nedd LCLBase for LResources unit

	unit regtfoo;

	{$mode objfpc}{$H+}

	interface

	uses
		Classes, SysUtils, LResources {nedded for custom icon loading...}; 

	Procedure Register;

	implementation

	Procedure Register;
	begin
		{$I tfoo_icon.lrs}  //you custom icon
		RegisterComponents('Android Bridges',[TFoo);
	end;

	initialization

	end.   

	:: [Edited 04-May-2014] :: WARNING:  Please, read the  NEW ""how_to_create_new_components.txt" - 

3. About NDK libs (.so) dependency on laz4android [win32] IDE cross compiler
     
3.1.  You will need two files: the first to NDK *.so lib interface and the second for you component/unit code.

	Example:
	
	3.1.1. File 1 - "And_log_h.pas" - the header interface file
 	
	unit And_log_h;
	{$mode delphi}

	interface

	const libname='liblog.so';

  	ANDROID_LOG_UNKNOWN=0;
      	ANDROID_LOG_DEFAULT=1;
      	ANDROID_LOG_VERBOSE=2;
      	ANDROID_LOG_DEBUG=3;
      	ANDROID_LOG_INFO=4;
      	ANDROID_LOG_WARN=5;
      	ANDROID_LOG_ERROR=6;
      	ANDROID_LOG_FATAL=7;
      	ANDROID_LOG_SILENT=8;

	type
	android_LogPriority=integer;
  
	function __android_log_write(prio:longint; tag,text: pchar):longint; cdecl; external libname name '__android_log_write';

	implementation

	end.

	3.1.2. File 2 - "And_log.pas" - component/unit code

	unit And_log;

	interface

	uses	And_log_h;  // <-- here is the link/bind to NDK lib

	jLog = class(jControls)
        
        end;

	jLog  = class(jControl)
  	private
	{ Private declarations }
	protected
	{ Protected declarations }

	public
	{Public declarations }

          procedures wLog(msg: pchar);  // << ----------- dependency!

	published
	{ Published declarations }
	end;

	implementation

	procedure jLog.WLog(msg: pchar);
	begin
     	    __android_log_write(ANDROID_LOG_FATAL,'crap',msg);  // << ---------- dependency!
	end;

	end.

V. Ref. Lazarus forum: http://forum.lazarus.freepascal.org/index.php/topic,21919.0.html

     -Help and Hints
     -Bugs : [SOLVED!] {known bug: fail on Api > 13. Temporary solution: a workaround to prevent Api > 13 - 02 jan 2014} 
     -Sugestions 
     -Colaborations	
     -Critics
     -Roadmap
     -etc..

VI. The work is just beginning!

VII. Thank you!

    _____jmpessoa_hotmail_com_____
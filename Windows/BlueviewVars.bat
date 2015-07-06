set /a __BLUEVIEW_VARS_DEPTH += 1

if 1 == %__BLUEVIEW_VARS_DEPTH% (cmd /k BlueviewVars.bat)

@set "CSZ_ROOT=D:\devel"
@set "PATH=%PATH%;%CSZ_ROOT%\PortablePython2.7.3.2\App"
@set "PATH=%PATH%;%CSZ_ROOT%\Python25\Scripts"
@set "PATH=%PATH%;%CSZ_ROOT%\SlikSvn\bin"

@rem NO CYWGIN
@rem @set "PATH=%PATH%;%CSZ_ROOT%\cygwin\bin"

@rem @set "PATH=%PATH%;%CSZ_ROOT%\Perl\bin"
@rem Set the Perl path at the beginning so Git's Perl or other Perls aren't used instead
@set "PATH=%CSZ_ROOT%\Perl\bin;%PATH%"

@rem @set "PATH=%PATH%;%CSZ_ROOT%\CollabNet\SubversionClient"
@set "PATH=%PATH%;C:\Program Files\TortoiseSVN\bin"

@set "PATH=%PATH%;%CSZ_ROOT%\Wix35"

@set "BOOST_DIR=%CSZ_ROOT%\boost\boost_1_46_1"

set "QTDIR=%CSZ_ROOT%\Qt\vs2010\4.8.4"
set "QMAKESPEC=%QTDIR%\mkspecs\win32-msvc2010"
@rem Make sure Matlab's Qt DLLs don't get loaded
set "PATH=%QTDIR%\bin;%PATH%"





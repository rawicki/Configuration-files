import XMonad
import XMonad.Config.Gnome
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig (additionalKeys)
import System.IO


main = do
	xmproc <- spawnPipe "xmobar"
	xmonad $ gnomeConfig
		{
			modMask = mod4Mask
		  , layoutHook = smartBorders $ layoutHook gnomeConfig
		  , manageHook = manageDocks <+> myManageHook <+> manageHook gnomeConfig
		  , logHook = dynamicLogWithPP $ xmobarPP
		  {
			    ppOutput = hPutStrLn xmproc
			  , ppTitle = xmobarColor "green" "" . shorten 50
		  }
		} `additionalKeys` [
			((mod4Mask, xK_p), spawn "dmenu_run")
		]

myManageHook = composeOne
	[ isFullscreen 				-?> doFullFloat
	, className =? "skype"      -?> doFloat
	, className =? "pidgin"     -?> doFloat
	, className =? "Pidgin"     -?> doFloat
	]

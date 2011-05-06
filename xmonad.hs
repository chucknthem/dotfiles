import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook

main = do
h <- spawnPipe "xmobar"                                                                                                                                                                                                                      
xmonad $ withUrgencyHook NoUrgencyHook $ defaultConfig {
   logHook = dynamicLogWithPP $ defaultPP { ppOutput = hPutStrLn h }
   , manageHook = manageDocks <+> manageHook defaultConfig
   , layoutHook = avoidStruts  $  layoutHook defaultConfig
}

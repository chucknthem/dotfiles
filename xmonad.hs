import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run
import XMonad.Hooks.ManageDocks

main = do
h <- spawnPipe "xmobar"
xmonad $ defaultConfig {
   logHook = dynamicLogWithPP $ defaultPP { ppOutput = hPutStrLn h }
   , manageHook = manageDocks <+> manageHook defaultConfig
   , layoutHook = avoidStruts  $  layoutHook defaultConfig
}   
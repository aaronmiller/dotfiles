hs.hotkey.bind({"option"}, "space", function()
  local alacritty = hs.application.find('alacritty')
  if alacritty:isFrontmost() then
    alacritty:hide()
  else
    hs.application.launchOrFocus(os.getenv("HOME") .. "/devtools/alacritty/target/release/osx/Alacritty.app")
  end
end)

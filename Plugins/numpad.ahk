; ; 出先PCで半角数字を入力する
; 1::Send, {Numpad1}
; 2::Send, {Numpad2}
; 3::Send, {Numpad3}
; 4::Send, {Numpad4}
; 5::Send, {Numpad5}
; 6::Send, {Numpad6}
; 7::Send, {Numpad7}
; 8::Send, {Numpad8}
; 9::Send, {Numpad9}
; 0::Send, {Numpad0}


; 左手テンキー
; 修飾キーと無変換の組み合わせのトリガーを有効にする(例: ^{vk1D}r::OneNote赤文字)
#If, !(GetKeyState("Ctrl", "P")
  || GetKeyState("Shift", "P")
    || GetKeyState("Alt", "P")
      || GetKeyState("LWin", "P"))
  vk1C & z::Send, 0
  vk1C & x::Send, 1
  vk1C & c::Send, 2
  vk1C & v::Send, 3
  vk1C & s::Send, 4
  vk1C & d::Send, 5
  vk1C & f::Send, 6
  vk1C & w::Send, 7
  vk1C & e::Send, 8
  vk1C & r::Send, 9
  vk1C & b::Send, =
  vk1C & a::Send, *
  vk1C & q::Send, {NumpadDiv}
  vk1C & g::Send, {+}
  vk1C & t::Send, -
  vk1C & Tab::Send, {Enter}
  vk1C & LWin::Send, .
#If

; テンキー
; Numpad0::Return
; Numpad1::Return
; Numpad2::Return
; Numpad3::Return
; Numpad4::Return
; Numpad5::Return
; Numpad6::Return
; Numpad7::Return
; Numpad8::Return
; Numpad9::Return
; NumpadDot::Return
; NumpadAdd::Return
; NumpadSub::Return
; NumpadMult::Return
; NumpadDiv::Return
; NumpadEnter::Return

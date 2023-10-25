﻿#Persistent
#SingleInstance, Force
#NoEnv
#UseHook
#InstallKeybdHook
#InstallMouseHook
#HotkeyInterval, 2000
#MaxHotkeysPerInterval, 200
Process, Priority,, Realtime
SendMode, Input
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 2
; SetKeyDelay, , 10

; 変数の初期化
#Include, %A_ScriptDir%\Variables.ahk

; メニューアイコン設定
Menu, Tray, Icon, icon.ico

; プラグインの検出・取り込み
If (search_plugins()) {
  Reload
}

search_plugins() {
  ; Pluginsフォルダ内のAHKスクリプト名を整形してplugin_filesに格納
  plugin_files := ""
  Loop, %A_ScriptDir%\Plugins\*.ahk {
    plugin_files .= "#" . "Include *i %A_ScriptDir%\Plugins\" . A_LoopFileName . "`n"
  }
  If (plugin_files == "") {
    Return 0
  }
  ; Pluginsの変更点を認識
  file := FileOpen(A_ScriptDir . "\PluginList.ahk", "r `n", "utf-8")
  If (file) {
    plugin_list_old := file.Read(file.Length)
    file.Close
    If (plugin_list_old == plugin_files) {
      Return 0
    }
  }
  ; plugin_list_oldをplugin_filesに書き換える
  file := FileOpen(A_ScriptDir . "\PluginList.ahk", "w `n", "utf-8")
  If (!file) {
    Return 0
  }
  file.Write(plugin_files)
  file.Close
  Return 1
}

; 練習用キー無効化
hotkeys_define(keys_practice, "keys_practice", "On")
keys_practice:
  count++
  If (count > 1)
    my_tooltip_function("そのキーは禁止です(" . count - 1 . "回目)", 1000)
Return

; (AutoExexuteここまで)

#Include, %A_ScriptDir%\PluginList.ahk

; 共通サブルーチン
; ツールチップ
my_tooltip_function(str, delay) {
  ToolTip, %str%
  SetTimer, remove_tooltip, -%delay%
}

remove_tooltip:
  ToolTip
Return

remove_tooltip_all:
  SetTimer, remove_tooltip, Off
  Loop, 20
  ToolTip, , , , % A_Index
Return

;カレントディレクトリ取得
get_current_dir() {
  explorerHwnd := WinActive("ahk_class CabinetWClass")
  If (explorerHwnd) {
    for window in ComObjCreate("Shell.Application").Windows {
      If (window.hwnd==explorerHwnd)
        Return window.Document.Folder.Self.Path
    }
  }
}

; ループでホットキー定義
hotkeys_define(keys, label, OnOff) {
  Loop, PARSE, keys, `,
    Hotkey, %A_LoopField%, %label%, %OnOff%
  Return
}

disable_keys:
Return

; 改行コード除去
rm_crlf(str) {
  str := RegExReplace(str, "\n", "")
  str := RegExReplace(str, "\r", "")
  Return str
}

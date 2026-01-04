# Windows PC セットアップ自動化スクリプト

Windows PCを定期的にリセットして、クリーンな状態を保つための環境復元スクリプト集。

## 使い方

管理者権限でコマンドプロンプトまたはPowerShellを開き、以下を実行:

```batch
my_setup.bat
```

## 補足

### McAfeeのアンインストール

新しいPCにMcAfeeがプリインストールされている場合は、**設定 > アプリ > インストールされているアプリ**から手動でアンインストールしてください。

McAfee削除後、Windows Defenderが正常に動作していることを確認:

```powershell
Get-MpComputerStatus | Select-Object AntivirusEnabled, RealTimeProtectionEnabled, AMRunningMode
```

正常な出力例：
```
AntivirusEnabled RealTimeProtectionEnabled AMRunningMode
---------------- ------------------------- -------------
            True                      True Normal
```

### PowerShell実行ポリシーの設定

npmでインストールしたCLIツール（claude等）を使用するには、PowerShellの実行ポリシーを変更する必要があります:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

確認を求められたら `Y` を入力してください。

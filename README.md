# Windows PC セットアップ自動化スクリプト

Windows PCを定期的にリセットして、クリーンな状態を保つための環境復元スクリプト集。

## 目的

- PCに何が入っているか分からなくなる状況を防ぐ
- 定期的なPCリセット後、以前の環境を素早く復元
- 必要なツール・アプリケーションを自動インストール

## 使い方

### 1. PCリセット後の環境復元

管理者権限でコマンドプロンプトまたはPowerShellを開き、以下を実行:

```batch
my_setup.bat
```

スクリプトが自動的に以下をインストールします:

- **ブラウザ・基本ツール**: Chrome, 7-Zip, WinMerge
- **エディタ**: サクラエディタ, VS Code, Cursor
- **開発環境**: Docker Desktop, Node.js 22, Python 3.11
- **AI CLIツール**: Claude Code, Google Generative AI CLI
- **Git関連**: Sourcetree, TortoiseGit, TeraTerm

### 2. オプションパッケージ

必要に応じて `my_setup.bat` 内のコメントアウトを外して使用:

- GitHub CLI
- Amazon Kindle
- Postman
- NVM for Windows
- R
- Rust

## インストール後

すべてのインストールが完了したら、PCを再起動してください。

## 要件

- Windows 10/11
- winget (Windows Package Manager) が利用可能であること
  - Windows 11では標準搭載
  - Windows 10では Microsoft Store から「アプリ インストーラー」をインストール

## カスタマイズ

自分の環境に合わせて `my_setup.bat` を編集してください。

### パッケージの追加

```batch
winget install --id パッケージID -e
```

### パッケージIDの検索

```batch
winget search パッケージ名
```

## ライセンス

このスクリプトは個人使用を目的としています。

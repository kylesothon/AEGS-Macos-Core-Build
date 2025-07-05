# 🍎 Official Aegisum macOS Core Wallet Compiler

**Automated build system for Aegisum Qt Core wallet on macOS with daily auto-updates.**

This repository creates professional DMG installers for the Aegisum Qt wallet on macOS. The system automatically monitors the official Aegisum core repository and builds new releases when updates are detected.

## ✨ Features

- 🔄 **Daily automated builds** when Aegisum Core updates are detected
- 🍎 **Professional macOS integration** with native `.app` bundles and DMG installers
- 🚀 **GitHub Actions CI/CD** with automatic artifact storage
- 🔧 **Advanced compatibility** with Boost, Berkeley DB, and Qt5 patches
- 📦 **Universal compatibility** for Intel and Apple Silicon Macs

## 🚀 Quick Start

### Download Ready-Built Wallet
1. Go to [Actions tab](../../actions) → "Official Aegisum macOS Core Wallet Auto-Builder"
2. Click the latest successful build (green checkmark ✅)
3. Scroll down to "Artifacts" and download the ZIP file
4. Extract and double-click `Aegisum-Wallet-macOS.dmg`
5. Drag `Aegisum-Qt.app` to Applications folder

### Trigger New Build
1. Go to [Actions tab](../../actions) → "Official Aegisum macOS Core Wallet Auto-Builder"
2. Click "Run workflow" → Enable "Force build" if needed → "Run workflow"
3. Wait 10-12 minutes for completion
4. Download from Artifacts section

## 📦 What You Get

- **`Aegisum-Wallet-macOS.dmg`** - Professional installer
- **`Aegisum-Qt.app`** - Native macOS app bundle
- **`aegisumd`** - Daemon binary
- **`aegisum-cli`** - Command line interface
- **`aegisum-tx`** - Transaction utility

## 🔧 Requirements

- **Building**: macOS 12+ with Xcode Command Line Tools
- **Running**: macOS 10.14+ (Intel or Apple Silicon)
- **Dependencies**: Auto-installed via Homebrew

## ⚙️ Auto-Updates

- **Daily builds** at 6:50 AM UTC when Aegisum Core updates
- **Manual triggers** available anytime from Actions tab
- **30-day artifact retention** for all builds

## 🔄 Integration Guide

See [DEVELOPER_INTEGRATION.md](DEVELOPER_INTEGRATION.md) for complete instructions to integrate this into your official Aegisum repository.

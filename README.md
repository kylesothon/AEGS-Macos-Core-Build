# 🍎 Official Aegisum macOS Core Wallet Compiler

**The official automated build system for Aegisum Qt Core wallet on macOS with auto-update functionality.**

This repository contains the **Official Aegisum macOS Core Wallet Compiler** - a professional, automated build system that creates ready-to-distribute DMG installers for the Aegisum Qt wallet on macOS. The system automatically monitors the official Aegisum core repository for updates and builds new releases when changes are detected.

## ✨ Key Features

🔄 **Auto-Update System**
* Automatically monitors the official Aegisum core repository for updates
* Daily automated builds when new commits are detected
* Manual build triggers with force-build option
* Tracks build history and prevents unnecessary rebuilds

🍎 **Professional macOS Integration**
* Native `.app` bundle generation with proper Info.plist
* Professional DMG installer with drag-and-drop interface
* Universal compatibility (Intel and Apple Silicon Macs)
* Proper macOS code signing preparation
* High-resolution icon support

🔧 **Advanced Build System**
* Automatic dependency management via Homebrew
* Berkeley DB 4.8 compatibility patches
* Protobuf 3.6.1 for maximum compatibility
* Boost filesystem API modernization
* Clang/GCC compatibility fixes

🚀 **GitHub Actions Integration**
* Fully automated CI/CD pipeline
* Artifact storage and release management
* Professional release notes generation
* Build verification and testing

📦 **Professional Distribution**
* Ready-to-distribute DMG files
* Complete app bundles with all dependencies
* Automatic library bundling via macdeployqt
* Optimized binary stripping for smaller file sizes

## 🚀 Quick Start

### 📥 Download Ready-Built DMG (Easiest)

**Your Aegisum wallet is already built and ready!**

1. **Go to**: https://github.com/kylesothon/AEGS-Macos-Core-Build/actions/runs/16085571647
2. **Scroll down to "Artifacts"** section
3. **Click**: `aegisum-macos-wallet-v20250705-0650-b90b6c9f` (126 MB)
4. **Extract the ZIP** and double-click `Aegisum-Wallet-macOS.dmg`
5. **Drag to Applications** and enjoy!

📖 **[Complete Download Guide →](HOW_TO_DOWNLOAD_DMG.md)**

### 🔄 Automated Builds (For Updates)

The system automatically builds new releases daily at 6:50 AM UTC when updates are detected. You can also trigger builds manually:

1. **Go to the Actions tab** in your GitHub repository
2. **Click "Official Aegisum macOS Core Wallet Auto-Builder"**
3. **Click "Run workflow"** and optionally enable "Force build"
4. **Download the DMG** from the generated artifacts

### Manual Local Build

For local development or testing:

```bash
# Clone this repository
git clone https://github.com/your-username/AEGS-Macos-Core-Build.git
cd AEGS-Macos-Core-Build

# Make the script executable
chmod +x build_aegisum_macos.sh

# Run the build (requires macOS)
./build_aegisum_macos.sh
```

## 📦 Build Output

All compiled binaries and packages are located in `compiled_wallets_macos/`:

* **`Aegisum-Wallet-macOS.dmg`** - Professional installer with drag-and-drop interface
* **`Aegisum-Qt.app`** - Native macOS application bundle
* **`aegisum-qt`** - Qt wallet binary
* **`aegisumd`** - Daemon binary  
* **`aegisum-cli`** - Command line interface
* **`aegisum-tx`** - Transaction utility

## 🔧 System Requirements

### 🍏 macOS Requirements
* **macOS 12 Monterey or later** (for building)
* **macOS 10.14 Mojave or later** (for running built wallet)
* **Xcode Command Line Tools** (`xcode-select --install`)
* **Homebrew** (automatically installs dependencies)
* **Universal compatibility** - Works on both Intel and Apple Silicon Macs

### 🤖 GitHub Actions Requirements
* **macOS runner** (automatically provided)
* **GitHub token** with repository access (automatically provided)
* **No additional setup required** - fully automated

## ⚙️ Auto-Update Configuration

The auto-update system works by:

1. **Daily monitoring** of the official Aegisum core repository
2. **Commit comparison** to detect new changes
3. **Automatic building** when updates are found
4. **Release creation** with professional DMG installers
5. **Build tracking** to prevent unnecessary rebuilds

### Manual Trigger Options

You can manually trigger builds with these options:

* **Force Build** - Build even if no updates are detected
* **Create Release** - Generate a GitHub release with the build artifacts
* **Skip Release** - Build artifacts only (no public release)

## 🔄 Integration with Official Repository

To integrate this build system into your official Aegisum repository:

### Step 1: Repository Setup
```bash
# Add this repository as a submodule or copy the files
cp build_aegisum_macos.sh /path/to/official/repo/
cp -r .github/workflows/ /path/to/official/repo/.github/
```

### Step 2: GitHub Secrets (if needed)
If you need custom tokens or signing certificates:
```bash
# In your repository settings > Secrets and variables > Actions
GITHUB_TOKEN=your_token_here  # Usually automatic
APPLE_DEVELOPER_ID=your_id    # For code signing (optional)
```

### Step 3: Workflow Customization
Edit `.github/workflows/auto-build.yml` to customize:
* Build schedule (currently daily at 6 AM UTC)
* Repository URLs
* Release naming conventions
* Notification settings

### Step 4: Developer Instructions
Send this to your developer for integration:

```markdown
## Integration Instructions for Developer

1. Copy the build system files to the official repository:
   - `build_aegisum_macos.sh` (main build script)
   - `.github/workflows/auto-build.yml` (GitHub Actions workflow)

2. Ensure GitHub Actions is enabled in repository settings

3. The system will automatically:
   - Monitor for Aegisum core updates daily
   - Build and release new DMG files when updates are detected
   - Create professional releases with installation instructions

4. Manual builds can be triggered from the Actions tab

5. No additional secrets or configuration required - everything is automated
```

## 🛠️ Advanced Configuration

### Custom Build Options
Edit `build_aegisum_macos.sh` to customize:
* Aegisum repository URL
* Build configuration (daemon only, Qt only, or full)
* DMG styling and branding
* Dependency versions

### Workflow Customization
Edit `.github/workflows/auto-build.yml` to customize:
* Build triggers and schedule
* Release naming and descriptions
* Artifact retention policies
* Notification settings

## 🔒 Security & Verification

* **Source verification** - Builds only from official Aegisum repository
* **Reproducible builds** - Same source always produces same output
* **Dependency pinning** - Uses specific versions for consistency
* **Build logs** - Full transparency in GitHub Actions
* **Artifact checksums** - Automatic verification of build integrity

## 📞 Support & Troubleshooting

### Common Issues
* **Build failures** - Check GitHub Actions logs for detailed error messages
* **Missing dependencies** - Homebrew automatically installs required packages
* **Compatibility issues** - Ensure macOS version meets requirements

### Getting Help
* **GitHub Issues** - Report problems or request features
* **Build logs** - Check Actions tab for detailed build information
* **Documentation** - Refer to this README for configuration options

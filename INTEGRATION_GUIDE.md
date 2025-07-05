# 🔧 Developer Integration Guide

## Official Aegisum macOS Core Wallet Compiler Integration

This guide provides step-by-step instructions for integrating the Official Aegisum macOS Core Wallet Compiler into your official Aegisum repository.

## 📋 Prerequisites

Before integration, ensure you have:

- [ ] **Admin access** to the official Aegisum repository
- [ ] **GitHub Actions enabled** in the repository settings
- [ ] **Basic understanding** of GitHub workflows
- [ ] **macOS environment** for local testing (optional)

## 🚀 Integration Steps

### Step 1: Copy Build System Files

Copy these files from this repository to your official Aegisum repository:

```bash
# Required files to copy:
build_aegisum_macos.sh              # Main build script
.github/workflows/auto-build.yml    # GitHub Actions workflow
last_built_commit.txt               # Build tracking file
test_build.sh                       # Testing script (optional)
```

**File structure in your official repository:**
```
your-official-repo/
├── .github/
│   └── workflows/
│       └── auto-build.yml          # Auto-build workflow
├── build_aegisum_macos.sh          # Main build script
├── last_built_commit.txt           # Build tracking
├── test_build.sh                   # Testing script
└── README.md                       # Update with build info
```

### Step 2: Repository Settings Configuration

1. **Enable GitHub Actions**
   - Go to repository Settings → Actions → General
   - Ensure "Allow all actions and reusable workflows" is selected
   - Save changes

2. **Workflow Permissions**
   - Go to Settings → Actions → General → Workflow permissions
   - Select "Read and write permissions"
   - Check "Allow GitHub Actions to create and approve pull requests"
   - Save changes

3. **Repository Secrets** (Optional)
   - Go to Settings → Secrets and variables → Actions
   - Add secrets if needed for code signing:
     ```
     APPLE_DEVELOPER_ID=your_developer_id
     APPLE_CERTIFICATE_PASSWORD=your_cert_password
     ```

### Step 3: Workflow Customization

Edit `.github/workflows/auto-build.yml` to match your repository:

```yaml
# Update repository references if needed
- name: Check for Aegisum Core Updates
  run: |
    # Change this URL if your core repository is different
    LATEST_COMMIT=$(curl -s https://api.github.com/repos/Aegisum/aegisum-core/commits/main | jq -r '.sha')
```

**Customizable settings:**
- **Build schedule**: Currently daily at 6 AM UTC
- **Repository URL**: Points to official Aegisum core
- **Release naming**: Automatic versioning with timestamps
- **Artifact retention**: 30 days by default

### Step 4: Testing the Integration

1. **Local Testing** (if you have macOS):
   ```bash
   # Test the build system
   ./test_build.sh
   
   # Run a local build (optional)
   ./build_aegisum_macos.sh
   ```

2. **GitHub Actions Testing**:
   - Go to Actions tab in your repository
   - Click "Official Aegisum macOS Core Wallet Auto-Builder"
   - Click "Run workflow"
   - Enable "Force build" for initial test
   - Monitor the build progress

### Step 5: Documentation Updates

Update your repository's README.md to include information about the macOS build system:

```markdown
## 🍎 macOS Builds

Automated macOS builds are available through our Official Aegisum macOS Core Wallet Compiler:

- **Automatic builds**: Daily when updates are detected
- **Manual builds**: Available through GitHub Actions
- **Download**: Check the [Releases](../../releases) page for DMG files

### Quick Download
1. Go to [Releases](../../releases)
2. Download `Aegisum-Wallet-macOS.dmg`
3. Open DMG and drag to Applications folder
```

## ⚙️ Configuration Options

### Build Schedule Customization

To change the build schedule, edit the `cron` expression in `auto-build.yml`:

```yaml
schedule:
  - cron: '0 6 * * *'  # Daily at 6 AM UTC
  
# Examples:
# - cron: '0 */6 * * *'    # Every 6 hours
# - cron: '0 12 * * 1'     # Weekly on Monday at noon
# - cron: '0 0 1 * *'      # Monthly on the 1st
```

### Release Customization

Customize release creation in the workflow:

```yaml
- name: Create GitHub Release
  with:
    tag_name: ${{ needs.check-updates.outputs.version_tag }}
    name: "🍎 Your Custom Release Name"
    body: |
      Your custom release description
      
      ### Custom sections...
```

### Build Options

Modify build behavior in `build_aegisum_macos.sh`:

```bash
# CI defaults (line ~50)
BUILD_CHOICE="2"        # 1=daemon, 2=full, 3=qt-only
STRIP_BIN="y"          # Strip binaries for smaller size
MAKE_DMG="y"           # Create DMG installer
```

## 🔄 Auto-Update System

The auto-update system works as follows:

1. **Daily Check**: Runs at 6 AM UTC every day
2. **Commit Comparison**: Compares latest Aegisum core commit with last built
3. **Conditional Build**: Only builds if new commits are detected
4. **Release Creation**: Automatically creates GitHub releases
5. **Tracking**: Updates `last_built_commit.txt` to prevent rebuilds

### Manual Triggers

Users can manually trigger builds with options:

- **Force Build**: Build even without updates
- **Create Release**: Generate public release (default: true)
- **Skip Release**: Build artifacts only

## 🛠️ Maintenance

### Regular Maintenance Tasks

1. **Monitor build logs** for any failures
2. **Update dependencies** in the build script if needed
3. **Review releases** to ensure quality
4. **Update documentation** as the system evolves

### Troubleshooting Common Issues

**Build Failures:**
- Check GitHub Actions logs for detailed error messages
- Verify Aegisum core repository accessibility
- Ensure all dependencies are properly specified

**Missing Releases:**
- Check if `create_release` input is set to `true`
- Verify GitHub token permissions
- Review workflow file syntax

**Outdated Builds:**
- Check if auto-update schedule is working
- Verify `last_built_commit.txt` is being updated
- Review commit comparison logic

## 📞 Support

### Getting Help

1. **Check build logs** in GitHub Actions for detailed error information
2. **Review this guide** for configuration options
3. **Test locally** using `test_build.sh` on macOS
4. **Create issues** in the repository for persistent problems

### Reporting Issues

When reporting issues, include:

- **Build logs** from GitHub Actions
- **Error messages** (full text)
- **Repository configuration** (workflow file)
- **Expected vs actual behavior**

## ✅ Integration Checklist

Use this checklist to ensure proper integration:

- [ ] Files copied to official repository
- [ ] GitHub Actions enabled and configured
- [ ] Workflow permissions set correctly
- [ ] Initial test build completed successfully
- [ ] Documentation updated
- [ ] Team notified about new build system
- [ ] Release process documented
- [ ] Monitoring plan established

## 🎯 Success Metrics

After integration, you should see:

- [ ] **Automated daily builds** when Aegisum core updates
- [ ] **Professional DMG releases** in the Releases section
- [ ] **Consistent build artifacts** with proper naming
- [ ] **Build history tracking** in `last_built_commit.txt`
- [ ] **User-friendly installation** process via DMG files

---

**🎉 Congratulations!** Your Official Aegisum macOS Core Wallet Compiler is now integrated and ready to provide automated, professional macOS builds for your users.
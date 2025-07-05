#!/bin/bash

# Test script for the Official Aegisum macOS Core Wallet Compiler
# This script performs basic validation without running the full build

set -e

GREEN="\033[0;32m"
RED="\033[0;31m"
CYAN="\033[0;36m"
YELLOW="\033[1;33m"
RESET="\033[0m"

echo -e "${CYAN}🧪 Testing Official Aegisum macOS Core Wallet Compiler${RESET}"
echo -e "${CYAN}=================================================${RESET}"

# Check if we're on macOS
if [[ "$(uname)" != "Darwin" ]]; then
    echo -e "${RED}❌ This build system requires macOS${RESET}"
    exit 1
fi

echo -e "${GREEN}✅ Running on macOS $(sw_vers -productVersion)${RESET}"

# Check for required tools
echo -e "\n${CYAN}🔍 Checking required tools...${RESET}"

# Check for Xcode Command Line Tools
if ! xcode-select -p &> /dev/null; then
    echo -e "${RED}❌ Xcode Command Line Tools not installed${RESET}"
    echo -e "${YELLOW}💡 Run: xcode-select --install${RESET}"
    exit 1
fi
echo -e "${GREEN}✅ Xcode Command Line Tools installed${RESET}"

# Check for Homebrew
if ! command -v brew &> /dev/null; then
    echo -e "${RED}❌ Homebrew not installed${RESET}"
    echo -e "${YELLOW}💡 Install from: https://brew.sh${RESET}"
    exit 1
fi
echo -e "${GREEN}✅ Homebrew installed${RESET}"

# Check build script
if [[ ! -f "build_aegisum_macos.sh" ]]; then
    echo -e "${RED}❌ build_aegisum_macos.sh not found${RESET}"
    exit 1
fi

if [[ ! -x "build_aegisum_macos.sh" ]]; then
    echo -e "${YELLOW}⚠️  Making build script executable...${RESET}"
    chmod +x build_aegisum_macos.sh
fi
echo -e "${GREEN}✅ Build script ready${RESET}"

# Check GitHub Actions workflow
if [[ ! -f ".github/workflows/auto-build.yml" ]]; then
    echo -e "${RED}❌ GitHub Actions workflow not found${RESET}"
    exit 1
fi
echo -e "${GREEN}✅ GitHub Actions workflow ready${RESET}"

# Test Aegisum repository accessibility
echo -e "\n${CYAN}🌐 Testing Aegisum repository access...${RESET}"
if curl -s --head https://github.com/Aegisum/aegisum-core.git | head -n 1 | grep -q "200 OK"; then
    echo -e "${GREEN}✅ Aegisum repository accessible${RESET}"
else
    echo -e "${RED}❌ Cannot access Aegisum repository${RESET}"
    exit 1
fi

# Check available disk space
echo -e "\n${CYAN}💾 Checking disk space...${RESET}"
AVAILABLE_GB=$(df -g . | tail -1 | awk '{print $4}')
if [[ $AVAILABLE_GB -lt 10 ]]; then
    echo -e "${RED}❌ Insufficient disk space (${AVAILABLE_GB}GB available, 10GB+ recommended)${RESET}"
    exit 1
fi
echo -e "${GREEN}✅ Sufficient disk space (${AVAILABLE_GB}GB available)${RESET}"

# Architecture detection
echo -e "\n${CYAN}🏗️  System architecture...${RESET}"
ARCH=$(uname -m)
if [[ "$ARCH" == "arm64" ]]; then
    echo -e "${GREEN}✅ Apple Silicon (arm64) detected${RESET}"
elif [[ "$ARCH" == "x86_64" ]]; then
    echo -e "${GREEN}✅ Intel (x86_64) detected${RESET}"
else
    echo -e "${YELLOW}⚠️  Unknown architecture: $ARCH${RESET}"
fi

echo -e "\n${GREEN}🎉 All tests passed! The build system is ready to use.${RESET}"
echo -e "\n${CYAN}📋 Next steps:${RESET}"
echo -e "   1. Run ${YELLOW}./build_aegisum_macos.sh${RESET} for local build"
echo -e "   2. Or use GitHub Actions for automated builds"
echo -e "   3. Check the README.md for detailed instructions"

echo -e "\n${CYAN}🤖 For automated builds:${RESET}"
echo -e "   • Go to GitHub Actions tab"
echo -e "   • Run 'Official Aegisum macOS Core Wallet Auto-Builder'"
echo -e "   • Download DMG from releases"
$DEPLOY_DIR = "C:\nginx\html\stellartrack"
$TEMP_CLONE = "$env:USERPROFILE\StellarTrack_Temp"
$BACKUP_DIR = "C:\nginx\html\stellartrack_backup"

# Cleanup previous temp
Remove-Item $TEMP_CLONE -Recurse -Force -ErrorAction SilentlyContinue

# Clone fresh copy
git clone https://github.com/rishabkm/StellarTrack.git $TEMP_CLONE

# Create backup
if (Test-Path $DEPLOY_DIR) {
    Copy-Item $DEPLOY_DIR $BACKUP_DIR -Recurse -Force
    Write-Host "Created backup at $BACKUP_DIR"
}

# Deploy new version
Remove-Item $DEPLOY_DIR -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path $DEPLOY_DIR | Out-Null
Copy-Item "$TEMP_CLONE\site\*" $DEPLOY_DIR -Recurse -Force

# Verify deployment
$indexContent = Get-Content "$DEPLOY_DIR\index.html" -Raw
Write-Host "Deployed index.html (first 50 chars): $($indexContent.Substring(0,50))..."

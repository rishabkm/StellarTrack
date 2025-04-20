$DEPLOY_DIR = "C:\nginx\html\stellartrack"
$BACKUP_DIR = "C:\nginx\html\stellartrack_backup"
$WORKSPACE_DIR = "C:\ProgramData\Jenkins\.jenkins\workspace\automation"

# Create backup
if (Test-Path $DEPLOY_DIR) {
    Copy-Item $DEPLOY_DIR $BACKUP_DIR -Recurse -Force
    Write-Host "Created backup at $BACKUP_DIR"
}

# Deploy new version
Remove-Item $DEPLOY_DIR -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path $DEPLOY_DIR | Out-Null
Copy-Item "$WORKSPACE_DIR\site\*" $DEPLOY_DIR -Recurse -Force

# Verify deployment
$indexContent = Get-Content "$DEPLOY_DIR\index.html" -Raw
Write-Host "Deployed index.html (first 50 chars): $($indexContent.Substring(0,50))..."

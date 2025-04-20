<<<<<<< HEAD
$DEPLOY_DIR = "C:\nginx\html\stellartrack"
$BACKUP_DIR = "C:\nginx\html\stellartrack_backup"

if (Test-Path $BACKUP_DIR) {
    Remove-Item $DEPLOY_DIR -Recurse -Force -ErrorAction SilentlyContinue
    Copy-Item $BACKUP_DIR $DEPLOY_DIR -Recurse -Force
    Write-Host "Rollback complete ✅"
} else {
    Write-Host "❌ No backup found for rollback"
}
=======
$DEPLOY_DIR = "C:\nginx\html\stellartrack"
$BACKUP_DIR = "C:\nginx\html\stellartrack_backup"

if (Test-Path $BACKUP_DIR) {
    Remove-Item $DEPLOY_DIR -Recurse -Force -ErrorAction SilentlyContinue
    Copy-Item $BACKUP_DIR $DEPLOY_DIR -Recurse -Force
    Write-Host "Rollback complete ✅"
} else {
    Write-Host "❌ No backup found for rollback"
}
>>>>>>> 829892dc2cb97bdc2baab9bab4e88b4e1a76e347

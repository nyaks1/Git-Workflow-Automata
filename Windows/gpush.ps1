#This is for when you want to use PowerShell in Windows
#Just get GitBash and do it the linux way

# 1. Check if a commit message was provided
if (-not $args[0]) {
    Write-Host "Error: Yo, you forgot the commit message!" -ForegroundColor Red
    Write-Host "Usage: g \"your message here\"" -ForegroundColor Cyan
    exit
}

$msg = $args[0]

# 2. The Git Workflow
Write-Host "Staging all changes..." -ForegroundColor Yellow
git add .

Write-Host "Committing with message: \"$msg\"" -ForegroundColor Yellow
git commit -m $msg

Write-Host "Pushing to remote..." -ForegroundColor Yellow
if (git push) {
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Green
    Write-Host "   Successful!     " -ForegroundColor Green
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Green
} else {
    Write-Host "Push failed. Check your connection or merge conflicts." -ForegroundColor Red
}
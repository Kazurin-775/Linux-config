# oh-my-posh
(@(& 'oh-my-posh.exe' init pwsh --config="$env:POSH_THEMES_PATH\powerlevel10k_classic.omp.json" --print) -join "`n") | Invoke-Expression

# PSReadLine
if ($host.Name -eq 'ConsoleHost') {
    Set-PSReadLineOption -EditMode Emacs
}

# Start new Windows Terminal as Adminstrator
function wtsu {
    Start-Process wt.exe -ArgumentList @('-d', "$PWD") -verb runAs
}

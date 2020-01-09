$relPathToRootFolders = '..'
$buildList = 'ms_gateway1', 'ms_node1', 'ms_node2';
$d_nodes = 'gateway1', 'node1', 'node2';

$scripts = 
    'docker-build.ps1', 
    'docker-remove.ps1', 
    'docker-run.ps1';

$dockerCommands = 'docker rm -f', ''

$d = $PSScriptRoot

function Cmd($id) {

    foreach ($item in $buildList) {
        Set-Location "$d\$relPathToRootFolders\$item"
        $s = "$($item)\$($scripts[$id])"
        
        Write-Host "$d->$s"
        $ScriptPath = "$d\$relPathToRootFolders\$s"

        & $ScriptPath
    }
}

function D($id) {

    foreach ($item in $d_nodes) {
        $cmd = "$($dockerCommands[$id]) $($item)"
        Write-Host "echo $cmd->$s"
        # $ScriptPath = "$d\..\$s"
        # & $ScriptPath
        Invoke-Expression $cmd
    }
}

Set-Location $d

Cmd(0) #build
# Cmd(1) #remove
# Cmd(2) #run

# D(0)
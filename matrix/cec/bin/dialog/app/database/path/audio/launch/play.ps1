# Here is a PowerShell script named `launchAudioPlay.ps1` that 
# plays an audio file using a built-in Windows media player 
# COM object or the `MediaPlayer` class. It launches audio 
# playback from a specified local file path:

# ```powershell
# launchAudioPlay.ps1 - Play audio file in PowerShell

# Prompt user to enter the path of the audio file to play
$audioPath = Read-Host "Enter full path to audio file (e.g., C:\Music\song.mp3)"

if (-Not (Test-Path -Path $audioPath -PathType Leaf)) {
    Write-Host "Audio file not found at path: $audioPath"
    exit
}

try {
    # Create Windows Media Player COM object
    $wmp = New-Object -ComObject WMPlayer.OCX

    # Set the media file
    $media = $wmp.newMedia($audioPath)
    $wmp.currentPlaylist.clear()
    $wmp.currentPlaylist.appendItem($media)

    # Play audio
    $wmp.controls.play()
    Write-Host "Playing audio: $audioPath"
    
    # Wait while audio plays
    while ($wmp.playState -eq 3) { # 3 means 'Playing'
        Start-Sleep -Seconds 1
    }
    Write-Host "Audio playback finished."

    # Clean up
    $wmp.close()
}
catch {
    Write-Error "Error playing audio: $_"
}
# ```

# Usage:
# - Save it as `launchAudioPlay.ps1`.
# - Run it in PowerShell and enter the full path to the audio file when prompted.
# - The script uses Windows Media Player COM to play the audio and waits until playback finishes.

# This is a simple and effective way to launch audio playback directly from PowerShell [general PowerShell COM audio capabilities].
# audio play 8:39 start path current after stop

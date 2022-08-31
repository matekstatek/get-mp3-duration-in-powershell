# Get-MP3DurationFromSpecificDirectiory

## Description

The script gets all *.mp3 childitem (with no recurse parameter used) from directory, calculates the duration of each one and sums it to general duration.
No libraries needed.

## Examples 

```
.\Get-MP3DurationFromSpecificDirectory.ps1 -Path '.\some_audiobook\'
.\Get-MP3DurationFromSpecificDirectory.ps1 # it takes $path from PWD (".\")
```

Output:
```
Looking for mp3 files in .\Bolesław Prus - Lalka\ ...

All mp3s:

Name                Duration
----                --------
Lalka - tom I.mp3   11:04:50
Lalka - tom II.mp3  12:12:38
Lalka - tom III.mp3 10:46:16

Duration of all mp3 in directory: 34:03:44
```

## Author

[@MatekStatek](https://twitter.com/matekstatek)

## Version History

* 1.0
    * All done

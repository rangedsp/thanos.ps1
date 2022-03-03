# thanos.ps1

Script to randomly delete half the files in a folder.

```
thanos.ps1
    $Path <String>
    [-SoulStone]
    [-Ratio <Double>]
    [-Resolution <Int32>]
    [-Silent]
    [-StrictRatio]
```

Examples:

1. To delete half the files randomly in folder *C:\Users\rangedsp\Pictures\ThanosRule34*

   `.\thanos.ps1 -path "C:\Users\rangedsp\Pictures\ThanosRule34"` 
2. Move half the files randomly to folder *C:\Users\rangedsp\Pictures\ThanosRule34\recovery*

   `.\thanos.ps1 -path "C:\Users\rangedsp\Pictures\ThanosRule34" -SoulStone 1` 
4. Deletes 90% of the files randomly in folder *C:\Users\rangedsp\Pictures\ThanosRule34\recovery*

   `.\thanos.ps1 -path "C:\Users\rangedsp\Pictures\ThanosRule34" -Ratio 0.1` 
5. Deletes half the files randomly in folder *C:\Users\rangedsp\Pictures\ThanosRule34*, but ensures at least 1/2 (or whatever the set ratio) of the files will survive.

   `.\thanos.ps1 -path "C:\Users\rangedsp\Pictures\ThanosRule34" -StrictRatio 1`


1. notice there is a grep 

```
    Get-Service | Where-Object { $_.Status -eq 'Running' } | Out-String -Stream | Select-String -Pattern 'remote'
```
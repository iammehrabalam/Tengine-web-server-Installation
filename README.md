# Tengine web server Installation
[Tengine](http://tengine.taobao.org/) is a web server and fork of Nginx. Tengine having more feature than Nginx like
- Health check of upstreaming servers
- Monitor status of request 
- and many more

## Installation
```
git clone https://github.com/mehrabalam/Tengine-web-server-Installation.git
cd Tengine-web-server-Installation
sh tengine_setup.sh
```
# Nginx Vs Tengine
**HARDWARE : 1GB RAM 1 CORE CPU**   
**APP LEVEL PROCESSING:   no processing in app simply return 200 in response**  
**TOTAL NUMBER OF REQUEST :  12000**  
**TOOL USED FOR TESTING : Apache benchmark (ab)**  
**worker process  :  4**  
**worker connection: 1024**  
**file open limit : 20000**  

![](https://raw.githubusercontent.com/mehrabalam/Tengine-web-server-Installation/master/comparision.png)

# Example to monitor health and request status
see example.conf
